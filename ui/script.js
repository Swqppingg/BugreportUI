$(document).ready(function () {
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      openHome();
    }
    if (item.show == false) {
      close();
    }

  });
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post('http://BugreportUI/close', JSON.stringify({}));
    }
  };


  $(".sendReport").click(function () {
    var discord = document.getElementById("discord").value;
    var description = document.getElementById("description").value;
    if (discord == "" || description == "") {
      console.log("Fill in all fields")
    }
    else {
      data = [discord,description];
      $.post('http://BugreportUI/sendReport', JSON.stringify({data}));
      document.getElementById('description').value = ''
      document.getElementById('discord').value = ''
    }
  });

});

function openHome() {
  $("body").css("display", "block");
}

function close() {
  $("body").css("display", "none");
}

