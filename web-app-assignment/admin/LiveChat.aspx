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
            <input id="message" class="form-control" placeholder="Enter message" autocomplete="off" onkeyup="enterSendMessage()"/>
            <button type="button" class="bg-lightgreen text-light btn" onclick="sendMessage()">Send Message</button>
        </div>
    </div>

    <ul ></ul>

    <script type="text/javascript">

        //get admin email
        var admin_email = String(document.getElementById("ContentPlaceHolder1_lblUsername").innerHTML);
        var mailArr = admin_email.split('@');
        var logn = mailArr[0];
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        var time = today.getHours() + ":" + today.getMinutes();
        var sentTime = date + ' ' + time;
        var deletedTime = date + ' ' + time;
        var count = 1;

        function sendMessage() {
            // get messages
            var message = document.getElementById("message").value;

            //save in database
            firebase.database().ref("messages/" + logn + "/").push({
                "sender": logn,
                "message": message,
                "timeSent": sentTime,
                "messageNumber": count,
                "timeDeleted":"",
            });
            count++;
        }

        //listen for incoming messages
        firebase.database().ref("messages/" + logn + "/").on("child_added", function (snapshot) {
            var html = "";

            // give each message a unique ID
            html += "<li id='message-" + snapshot.key + "'>";

            if (snapshot.val().sender == logn) {
                html += "<button class='btn btn-danger text-light' data-id='" + snapshot.key + "' onclick='deleteMessage(this);'>";
                html += "Delete";
                html += "</button>";
            }

            html += snapshot.val().sender + ": " + snapshot.val().message;

            html += "</li>";

            document.getElementById("messages").innerHTML += html;
            document.getElementById('message').value = "";
        });

        function deleteMessage(self) {
            // get message ID
            var messageId = self.getAttribute("data-id");

            //delete message
            firebase.database().ref("messages/" + logn + "/").child(messageId).update({
                "timeDeleted": deletedTime,
            });
        }

        //attach listener for deleted message
        firebase.database().ref("messages/" + logn + "/").on("child_changed", function (snapshot) {
            //remove message node
            document.getElementById("message-" + snapshot.key).innerHTML = "This message has been removed";
        });

        //Enter key to send message
        function enterSendMessage() {
            if (event.keyCode === 13) {
                event.preventDefault();
                sendMessage();
            }
        }
    </script>
</asp:Content>
