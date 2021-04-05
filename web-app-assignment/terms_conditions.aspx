<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="terms_conditions.aspx.cs" Inherits="web_app_assignment.terms_conditions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Terms & Conditions</title>

    <%-- Stylesheet --%>
    <link href="style/terms_conditions.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="terms-condiitons-body">
        <div class="banner-container" id="banner-container">
            <h1><asp:Label ID="lblTerms1" runat="server" Text="Terms & Conditions"></asp:Label></h1>
        </div>

        <div class="terms-conditions-content">
            <h1><asp:Label ID="lblTerms2" runat="server" Text="Terms & Conditions"></asp:Label></h1>

            <p class="terms-intro"><asp:Label ID="lblLacus" runat="server" Text="lacus sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu dictum varius duis at consectetur lorem donec massa sapien faucibus et molestie ac feugiat sed lectus vestibulum mattis"></asp:Label></p>

            <h2><asp:Label ID="lbl10" runat="server" Text="1. Lorem Ipsum Dolor Sit Amet"></asp:Label></h2>
            <h2><asp:Label ID="lbl11" runat="server" Text="1.1 Pellentesque Elit Eget Gravida"></asp:Label></h2>
            <p class="terms-text"><asp:Label ID="lblVolut1" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label></p>
       
            <h2><asp:Label ID="lbl12" runat="server" Text="1.2 Turpis Egestas Sed Tempus Urna"></asp:Label></h2>
            <p class="terms-text"><asp:Label ID="lblVolut2" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label></p>

            <h2><asp:Label ID="lbl20" runat="server" Text="2. Morbi Quis Commodo Odio Aenean Sed"></asp:Label></h2>
            <h2><asp:Label ID="lbl21" runat="server" Text="2.1 Lorem Mollis Aliquam"></asp:Label></h2>
            <p class="terms-text"><asp:Label ID="lblVolut3" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label></p>

            <h2><asp:Label ID="lbl22" runat="server" Text="2.2 Pharetara Massa"></asp:Label></h2>
            <p class="terms-text"><asp:Label ID="lblVolut4" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label></p>

            <h2><asp:Label ID="lbl23" runat="server" Text="2.3 Imperdier dui Accumsan"></asp:Label></h2>
            <p class="terms-text"><asp:Label ID="lblVolut5" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label></p>
        </div>
    </div>
</asp:Content>
