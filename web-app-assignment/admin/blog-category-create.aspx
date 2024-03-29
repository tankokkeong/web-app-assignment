﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="blog-category-create.aspx.cs" Inherits="web_app_assignment.admin.blog_category_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container bg-light">
            <div class="details-header mb-3">
                <h2>Create Blog Category</h2>
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
                <asp:Button ID="btnAddCategory" runat="server" Text="Create" class="btn btn-primary" OnClick="btnAddCategory_Click" />
            </div>
            <br />
        </div>
    </form>
</asp:Content>
