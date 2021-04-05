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
            <asp:Label ID="lblLacus" runat="server" Text="lacus sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu dictum varius duis at consectetur lorem donec massa sapien faucibus et molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque"></asp:Label>
        </p>

        <h2>
            <asp:Label ID="lblPellentesque" runat="server" Text="Pellentesque Elit Eget Gravida"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblVolutpat1" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label>
        </p>

        <h2><asp:Label ID="lblTurpis" runat="server" Text="Turpis Egestas Sed Tempus Urna"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblVolutpat2" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label>
        </p>

        <h2><asp:Label ID="lblLorem" runat="server" Text="Lorem Mollis Aliquam"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblVolutpat3" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label>
        </p>

        <h2><asp:Label ID="lblPharetara" runat="server" Text="Pharetara Massa"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblVolutpat4" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label>
        </p>

        <h2><asp:Label ID="lblImperdier" runat="server" Text="Imperdier dui Accumsan"></asp:Label></h2>
        <p class="privacy-text">
            <asp:Label ID="lblVolutpat5" runat="server" Text="volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum"></asp:Label>
        </p>
    </div>
</asp:Content>
