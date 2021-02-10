<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_helpCenter.aspx.cs" Inherits="web_app_assignment.admin.edit_helpCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/helpCenter.css" rel="stylesheet" type="text/css"/>
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
                <div id="questionToolbar-container"></div>
                <div id="questionEditor">
                    <%--Database code comes here--%>
                    <p>Lallalalala</p>
                </div>
            </div>
        </div>
        <div class="Edit_helpCenterBodyContents">
            <div class="Edit_helpCenterBodyContentsTitle">
                <h6>Answer</h6>
            </div>
            <div class="Edit_helpCenterBodyContentsDetails">
                <div id="answerToolbar-container"></div>
                <div id="answerEditor">
                    <%--Database code comes here--%>
                    <p>Lallalalala</p>
                </div>
            </div>
        </div>
        <div class="Edit_helpCenterButtons">
            <div class="Edit_helpCenterAddQuestions">
                <button type="button" class="Edit_helpCenterAddQuestionsButton">Add More Question?</button>
            </div>
            <div class="Edit_helpCenterSubmit">
                <button type="submit" class="Edit_helpCenterSubmitButton">Update</button>
            </div>
        </div>
    </div>

    <script>
        DecoupledEditor
            .create(document.querySelector('#questionEditor'))
            .then(editor => {
                const toolbarContainer = document.querySelector('#questionToolbar-container');

                toolbarContainer.appendChild(editor.ui.view.toolbar.element);
            })
            .catch(error => {
                console.error(error);
            });

        DecoupledEditor
            .create(document.querySelector('#answerEditor'))
            .then(editor => {
                const toolbarContainer = document.querySelector('#answerToolbar-container');

                toolbarContainer.appendChild(editor.ui.view.toolbar.element);
            })
            .catch(error => {
                console.error(error);
            });
    </script>
</asp:Content>
