<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="LiveChat.aspx.cs" Inherits="web_app_assignment.admin.LiveChat1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/LiveChat.css" rel="stylesheet" type="text/css"/>

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

        <div class="sendMessages">
            <asp:Label ID="lblUsername" class="LCusername" runat="server"></asp:Label>
            <asp:Label ID="lblAdminName" class="LCusername" runat="server"></asp:Label>
            <input id="message" class="form-control" placeholder="Enter message" autocomplete="off" onkeydown="enterMessagesLiveChatAdmin()"/>
            <button type="button" class="bg-lightgreen text-light btn" onclick="sendMessage()">Send Message</button>
        </div>
    </div>

    <script type="text/javascript">

        //get admin email
        var userName = String(document.getElementById("ContentPlaceHolder1_lblUsername").innerHTML)
        var admin_email = String(document.getElementById("ContentPlaceHolder1_lblAdminName").innerHTML);
        var mailArr = admin_email.split('@');
        var logn = mailArr[0];
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        var time = today.getHours() + ":" + today.getMinutes();
        var sentTime = time + ' ' + date;

        function sendMessage() {
            // get messages
            var message = document.getElementById("message").value;

            if (message != "") {
                //save in database
                firebase.database().ref("adminMessages/" + logn + "/").push({
                    "sender": logn,
                    "message": message,
                    "timeSent": sentTime,
                });
                count++;
            }
        }

        //listen for admin messages
        firebase.database().ref("adminMessages/" + logn + "/").on("child_added", function (snapshot) {
            var html = "";

            if (snapshot.val().sender == logn) {
                // give each message a unique ID
                html += "<div class='sender-messagesContexts'>";
                html += "<div class='sender-messagesContents' id='message-" + snapshot.key + "'>";

                html += snapshot.val().message + "<div class='sentTime'>Sent at : " + sentTime + "</div>";

                html += "</div>";

                document.getElementById("messages").innerHTML += html;
                document.getElementById('message').value = "";
            }
        });

        //listen for user messages
        firebase.database().ref("UserMessages/" + userName + "/").on("child_added", function (snapshot) {
            var html = "";

            if (snapshot.val().sender == userName) {
                // give each message a unique ID
                html += "<div class='replier-messagesContexts'>";
                html += "<div class='replier-messagesContents' id='message-" + snapshot.key + "'>";

                html += "<div class='replier-messagesContentsName'>" + snapshot.val().sender + "</div> " + snapshot.val().message + "<div class='sentTime'>Sent at : " + sentTime + "</div>";

                html += "</div>";

                document.getElementById("messages").innerHTML += html;
                document.getElementById('message').value = "";
            }
        });

        //Enter key to send message
        function enterMessagesLiveChatAdmin() {
            if (event.keyCode === 13) {
                event.preventDefault();
                sendMessage();
                scrollToBottomMessage();
            }
        }

        function scrollToBottomMessage() {
            var messages = document.getElementById("messages");
            messages.scrollTop = messages.scrollHeight;
        }
    </script>
</asp:Content>
