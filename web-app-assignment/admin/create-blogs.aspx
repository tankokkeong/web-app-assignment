<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="create-blogs.aspx.cs" Inherits="web_app_assignment.admin.create_blogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/create-blogs.css" rel="stylesheet" type="text/css"/>
    <title>Create Blog</title>

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
    <div class="create-blogs-container">
        <div class="create-blog-header">
            <h2 class="create-blog-header-title">
                Create Page
            </h2>
        </div>
        <div class="create-blog-content">
            <h3 class="CreateBlogsAdminBodyContentsHeader">
                Blog 1
            </h3>
        </div>
        
        <form runat="server">
            <h3 class="mb-3 desc-title">Main Description</h3>
            <div class="form-group">
                <div class="CreateBlogsAdminBodyDatabaseSpot">
                    <div id="editor">
                        <%--Database code comes here--%>
                        <p>Hello World</p>
                    </div>
                </div>
            </div>

            <div class="select-category">
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddlcategory w-100">
                    <asp:ListItem Selected="True" Value="0"> Blog Category </asp:ListItem>
                    <asp:ListItem Value="Interview"> Interview </asp:ListItem>
                    <asp:ListItem Value="Recruiter"> Recruiter </asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="CreateBlogsAdminBodyButtonPosition">
                <button type="submit" class="CreateBlogsAdminBodyButton">POST ARTICLE</button>
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
