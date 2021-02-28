<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chatbox.aspx.cs" Inherits="web_app_assignment.chatbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chatbox</title>
    <link href="style/chatbox.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chatbox-container">
        <div class="chatbox-box">
            <div class="chatbox-header-container">
                <div class="chatbox-header text-center text-light">
                    <h3>Festus Ho Hon Chuang</h3>
                    <button type="button" class="close chatbox-close" aria-label="Close">
                        <a href="user-profile.aspx" aria-hidden="true" class="text-dark text-decoration-none">&times;</a>
                    </button>
                </div>
            </div>
            
            <div class="chat-content" id="chat-content-container">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                         <asp:Literal ID="lblContent" runat="server"></asp:Literal>
                    </ContentTemplate>
                </asp:UpdatePanel>

               

<%--                <div class="replier">
                    <div class="replier-icon">
                        <img src="images/user%20profile/demo-user.png" class="rounded-circle replier-img"/>
                    </div>

                    <div class="reply-content">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, 
                        but also the leap into electronic typesetting, 
                        remaining essentially unchanged. It was popularised in the 1960s with the 
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently 
                        with desktop publishing software like Aldus PageMaker including versions 
                        of Lorem Ipsum.

                        <div class="replier-time float-right">
                            <span class="text-secondary">10:24</span>
                        </div>
                    </div>
                </div>

                <div class="my-reply">
                    <div class="my-reply-content">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, 
                        but also the leap into electronic typesetting, 
                        remaining essentially unchanged. It was popularised in the 1960s with the 
                        release of Letraset sheets containing Lorem Ipsum passages, and more recently 
                        with desktop publishing software like Aldus PageMaker including versions 
                        of Lorem Ipsum.

                        <div class="my-reply-time float-right">
                            <span class="text-light">10:25</span>
                        </div>
                    </div>
                </div>--%>
                
                <asp:Literal ID="ltrScriptTrigger" runat="server"></asp:Literal>

            </div>
            

            <div class="chat-input">
                <input type="text" class="form-control" placeholder="Enter message here" id="chat-content" onkeyup="enterSendMessage()"/>
                <button class="bg-lightgreen text-light btn" type="button" id="insert-chat-btn">Send</button>
            </div>
        </div>
    </div>

    <%-- Insert Chat Record --%>
    <script>
        $("#insert-chat-btn").click(function(){
            $.post("chat-post.aspx",
            {
                chat_content: $("#chat-content").val(),
            },
            function () {
                //Clear form
                scrollToBottom();

                //Scroll to bottom every time send out message
                scrollToBottom();

            });
        });

        //Enter key to send message
        function enterSendMessage() {
            if (event.keyCode === 13) {
                event.preventDefault();
 
                $.post("chat-post.aspx",
                {
                    chat_content: $("#chat-content").val(),
                },
                function () {
                    //Clear form
                    document.getElementById("chat-content").value = "";

                    //Scroll to bottom every time send out message
                    scrollToBottom();

                });

            }
        }

        function scrollToBottom() {
            var messages = document.getElementById("chat-content-container");
            messages.scrollTop = messages.scrollHeight;
        }
    </script>
</asp:Content>
