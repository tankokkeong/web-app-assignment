<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_helpCenter.aspx.cs" Inherits="web_app_assignment.admin.edit_helpCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/helpCenter.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>
    <title>Help Center</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <div class="Edit_helpCenterBodyContents">
            <div class="Edit_helpCenterBodyContentsTitle">
                <h6>Question</h6>
            </div>
            <div class="Edit_helpCenterBodyContentsDetails">
                <textarea>Database in here</textarea>
            </div>
        </div>
        <div class="Edit_helpCenterBodyContents">
            <div class="Edit_helpCenterBodyContentsTitle">
                <h6>Answer</h6>
            </div>
            <div class="Edit_helpCenterBodyContentsDetails">
                <textarea>Database in here</textarea>
            </div>
        </div>
        <div id="Edit_helpCenterMoreBodyContents">

        </div>
        <div class="Edit_helpCenterButtons">
            <div class="Edit_helpCenterAddQuestions">
                <button type="button" class="Edit_helpCenterAddQuestionsButton" onclick="addNewQ_A()">Add More Question?</button>
            </div>
            <div class="Edit_helpCenterSubmit">
                <button type="submit" class="Edit_helpCenterSubmitButton">Update</button>
            </div>
        </div>
    </div>

    <script>
        function addNewQ_A() {
            $('#Edit_helpCenterMoreBodyContents').append('<div class="Edit_helpCenterBodyContents"><div class="Edit_helpCenterBodyContentsTitle"><h6>Question</h6></div><div class="Edit_helpCenterBodyContentsDetails"><textarea>Database in here</textarea></div></div><div class="Edit_helpCenterBodyContents"><div class="Edit_helpCenterBodyContentsTitle"><h6>Answer</h6></div><div class="Edit_helpCenterBodyContentsDetails"><textarea>Database in here</textarea></div></div>');
            tinymce.init({ selector: 'textarea' });
        };
    </script>
</asp:Content>
