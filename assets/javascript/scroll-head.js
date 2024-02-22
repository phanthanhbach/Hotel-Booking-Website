    var scrollIcon = document.getElementById("scroll-head");
    var navbar = document.querySelector(".navbar");

    window.onscroll = function() {
        if (document.documentElement.scrollTop > 1600)
        {
            scrollIcon.style.opacity= "1";
        } else {
            scrollIcon.style.opacity= "0";
        }
        if (window.pageYOffset >= document.getElementById("header").clientHeight) {
            navbar.classList.add("sticky")
        } else {
            navbar.classList.remove("sticky");
        }
    };
    scrollIcon.onclick = function() {
        scrollTo(0,0);
    }