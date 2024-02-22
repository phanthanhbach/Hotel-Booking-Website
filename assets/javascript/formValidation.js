function Validator(options) {

    // Tìm ra thẻ cha của thẻ input
    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }
    var selectorRules = {};

    // function thực hiện validate
    function valiDate(inputElement, rule) {
        var errorElement = getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);
        
        //input.value là text của input
        var errorMessage;

        // lấy ra các rules của selector
        var rules = selectorRules[rule.selector];

        // lặp qua từng rules và kiểm tra
        // nếu có lỗi thì dừng việc kiểm tra trong cùng 1 selector
        // VD: email có lỗi đầu là chưa nhập trường này thì sẽ ngưng vòng lặp kiểm tra luôn, lỗi ko phải email sẽ ko hiển thị
        for (var i = 0; i < rules.length; ++i) {
            switch (inputElement.type) {
                case 'radio':
                case 'checkbox':
                    errorMessage = rules[i] (
                        formElement.querySelector(rule.selector + ':checked')
                    ); break;
                default:
                    errorMessage = rules[i](inputElement.value);
            }
            if (errorMessage) break;
        }
        
        //vì khi ko nhập gì hết sẽ trả về "Vui lòng nhập trường này" -> errorMessage lưu thông tin trả về là dạng string
        // với js, khi biến lưu dạng string sẽ trả về true
        // do đó trường hợp này errorMessage là true
        if(errorMessage) // errorMessage == true: 
        {
            errorElement.innerText = errorMessage;
            inputElement.classList.add('invalid');
        }
        else {
            errorElement.innerText = '';
            inputElement.classList.remove('invalid');
        }
        return !errorMessage;
    }
    
    // lấy tất cả phần tử có trong class form
    var formElement = document.querySelector(options.form);
    if(formElement)
    {

    // Bỏ đi hành vi mặc định của button submit - lắng nghe sự kiện onsubmit
    formElement.onsubmit = function(e) {
        e.preventDefault();
        var isFormValid = true;

        // Lắp qua từng rules và validate
        options.rules.forEach(function(rule) {
            var inputElement = formElement.querySelector(rule.selector);
            var isValid = valiDate(inputElement, rule);
            if (!isValid) {
                isFormValid = false;
            }
        });

        if (isFormValid) {
            // TH submit với js
            if (typeof options.onSubmit === 'function') {
                var enableInputs = formElement.querySelectorAll('[name]');
                var formValues = Array.from(enableInputs).reduce(function(values, input) {
                    switch(input.type) {
                        case 'radio':
                            values[input.name] = formElement.querySelector('input[name="'+ input.name +'"]:checked').value;
                            break;
                        case 'checkbox':
                            if (!input.matches(':checked')) {
                                values[input.name] = '';
                                return values;
                            }
                            if (!Array.isArray(values[input.name])) {
                                values[input.name] = [];
                            }
                            values[input.name].push(input.value);
                            break;
                        case 'file':
                            values[input.name] = input.files;
                            break;
                        default: 
                            values[input.name] = input.value;
                    }
                    return values;
                }, {});
                options.onSubmit(formValues);
            } 
            // TH submit với hành vi mặc định của HTML
            else {
                formElement.submit();
            }
        }
    }    


    // Xử lý lặp qua mỗi phần tử của form-add (lắng nghe sự kiện blur, input)
    options.rules.forEach(function (rule) {

        // Lưu lại các rules cho mỗi input
        if (Array.isArray(selectorRules[rule.selector])) {
            selectorRules[rule.selector].push(rule.test);
        } else {
            selectorRules[rule.selector] = [rule.test];
        }

        // lấy ra đối số truyền vào rules của đối tượng options
        var inputElements = formElement.querySelectorAll(rule.selector);

        Array.from(inputElements).forEach(function (inputElement) {
            // xử lí TH blur khỏi input
            inputElement.onblur = function() {
                valiDate(inputElement, rule);
            }

            // xử lí khi người dùng nhập input
            inputElement.oninput = function() {
                var errorElement =  getParent(inputElement, options.formGroupSelector).querySelector(options.errorSelector);
                errorElement.innerText = '';
                inputElement.classList.remove('invalid');
            }
        });
    });
}
}

Validator.isRequired = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
           return value ? undefined : message;
        }
    };
}
Validator.minLength = function(selector, min) {
    return {
        selector: selector,
        test: function(value) {
            return value.length >= min ? undefined : `Vui lòng nhập tối thiểu ${min} kí tự`;
        }
    };
}
Validator.maxNumber = function(selector, message) {
    return {
        selector: selector,
        test: function(value) {
            return value <= 100 ? undefined : message;
        }
    };
}
Validator.isNumber = function(selector) {
    return {
        selector: selector,
        test: function(value) {
            return !isNaN(value) == true ? undefined : `Chỉ được nhập số liệu ở đây`;
        }
    };
}
Validator.isPhoneNumber = function(selector) {
    return {
        selector: selector,
        test: function(value) {
            return value.length == 10 && !isNaN(value) == true ? undefined : `Số điện thoại bao gồm 10 số`;
        }
    };
}
Validator.isSelected = function (selector, message) {
    return {
        selector: selector,
        test: function(value) {
            return value != 0 ? undefined: `Vui lòng chọn ${message} tại đây`; 
        }
    };
}
Validator.isEmail = function(selector) {
    return {
        selector: selector,
        test: function(value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : 'Vui lòng nhập email hợp lệ';
        }
    };
}
Validator.isExisted = function(selector, arrName, message) {
    return {
        selector: selector,
        test: function(value) {
            for (let i = 0; i < arrName.length; i++) {
                if ((arrName[i] === value)) {
                    return message;
                }
            }
            return undefined;
        }
    };
}
