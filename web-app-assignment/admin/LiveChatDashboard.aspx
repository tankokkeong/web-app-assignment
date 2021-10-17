﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="LiveChatDashboard.aspx.cs" Inherits="web_app_assignment.admin.LiveChat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Live Chat</title>
    <link href="css/LiveChatDashboard.css" rel="stylesheet" type="text/css"/>
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

        var checkUserSeen = "";
        

        var checkVisitorSeen = "";
    </script>

    <div class="LiveChat">
        <div class="LiveChat_FilterPagination row">
            <h2 class="col">
                Messages
            </h2>
        </div>

        <form runat="server">
            <div class="LiveChat_MessagesData">
                <div class="container">
                  <div class="row">

                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-6 chat-img-container">
                                <img src="images/Admin-LiveMessage/chatting.png" alt="chat" class="img-fluid img-thumbnail" />
                            </div>

                            <div class="col-6 text-left mt-3">
                                <div class="font-weight-bold">
                                    Total Messages
                                </div>

                                <div class="mt-3">
                                    <asp:Label ID="lblTotalMessages" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                       
                    </div>

                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-6 chat-img-container">
                                <img src="images/Admin-LiveMessage/email.png" alt="plane" class="img-fluid img-thumbnail" />
                            </div>

                            <div class="col-6 text-left mt-3">
                                <div class="font-weight-bold">
                                    Sent Messages
                                </div>

                                <div class="mt-3">
                                    <asp:Label ID="lblSentMessages" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>              
                    </div>

                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-6 chat-img-container">
                                <img src="images/Admin-LiveMessage/receive-mail.png" alt="email" class="img-fluid img-thumbnail" />
                            </div>

                            <div class="col-6 text-left mt-3">
                                <div class="font-weight-bold">
                                    Received Messages
                                </div>

                                <div class="mt-3">
                                     <asp:Label ID="lblReceivedMessages" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                      
                    </div>

                  </div>
                </div>
            </div>
        </form>

        <div class="LiveChat_MessagesInput">

            <div id="chat-table-contents">
                <asp:Literal ID="ltrChatContent" runat="server"></asp:Literal>
            </div>

        </div>
    </div>

    <!--Script references. -->
    <!--Reference the jQuery library. -->
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <!--Reference the SignalR library. -->
    <script src="../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="../signalr/hubs"></script>

    <%-- Live chat script --%>
    <script src="js/admin-live-chat.js"></script>
    <script>
        startDashboardConnection('<%=sender_id %>', "");
    </script>
</asp:Content>