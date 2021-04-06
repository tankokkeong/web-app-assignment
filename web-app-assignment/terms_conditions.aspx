<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="terms_conditions.aspx.cs" Inherits="web_app_assignment.terms_conditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Terms & Conditions</title>

    <%-- Stylesheet --%>
    <link href="style/terms_conditions.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="terms-condiitons-body">
        <div class="banner-container" id="banner-container">
            <h1>
                <asp:Label ID="lblTerms1" runat="server" Text="Terms & Conditions"></asp:Label></h1>
        </div>

        <div class="terms-conditions-content">
            <h1>
                <asp:Label ID="lblTerms2" runat="server" Text="Terms & Conditions"></asp:Label></h1>

            <p class="terms-intro">
                <asp:Label ID="lblIntro" runat="server" Text="This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website."></asp:Label></p>

            <h2>
                <asp:Label ID="lbl10" runat="server" Text="1. Binding Agreement"></asp:Label></h2>
            <p class="terms-text">
                <asp:Label ID="lbl11" runat="server" Text="1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk."></asp:Label></p>
            <p class="terms-text">
                <asp:Label ID="lbl12" runat="server" Text="In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent."></asp:Label></p>

            <h2>
                <asp:Label ID="lbl20" runat="server" Text="2. Password and Security"></asp:Label></h2>
            <p class="terms-text">
                <asp:Label ID="lbl21" runat="server" Text="When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone."></asp:Label></p>
            <p class="terms-text">
                <asp:Label ID="lbl22" runat="server" Text="If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account."></asp:Label></p>

            <h2>
                <asp:Label ID="lbl30" runat="server" Text="3. Intellectual Property"></asp:Label></h2>
            <p class="terms-text">
                <asp:Label ID="lbl31" runat="server" Text="Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights."></asp:Label></p>
        </div>
    </div>
</asp:Content>
