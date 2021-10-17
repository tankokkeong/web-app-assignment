function startDashboardConnection(sender_id, receiver_id) {
    var chat = $.connection.chatHub;
    // Create a function that the hub can call to broadcast messages.
    chat.client.broadcastMessage = function (name, message, sender, receiver) {
        // Html encode display name and message. 
        var encodedName = $('<div />').text(name).html();
        var encodedMsg = $('<div />').text(message).html();

        if (sender_id === receiver || sender === sender_id) {

            // Add the message to the page. 
            printDashboardMessage(sender, encodedName, encodedMsg);

        }

    };

    // Start the connection.
    $.connection.hub.start().done(function () {
        $('#sendmessage').click(function () {
            // Call the Send method on the hub. 
            chat.server.send("Admin", $('#message').val(), sender_id, receiver_id);
            // Clear text box and reset focus for next comment. 
            $('#message').val('').focus();
        });
    });
}

function printDashboardMessage(chat_id, chat_name, message_content) {

    var chat_row = document.getElementById(chat_id);

    if (chat_row === null || chat_row === undefined) {
        $('#chat-table-contents').append(

            "<div class='row chat-row' id='" + chat_id + "' >" +
                '<div class="col-sm-4">' +
                chat_name +
                '</div>' +

                '<div class="col-sm-2">' +
                    '<span class="badge badge-secondary" id="">unseen</span>' +
                '</div>' +

                '<div class="col-sm-6 user-message-dashboard">' +
                    "<span id=''>" + message_content + "</span>" +
                "</div>" +

            "</div>");
    }
    else {
        chat_row.innerHTML =

            '<div class="col-sm-4">' +
                chat_name +
            '</div >' +

            '<div class="col-sm-2">' +
                '<span class="badge badge-secondary" id="">unseen</span>' +
            '</div>' +

            '<div class="col-sm-6 user-message-dashboard">' +
                "<span id=''>" + message_content + "</span>" +
            "</div>";
    }
   
}