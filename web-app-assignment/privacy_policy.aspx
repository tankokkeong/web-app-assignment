<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="privacy_policy.aspx.cs" Inherits="web_app_assignment.privacy_policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Privacy Policy</title>

    <%-- Stylesheet --%>
    <link href="style/privacy_policy.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="privacy-policy-body">
        <div class="banner-container">
            <h1>
                <asp:Label ID="lblPrivacyPolicy1" runat="server" Text="Privacy Policy"></asp:Label></h1>
        </div>
    </div>

    <div class="privacy-content">

        <h1>
            <asp:Label ID="lblPrivacyPolicy2" runat="server" Text="Privacy Policy"></asp:Label></h1>

        <p class="privacy-intro">
            <asp:Label ID="lblIntro" runat="server" Text="Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites."></asp:Label>
        </p>

        <h2>
            <asp:Label ID="lblPrivacy1" runat="server" Text="COLLECTION OF PERSONAL INFORMATION"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblPrivacy11" runat="server" Text="We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications"></asp:Label>
        </p>

        <h2><asp:Label ID="lblPrivacy2" runat="server" Text="PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblPrivacy21" runat="server" Text="The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;"></asp:Label>
        </p>

        <h2><asp:Label ID="lblPrivacy3" runat="server" Text="Jobs4U.COM PROFILE"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblPrivacy31" runat="server" Text="Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases."></asp:Label>
        </p>

        <h2><asp:Label ID="lblPrivacy4" runat="server" Text="SECURITY OF PERSONAL INFORMATION"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblPrivacy41" runat="server" Text="Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL)."></asp:Label>
        </p>

        <h2><asp:Label ID="lblPrivacy5" runat="server" Text="TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblPrivacy51" runat="server" Text="It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers."></asp:Label>
        </p>
    </div>
</asp:Content>
