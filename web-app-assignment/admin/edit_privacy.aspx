<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_privacy.aspx.cs" Inherits="web_app_assignment.admin.edit_privacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Privacy Policy</title>
    <link href="css/privacy.css" rel="stylesheet" type="text/css"/>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
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

    <div class="PrivacyAdminBody">
        <div class="PrivacyAdminBodyHeaderPosition">
            <h2 class="PrivacyAdminBodyHeader">
                Edit Page
            </h2>
        </div>
        <div class="PrivacyAdminBodyContents">
            <h3 class="PrivacyAdminBodyContentsHeader">
                Privacy Policy
            </h3>
        </div>
        
        <form>
            <div class="form-group">
                <div class="PrivacyAdminBodyDatabaseSpot">
                    <div id="editor">
                        <%--Database code comes here--%>
                        <p>Lallalalala</p>
                    </div>
                </div>
            </div>
            <div class="PrivacyAdminBodyButtonPosition">
                <button type="submit" class="PrivacyAdminBodyButton">Submit</button>
            </div>
        </form>
        
        <script>
            ClassicEditor
                .create(document.querySelector('#editor'))
                .catch(error => {
                    console.error(error);
                });
        </script>
    </div>
</asp:Content>
