<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="create-blogs.aspx.cs" Inherits="web_app_assignment.admin.create_blogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/create-blogs.css" rel="stylesheet" type="text/css"/>
    <title>Create Blog</title>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/4.16.0/full-all/ckeditor.js"></script>
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
        <div class="create-header mb-3">
            <h2>Create Post</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticTitle" class="col-sm-2 col-form-label">Post Title:</label>
                <div class="col-sm-10">
                    <%--<input type="text" readonly class="form-control" value="U0001">--%>
                    <asp:TextBox ID="txtID" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Main Description:</label>
                <div class="col-sm-10">
                    <div class="EditBlogsAdminBodyDatabaseSpot">
                        <div id="editor">
                            <%--Database code comes here--%>
                            <p>Hello World</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Category:</label>
                <div class="col-sm-10">              
            
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Selected="True" Value="0"> Blog Category </asp:ListItem>
                    <asp:ListItem Value="Interview"> Interview </asp:ListItem>
                    <asp:ListItem Value="Recruiter"> Recruiter </asp:ListItem>
                </asp:DropDownList>
            
                </div>
            </div>
                

            <div class="form-group text-center">
                <a href="display-blogs.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="btnCreatePost" runat="server" Text="Update" class="btn btn-primary"/>
            </div>
        </form>
    </div>       
        
        <script>
            editor = CKEDITOR.replace('editor');
        </script>
</asp:Content>
