<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_helpCenter.aspx.cs" Inherits="web_app_assignment.admin.edit_helpCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/helpCenter.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.tiny.cloud/1/s1x7flr7l31qu699rv3wuoist4sng04yrs2p5gyvgqp9o8z1/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>
    <title>Help Center</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            pages_management = nav_option[4];
            $(pages_management).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>
    <div class="Edit_helpCenter">
        <div class="Edit_helpCenterHeaderPosition">
            <h2 class="Edit_helpCenterHeader">
                Help Center
            </h2>
        </div>
        <div class="Edit_helpCenterBodyHeaderPosition">
            <h4 class="Edit_helpCenterBodyHeader">
                Frequently Asked Question
            </h4>
        </div>

        <form>
            <div class="form-group row">
                <h5>
                    <label for="question" class="col-sm-2 col-form-label Edit_helpCenterBodyContentsTitle">Question</label>
                </h5>
                <div class="col-sm-10" id="question">
                    <div class="Edit_helpCenterBodyContentsDetails">
                        <textarea>Database in here</textarea>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <h5>
                    <label for="answer" class="col-sm-2 col-form-label">Answer</label>
                </h5>
                <div class="col-sm-10" id="answer">
                    <div class="Edit_helpCenterBodyContentsDetails">
                        <textarea>Database in here</textarea>
                    </div>
                </div>
            </div>

            <div id="Edit_helpCenterMoreBodyContents"></div>

            <div class="Edit_helpCenterButtons">
                <div class="Edit_helpCenterAddQuestions">
                    <button type="button" class="Edit_helpCenterAddQuestionsButton" onclick="addNewQ_A()">Add More Question?</button>
                </div>
                <div class="Edit_helpCenterSubmit">
                    <button type="submit" class="Edit_helpCenterSubmitButton">Update</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        function addNewQ_A() {
            $('#Edit_helpCenterMoreBodyContents').append('<div class="form-group row"><h5><label for="question" class="col-sm-2 col-form-label Edit_helpCenterBodyContentsTitle">Question</label></h5><div class="col-sm-10" id="question"><div class="Edit_helpCenterBodyContentsDetails"><textarea>Database in here</textarea></div></div></div><div class="form-group row"><h5><label for="answer" class="col-sm-2 col-form-label">Answer</label></h5><div class="col-sm-10" id="answer"><div class="Edit_helpCenterBodyContentsDetails"><textarea>Database in here</textarea></div></div></div>');
            tinymce.init({selector: 'textarea' });
        };
    </script>
</asp:Content>
