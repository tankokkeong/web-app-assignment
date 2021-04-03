<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="client-edit-r.aspx.cs" Inherits="web_app_assignment.admin.client_edit_r" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Client Details</title>
    <link href="css/client-details.css" rel="stylesheet" />
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
            <h2>Client - Recruiter Status</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticID" class="col-sm-2 col-form-label">User ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtID" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-10">
                <asp:TextBox ID="txtEmail" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group row">
                <label for="staticStatus" class="col-sm-2 col-form-label">User Status:</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="listStatus" CssClass="form-control" runat="server">
                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="clients-management.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="btnEditUser" runat="server" Text="Update" class="btn btn-primary" OnClick="btnEditUser_Click" />
            </div>
        </form>
    </div>
</asp:Content>
