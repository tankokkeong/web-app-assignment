<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit-blogs.aspx.cs" Inherits="web_app_assignment.admin.edit_blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/edit-blog.css" rel="stylesheet" type="text/css" />
    <title>Edit Blogs</title>

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

    <div class="edit-blogs-container">
        <div class="edit-header mb-3">
            <h2>Edit Post</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticTitle" class="col-sm-2 col-form-label">Post Title:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValTitle" runat="server" ErrorMessage="Title is required!" CssClass="text-danger" ControlToValidate="txtTitle" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Maximum 20 characters allowed!" ControlToValidate="txtTitle" CssClass="text-danger" ValidationExpression="^[\s\S]{0,20}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Post Simple Description:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSimpleDesc" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValSDesc" runat="server" ErrorMessage="Title is required!" CssClass="text-danger" ControlToValidate="txtSimpleDesc" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Maximum 40 characters allowed!" ControlToValidate="txtSimpleDesc" CssClass="text-danger" ValidationExpression="^[\s\S]{0,40}$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group row">
                <label for="blogImageDisplay" class="col-sm-2 col-form-label">Blog Image:</label>
                <div class="col-sm-10">
                    <div class="picture-container">
                        <asp:Image ID="imgBlogPhoto" runat="server" class="blogPhoto" Style="width: 500px; height: 500px;" />
                    </div>
                    <br />
                    <asp:FileUpload ID="blogPhotoUpload" runat="server" CssClass="form-control" onchange="photoUpload()" />
                    <asp:TextBox ID="txtPhotoUpload" runat="server" Style="display: none;" />
                    <asp:RegularExpressionValidator ID="regExValPhoto" runat="server" ErrorMessage="Only .jpg, .png & .gif files are allowed" ControlToValidate="blogPhotoUpload" CssClass="text-danger" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.png|.PNG|.gif|.GIF)$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Main Description:</label>
                <div class="col-sm-10">
                    <div>
                        <textarea id="blogDescription_editor" class="form-control" placeholder="Write Your Blog Here" name="blogDescription_editor"></textarea>
                        <asp:TextBox ID="txtEditDescription" runat="server" Style="display: none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValDescription" runat="server" ErrorMessage="Blog Content is required!" ControlToValidate="txtEditDescription" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Category:</label>
                <div class="col-sm-10">

                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true" DataTextField="category_title" DataValueField="blog_category_id">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqCategory" runat="server" ErrorMessage="Please choose a category!" ControlToValidate="ddlCategory" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>


            <div class="form-group text-center">
                <a href="display-blogs.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="btnEditPost" runat="server" Text="Update" class="btn btn-primary" OnClick="btnEditPost_Click" />
            </div>
        </form>
    </div>

    <script>
        editor = CKEDITOR.replace('blogDescription_editor');
        content_input = document.getElementById("ContentPlaceHolder1_txtEditDescription");

        // editor is object of your CKEDITOR
        editor.on('change', function () {
            content_input.value = window.escape(CKEDITOR.instances.blogDescription_editor.getData());
            console.log(content_input.value)
            console.log(unescape(content_input.value))
        });

        //Sticky form script
        function getBlogDescription() {
            var description_value = document.getElementById("ContentPlaceHolder1_txtEditDescription");
            var ck_editor = document.getElementById("blogDescription_editor");

            //Assign the value to CK EDITOR
            ck_editor.value = window.unescape(description_value.value);

            //Escape the text
            description_value.value = window.escape(description_value.value);
        }

        function photoUpload() {
            var file_input = document.getElementById("ContentPlaceHolder1_blogPhotoUpload").value;
            var hidden_photo_input = document.getElementById("ContentPlaceHolder1_txtPhotoUpload");

            //assign file input to hidden field
            hidden_photo_input.value = file_input;
        }

        getBlogDescription();
    </script>

</asp:Content>
