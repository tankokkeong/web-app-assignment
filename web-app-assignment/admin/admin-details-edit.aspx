<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-details-edit.aspx.cs" Inherits="web_app_assignment.admin.admin_details_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Details</title>
    <link href="css/admin-details.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            live_chat = nav_option[2];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <div class="details-container">
        <div class="details-header mb-3">
            <h2>Admin Details</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticID" class="col-sm-2 col-form-label">Admin ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtID" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticName" class="col-sm-2 col-form-label">Admin Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticRight" class="col-sm-2 col-form-label">Role:</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="listRight" CssClass="form-control" runat="server">
                        <asp:ListItem Value="Editor">Editor</asp:ListItem>
                        <asp:ListItem Value="Viewer">Viewer</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="admin-management.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="btnEditAdmin" runat="server" Text="Update" class="btn btn-primary" OnClick="btnEditAdmin_Click" />
            </div>
        </form>
    </div>
</asp:Content>
