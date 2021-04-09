<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="blog-category-edit.aspx.cs" Inherits="web_app_assignment.admin.blog_category_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to blog management
            live_chat = nav_option[4];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="container bg-light">
            <div class="details-header mb-3">
                <h2>Blog Category</h2>
            </div>
            <div class="form-group row">
                <label for="staticID" class="col-sm-2 col-form-label">Category ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtID" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticName" class="col-sm-2 col-form-label">Category Title:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValTitle" runat="server" ErrorMessage="Required to fill in title!" CssClass="text-danger" ControlToValidate="txtTitle" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regExValTitle" runat="server" ErrorMessage="Only alphabets are allowed!" ControlToValidate="txtTitle" CssClass="text-danger" ValidationExpression="^[a-zA-Z ]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group text-center">
                <a href="blog-category-management.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="btnEditCategory" runat="server" Text="Update" class="btn btn-primary" OnClick="btnEditCategory_Click" />
            </div>
            <br />
        </div>
    </form>
</asp:Content>
