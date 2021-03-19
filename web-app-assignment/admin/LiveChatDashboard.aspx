<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="LiveChatDashboard.aspx.cs" Inherits="web_app_assignment.admin.LiveChat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Live Chat</title>
    <link href="css/LiveChatDashboard.css" rel="stylesheet" type="text/css"/>

    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-app.js"></script>

    <!-- Include firebase database-->
    <script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-database.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/8.2.10/firebase-analytics.js"></script>

    <script>
        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        var firebaseConfig = {
            apiKey: "AIzaSyDNzVP3LRjenYXgNEYhmNW7jf2kw1mdVIc",
            authDomain: "livechat-3c810.firebaseapp.com",
            databaseURL: "https://livechat-3c810-default-rtdb.firebaseio.com",
            projectId: "livechat-3c810",
            storageBucket: "livechat-3c810.appspot.com",
            messagingSenderId: "154912838250",
            appId: "1:154912838250:web:d1defccda1595a26293013",
            measurementId: "G-GNQJGM0SMP"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        firebase.analytics();
    </script>
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

    <div class="LiveChat">
        <div class="LiveChat_FilterPagination row">
            <h2 class="col">
                Messages
            </h2>
            <div class="LiveChat_Pagination col-md-auto">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
            </div>
            <div class="LiveChat_Filter col col-lg-2">
                <button type="button" class="btn btn-primary btn-sm">All</button>
                <button type="button" class="btn btn-secondary btn-sm">Unread</button>
            </div>
        </div>
        <div class="LiveChat_MessagesData">
            <div class="container">
              <div class="row">
                <div class="col-sm LiveChat_MessagesDataDetails">
                    <img src="images/Admin-LiveMessage/chatting.png" alt="chat" class="img-fluid img-thumbnail LiveChat_MessagesDataImages" />
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>
                                    Overall Messages
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    2000 Messages
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm LiveChat_MessagesDataDetails">
                    <img src="images/Admin-LiveMessage/email.png" alt="plane" class="img-fluid img-thumbnail LiveChat_MessagesDataImages" />
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>
                                    Sent Messages
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    2000 Messages
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm LiveChat_MessagesDataDetails">
                    <img src="images/Admin-LiveMessage/receive-mail.png" alt="email" class="img-fluid img-thumbnail LiveChat_MessagesDataImages" />
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th>
                                    Received Messages
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    2000 Messages
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
              </div>
            </div>
        </div>

        <div class="LiveChat_MessagesInput">
            <table class="table">
              <tbody id="table-contents"></tbody>
            </table>
        </div>
    </div>

    <script>
        //listen for incoming messages
        firebase.database().ref("UserMessages/").on("child_added", function (snapshot) {
            var html = "";

            // give each message a unique ID
            html += "<tr class='table-rowLiveChat'>" +
                "<th scope='row'>" +
                "<input type='checkbox' />" +
                "</th>" +
                "<td> <a class='usernameLiveChat' href='LiveChat.aspx?chat=" + snapshot.key + "'>" + snapshot.key + "</a></td>" +
                "<td>" +
                "<button type='button' class='btn btn-sm btn-secondary'>Not Yet Read</button>" +
                "</td>" +
                "<td>" + snapshot.val().message + "</td>" +
                "<td>" +
                "<img src='images/Admin-LiveMessage/more.png' alt='more' class='LiveChat_MessagesInputImage' />" +
                "</td>" +
                "</tr>";

            document.getElementById("table-contents").innerHTML += html;
            console.log(snapshot.key);
        });
    </script>
</asp:Content>