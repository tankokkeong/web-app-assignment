var chat = $.connection.chatHub;

$(document).ready(function () {

    //Open chat box
    $("#btn-open-chat").click(function () {
        $("#chatbox").show();

        scrollToBottomMessage();
    });

    //Close chat box
    $("#btn-close-chat").click(function () {
        $("#chatbox").hide();
    });
});

function scrollToBottomMessage() {
    var messages = document.getElementById("messages");
    messages.scrollTop = messages.scrollHeight;
}

function startConnection(username, sender_id, receiver_id) {

    // Create a function that the hub can call to broadcast messages.
    chat.client.broadcastMessage = function (name, message, sender, receiver, sent_time) {
        // Html encode display name and message. 
        var encodedName = $('<div />').text(name).html();
        var encodedMsg = $('<div />').text(message).html();

        if (sender === sender_id) {
            // Add the message to the page. 
            $('#messages').append(
                "<div class='sender-message-context'>" +
                    "<div class='sender-message-content'>" +
                        encodedMsg +
                        "<div class='sentTime'>" + sent_time + "</div>" +
                    "</div>" +
                "</div>");
        }

    };

    // Start the connection.
    $.connection.hub.start().done(function () {
        $('#sendmessage').click(function () {
            sendMessage(username, $('#message').val(), sender_id, receiver_id);
        });
    });
}

function sendMessage(username, message, sender_id, receiver_id) {

    if (message.trim().length !== 0) {

        var post_data = {
            chat_content: message,
            sender_id: sender_id,
            sender_name: username
        };

        $.ajax({
            type: "POST",
            url: "/chat-post.aspx/submitLiveMessage",
            data: JSON.stringify(post_data),
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                console.log("We returned: " + JSON.stringify(result));

                // Call the Send method on the hub. 
                chat.server.send(username, message, sender_id, receiver_id, result.d);
                // Clear text box and reset focus for next comment. 
                $('#message').val('').focus();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Request: " + JSON.stringify(XMLHttpRequest) + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
            }
        });
    }

}

function enterSendMessage(username, sender_id, receiver_id) {
    if (event.keyCode === 13) {
        sendMessage(username, $('#message').val(), sender_id, receiver_id);
    }
}
