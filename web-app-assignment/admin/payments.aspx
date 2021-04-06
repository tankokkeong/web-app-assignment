<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="web_app_assignment.admin.payments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Payment Records</title>
    <link href="css/payments.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[5];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>
</asp:Content>
