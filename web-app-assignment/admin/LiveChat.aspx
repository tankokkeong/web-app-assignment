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

    <script type="text/javascript">
        //get user id or visitor id
        var query = window.location.href.split('?')[1];
        query = query.split('=')[1];

        //get date
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        var time = today.getHours() + ":" + today.getMinutes();
        var sentTime = time + ' ' + date;

        function sendMessage() {
            // get messages
            var message = document.getElementById("message").value;

            if (message != "") {
                if (query != "") {
                    //send form request to livechat post
                    if ($("#message").val().trim().length > 0) {

                        $.post("LiveChatPost.aspx",
                        {
                            chat_content: $("#message").val(),
                            admin_id: $("#ContentPlaceHolder1_txtAdminID").val(),
                        });
                    }

                    //save in database
                    firebase.database().ref("adminMessages/" + query + "/").push({
                        "sender": query,
                        "message": message,
                        "timeSent": sentTime,
                        "sent": 1,
                        "received": 0,
                    });

                    if (query.includes("Visitor")) {
                        //save in database
                        firebase.database().ref("VisitorMessages/" + query + "/").push({
                            "sender": query,
                            "message": message,
                            "timeSent": sentTime,
                            "sent": 0,
                            "received": 1,
                        });

                        //save in firebase
                        firebase.database().ref("seenMessages/Admin/" + query + "/").set({
                            "seen": "unseen",
                        });
                    } else {
                        //save in firebase
                        firebase.database().ref("UserMessages/" + query + "/").push({
                            "sender": query,
                            "message": message,
                            "timeSent": sentTime,
                            "sent": 0,
                            "received": 1,
                        });

                        //save in firebase
                        firebase.database().ref("seenMessages/Admin/" + query + "/").set({
                            "seen": "unseen",
                        });
                    }
                }
            }
        }

        var checkSeen = checkSeenMessages();

        //listen for user messages or visitor messages
        firebase.database().ref("adminMessages/" + query + "/").on("child_added", function (snapshot) {
            var html = "";

            if (snapshot.val().sent == 1) {
                if (checkSeen == "seen") {
                    // give each message a unique ID
                    html += "<div class='sender-messagesContexts'>";
                    html += "<div class='sender-messagesContents' id='message-" + snapshot.key + "'>";

                    html += snapshot.val().message + "<div class='sentTime'><i class='fas fa-check-circle'></i>Sent at : " + snapshot.val().timeSent + "</div>";

                    html += "</div>";

                    document.getElementById("messages").innerHTML += html;
                    document.getElementById('message').value = "";
                } else {
                    // give each message a unique ID
                    html += "<div class='sender-messagesContexts'>";
                    html += "<div class='sender-messagesContents' id='message-" + snapshot.key + "'>";

                    html += snapshot.val().message + "<div class='sentTime'><i class='far fa-check-circle'></i>Sent at : " + snapshot.val().timeSent + "</div>";

                    html += "</div>";

                    document.getElementById("messages").innerHTML += html;
                    document.getElementById('message').value = "";
                }
            } else {
                // give each message a unique ID
                html += "<div class='replier-messagesContexts'>";
                html += "<div class='replier-messagesContents' id='message-" + snapshot.key + "'>";

                html += "<div class='replier-messagesContentsName'>" + snapshot.val().sender + "</div> " + snapshot.val().message + "<div class='sentTime'>Sent at : " + snapshot.val().timeSent + "</div>";

                html += "</div>";

                document.getElementById("messages").innerHTML += html;
                document.getElementById('message').value = "";

                if (query.includes("Visitor")) {
                    firebase.database().ref("seenMessages/" + query + "/").set({
                        seen: "seen",
                    });
                } else {
                    firebase.database().ref("seenMessages/User/" + query + "/").set({
                        seen: "seen",
                    });
                }
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

        function checkSeenMessages() {

            var checkSeen = "";

            firebase.database().ref("seenMessages/Admin/" + query + "/").on("value", function (snapshot) {
                checkSeen = snapshot.val().seen;
            });

            return checkSeen
        }

        scrollToBottomMessage();
    </script>
</asp:Content>
