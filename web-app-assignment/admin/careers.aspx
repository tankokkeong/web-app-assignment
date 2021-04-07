<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="careers.aspx.cs" Inherits="web_app_assignment.admin.careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>
    <link href="css/careers.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[7];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[7];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">

    </form>
</asp:Content>
