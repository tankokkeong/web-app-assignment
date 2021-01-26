//Script for navbar
var a = $("#page-content").height();
$(document).on('scroll', function () {
    if ($(this).scrollTop() >= 100) {
        $("#header-nav").css("position", "");
        $("#header-nav").css("background-color", "black");
        $("#header-nav").removeClass("bg-transparent");
    }
    else {
        $("#header-nav").css("position", "absolute");
        $("#header-nav").addClass("bg-transparent");
    }
});