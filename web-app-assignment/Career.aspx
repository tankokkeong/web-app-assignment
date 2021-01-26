<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="web_app_assignment.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>

    <%-- Stylesheet --%>
    <link href="style/career.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-section">
        <div class="background-banner-text">
           <h1>Career Center</h1>
        </div>
    </div>

    <div class="our-team">
        <div class="our-team-header-container">
            <h2 class="text-lightgreen text-center">Our Team</h2>
        </div>
     </div>

</asp:Content>
