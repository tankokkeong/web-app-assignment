<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="LiveChat.aspx.cs" Inherits="web_app_assignment.admin.LiveChat1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LiveChat.css" rel="stylesheet" type="text/css"/>


     <%-- JQuery Plugin--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            live_chat = nav_option[1];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <div class="LiveChatContainer">
        <div class="LiveChatContainerHeader">
            <div class="LiveChatHeader text-center text-light">
                <h3>Live Chat</h3>
                <button type="button" class="close chatbox-close" aria-label="Close">
                    <a href="LiveChatDashboard.aspx" aria-hidden="true" class="text-dark text-decoration-none">&times;</a>
                </button>
            </div>
        </div>

        <div id="messages" class="LiveChatContainerContents"></div>
        
        <form runat="server">
            <div class="sendMessages">
                    <asp:TextBox ID="txtAdminID" runat="server" style="display:none;"></asp:TextBox>
                    <input id="message" class="form-control" placeholder="Enter message" autocomplete="off" onkeydown="enterMessagesLiveChatAdmin()"/>
                    <button type="button" class="bg-lightgreen text-light btn" onclick="sendMessage()">Send Message</button>
           
            </div>
        </form>
    </div>

</asp:Content>
