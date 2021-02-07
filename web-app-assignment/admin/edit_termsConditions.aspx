﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit_termsConditions.aspx.cs" Inherits="web_app_assignment.admin.pages_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/terms_conditions.css" rel="stylesheet" type="text/css"/>
    <title>Terms & Condition</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/decoupled-document/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h2>
                Edit Page
            </h2>
        </div>
        <div>
            <h3>
                Terms & Conditions
            </h3>
        </div>
        <div id="toolbar-container"></div>

            <!-- This container will become the editable. -->
            <div id="editor">
                <p>This is the initial editor content.</p>
            </div>
        <script>
            DecoupledEditor
                .create(document.querySelector('#editor'))
                .then(editor => {
                    const toolbarContainer = document.querySelector('#toolbar-container');

                    toolbarContainer.appendChild(editor.ui.view.toolbar.element);
                })
                .catch(error => {
                    console.error(error);
                });
        </script>
    </div>
</asp:Content>
