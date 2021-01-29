//Script for navbar

if (window.location.pathname === "/home" || window.location.pathname === "/home.aspx") {
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

        //Add Class by default
        $("#header-nav").addClass("bg-transparent");
        $("#header-nav").css("position", "absolute");
    });
}

function helpQuestionToggleDown(question_id, toggle_id, call_id, question_title) {
    $(document).ready(function () {
        $('#' + question_id).slideDown();
        $('#' + toggle_id).css("transform", "rotate(0deg)");
        $('#' + call_id).attr("onclick", "helpQuestionToggleUp(" + '"' + question_id + '"' + "," + '"' + toggle_id + '"' + "," + '"' + call_id + '"' + "," + '"' + question_title + '")');
        $('#' + question_title).addClass("text-lightgreen");
    });
}

function helpQuestionToggleUp(question_id, toggle_id, call_id, question_title) {
    $(document).ready(function () {
        $('#' + question_id).slideUp();
        $('#' + toggle_id).css("transform", "rotate(90deg)");
        $('#' + call_id).attr("onclick", "helpQuestionToggleDown(" + '"' + question_id + '"' + "," + '"' + toggle_id + '"' + "," + '"' + call_id + '"' + "," + '"' + question_title + '")');
        $('#' + question_title).removeClass("text-lightgreen");
    });
}

function helpQuestionFilter() {
    question_input = document.getElementById("question-input").value.toUpperCase();
    current_question = document.getElementsByClassName("question-title");
    question_bar = document.getElementsByClassName("question-bar");

    for (var i = 0; i < current_question.length; i++) {
        if (current_question[i].innerHTML.toUpperCase().indexOf(question_input) > -1) {
            question_bar[i].style.display = "";
        }
        else if (question_input.value === "") {
            question_bar[i].style.display = "";
        }
        else {
            question_bar[i].style.display = "none";
        }
    }
}