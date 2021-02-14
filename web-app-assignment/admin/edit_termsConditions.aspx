<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_termsConditions.aspx.cs" Inherits="web_app_assignment.admin.pages_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/terms_conditions.css" rel="stylesheet" type="text/css"/>
    <title>Terms & Condition</title>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Term_ConditionsAdminBody">
        <div class="Term_ConditionsAdminBodyHeaderPosition">
            <h2 class="Term_ConditionsAdminBodyHeader">
                Edit Page
            </h2>
        </div>
        <div class="Term_ConditionsAdminBodyContents">
            <h3 class="Term_ConditionsAdminBodyContentsHeader">
                Terms & Conditions
            </h3>
        </div>

        <div class="Term_ConditionsAdminBodyDatabaseSpot">
            <div id="editor">
                <%--Database code comes here--%>
                <p>Lallalalala</p>
            </div>
        </div>
        <script>
            ClassicEditor
                .create(document.querySelector('#editor'))
                .catch(error => {
                    console.error(error);
                });
        </script>

        <div class="Term_ConditionsAdminBodyButtonPosition">
            <button class="Term_ConditionsAdminBodyButton" type="submit">Update</button>
        </div>
    </div>
</asp:Content>
