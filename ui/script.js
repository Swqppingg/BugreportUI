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
      $("body").fadeOut("slow","linear")
       setTimeout(function(){
            $.post(`http://BugreportUI/close`, JSON.stringify({}));
        }, 130);
    }
  };

  $(".sendReport").click(function () { 
    //var discord = document.getElementById("discord").value;
    var description = document.getElementById("description").value;
    if (discord == "" || description == "") {
      console.log("Fill in all fields")
      $.post(`http://BugreportUI/emptyFields`, JSON.stringify({}));
    }
    else {
      data = [discord,description];
      $.post(`http://BugreportUI/sendReport`, JSON.stringify({data}));
      $("body").fadeOut("slow","linear")
       setTimeout(function(){
            $.post(`http://BugreportUI/close`, JSON.stringify({}));
        }, 200);
      document.getElementById('description').value = ''
    }
  });

});

function openHome() {
  $("body").css("display", "block");
}

function close() {
  $("body").css("display", "none");
}

