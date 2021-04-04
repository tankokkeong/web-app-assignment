<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-create.aspx.cs" Inherits="web_app_assignment.admin.admin_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New Admin</title>
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
        <form runat="server">
            <div class="form-group row">
                <%--<label for="staticEmail" class="col-sm-2 col-form-label">Admin Email:</label>--%>
                <asp:Label ID="lblAdminEmail" runat="server" class="col-sm-2 col-form-label" Text="Admin Email"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAdminEmail" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqValEmail" runat="server" ErrorMessage="Email is required to fill in!" ControlToValidate="txtAdminEmail" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regExValEmail" runat="server" ErrorMessage="Invalid Email!" ControlToValidate="txtAdminEmail" CssClass="text-danger" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group row">
                <%--<label for="staticRight" class="col-sm-2 col-form-label">Admin Role:</label>--%>
                <asp:Label ID="lblAdminRight" runat="server" class="col-sm-2 col-form-label" Text="Admin Roles"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="listAdminRight" runat="server" class="form-control">
                        <asp:ListItem Selected="True">Please Select</asp:ListItem>
                        <asp:ListItem Value="Editor">Editor</asp:ListItem>
                        <asp:ListItem Value="Viewer">Viewer</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqAdminRight" runat="server" ErrorMessage="Please choose a role!" InitialValue="Please Select" ControlToValidate="listAdminRight" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="admin-management.aspx" class="btn btn-secondary">Back</a>
                <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-primary" OnClick="btnAddAdmin_Click" />
            </div>
        </form>
    </div>
</asp:Content>
