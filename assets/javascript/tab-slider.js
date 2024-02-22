const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const tabs = $$(".tab-item");
const panes = $$(".tab-pane");

const tabActive = $(".tab-item.active");
const line = $(".tabs .line");

 // hiển thị mặc định khi vừa vào trang phòng
  line.style.width = tabActive.offsetWidth + "px";

  var RoomInputs = document.querySelectorAll(".room-container input");
  var RoomTextAreas = document.querySelectorAll(".room-container textarea");
  var InvalidMessage = document.querySelectorAll(".invalid-message");

  function clearData(currentElement) {
    currentElement.forEach(function(inputElement) {
      inputElement.value = "";
      inputElement.classList.remove("invalid");
      InvalidMessage.forEach(function(message) {
        message.innerHTML ="";
      })
      // output.setAttribute('src', "");
      // outputUpdate.setAttribute('src', "");
    });
  }



tabs.forEach((tab, index) => {
  const pane = panes[index];
  const pane1 = panes[index-1];

  tab.onclick = function () {
    tabActive.classList.remove("active");
    $(".tab-pane.active").classList.remove("active");

    /*đường gạch chân hiễn ở mỗi tab*/ 
    line.style.left = this.offsetLeft + "px";
    line.style.width = this.offsetWidth + "px";

    // this.classList.add("active");
    pane.classList.add("active");

    btnExitForm.style.display = "none";
    updateTab.classList.remove('close');
    updateRoomForm.style.display="none";

    clearData(RoomInputs);
    clearData(RoomTextAreas);
    
  };
});


  var updateRoomForm = document.getElementById("form-update-room");
  var updateTab = document.getElementById("update-tab");
  var btnExitForm = document.querySelector(".btn-exit-form");

  function exitUpdate() {
    btnExitForm.style.display = "none";
    updateRoomForm.style.display="none";
    updateTab.classList.remove('close');
    // clearData(RoomInputs);
    // clearData(RoomTextAreas);

  }
