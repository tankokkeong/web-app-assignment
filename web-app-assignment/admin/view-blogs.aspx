<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="view-blogs.aspx.cs" Inherits="web_app_assignment.admin.view_blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/edit-blog.css" rel="stylesheet" type="text/css" />
    <title>View Blogs</title>

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
                    <asp:TextBox ID="txtTitle" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Post Simple Description:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSimpleDesc" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="blogImageDisplay" class="col-sm-2 col-form-label">Blog Image:</label>
                <div class="col-sm-10">
                    <div class="picture-container">
                        <asp:Image ID="imgBlogPhoto" ReadOnly="true" runat="server" class="blogPhoto" Style="width: 500px; height: 500px;" />
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Main Description:</label>
                <div class="col-sm-10">
                    <div>
                        <textarea id="blogDescription_editor" class="form-control" placeholder="Write Your Blog Here" name="blogDescription_editor"></textarea>
                        <asp:TextBox ID="txtEditDescription" ReadOnly="true" runat="server" Style="display: none;"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Category:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCategory" ReadOnly="true" runat="server" CssClass="form-control" ></asp:TextBox>
                    <asp:DropDownList ID="ddlCategory" runat="server" ReadOnly="true" CssClass="form-control" AppendDataBoundItems="true" DataTextField="category_title" DataValueField="blog_category_id" Style="display: none;">
                    </asp:DropDownList>
                </div>
            </div>


            <div class="form-group text-center">
                <a href="display-blogs.aspx" class="btn btn-secondary">Back</a>
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
