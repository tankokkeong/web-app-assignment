//Script for navbar
var a = $("#page-content").height();
$(document).on('scroll', function () {
    if ($(this).scrollTop() >= 100) {

        if ($(window).width() < 1000) {
            $("#header-nav").removeClass("bg-transparent");
            $("#header-nav").css("position", "");
        }
        else {
            $("#header-nav").css("position", "");
            $("#header-nav").removeClass("bg-transparent");
        }
        
    }
    else {

        if ($(window).width() < 1000) {
            $("#header-nav").removeClass("bg-transparent");
            $("#header-nav").css("position", "");
        }
        else {
            $("#header-nav").css("position", "absolute");
            $("#header-nav").addClass("bg-transparent");
        }
    }
});

$(document).ready(function () {
    if ($(window).width() < 1000) {
        $("#header-nav").removeClass("bg-transparent");
    }

    $(window).resize(function () {
        if ($(window).width() < 1000) {
            $("#header-nav").removeClass("bg-transparent");
            $("#header-nav").css("position", "");
        }
        else {
            if ($(this).scrollTop() >= 100) {
                $("#header-nav").removeClass("bg-transparent");
                $("#header-nav").css("position", "");
            }
            else {
                $("#header-nav").addClass("bg-transparent");
                $("#header-nav").css("position", "absolute");
            }
           
        }
    });
});