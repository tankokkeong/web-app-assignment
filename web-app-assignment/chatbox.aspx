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
                    <h3>
                        <asp:Label ID="lblContactName" runat="server" Text=""></asp:Label>
                    </h3>
                    <button type="button" class="close chatbox-close" aria-label="Close">
                        <%
                            if(Session["Recruiter"] != null)
                            {
                                Response.Write("<a href='recruiter-profile.aspx' aria-hidden='true' class='text-dark text-decoration-none'>&times;</a>");
                            }
                            else
                            {
                               Response.Write("<a href='user-profile.aspx' aria-hidden='true' class='text-dark text-decoration-none'>&times;</a>");
                            }
                        %>               
                    </button>
                </div>
            </div>
            
            <div class="chat-content" id="chat-content-container">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                         <asp:Literal ID="lblContent" runat="server"></asp:Literal>
                         <asp:TextBox ID="txtScriptTrigger" runat="server" style="display:none;"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>

               
<%--                <div class='replier'>
                    <div class='replier-icon'>
                        <img src = '" + dr["user_photo"] +"' class='rounded-circle replier-img'/>
                    </div>

                    <div class='reply-content'>
                        <div class='mb-1'>
                            Testing Content, Hi I am your recruiter
                        </div>

                        <div class='replier-time float-right'>
                            <span class='text-secondary'>10:12 AM </span>
                        </div>
                    </div>
                </div>

                <div class='my-reply'>
                    <div class='reply-container'>
                    <div class='my-reply-content'>
                        <div class='mb-1'>
                           Testing Content, hi
                        </div>

                        <div class='my-reply-time float-right'>                           
                            <span class='text-light'>10:12 AM</span><br/>
                            <div class="float-right">
                                 <span class='text-light seen-text'>seen <i class="fas fa-check-circle"></i></span>
                            </div>
                           
                        </div>
                         
                    </div>                

                    </div>
                </div>--%>
               
            </div>
            

            <div class="chat-input">
                <input type="text" class="form-control" placeholder="Enter message here" id="chat-content" onkeydown="enterSendMessage()"/>
                <asp:TextBox ID="txtSeekerID" runat="server" style="display:none;"></asp:TextBox>
                <asp:TextBox ID="txtRecruiterID" runat="server" style="display:none;"></asp:TextBox>
                <button class="bg-lightgreen text-light btn" type="button" id="insert-chat-btn">Send</button>
            </div>
        </div>
    </div>

    <%-- Insert Chat Record --%>
    <script>
        var seeker_value = document.getElementById("ContentPlaceHolder1_txtSeekerID").value;
        var recruiter_value = document.getElementById("ContentPlaceHolder1_txtRecruiterID").value;

        //Check Scroll Down
        var prev_msg_count = 0;

        $("#insert-chat-btn").click(function () {
            if ($("#chat-content").val().trim().length > 0) {
                $.post("chat-post.aspx",
                {
                    chat_content: $("#chat-content").val(),
                    seeker_id: seeker_value,
                    recruiter_id: recruiter_value,
                },
                function () {
                    //Clear form
                    document.getElementById("chat-content").value = "";

                });
            }
            
        });

        //Enter key to send message
        function enterSendMessage() {
            if (event.keyCode === 13) {
                event.preventDefault();              

                if ($("#chat-content").val().trim().length > 0) {
                    $.post("chat-post.aspx",
                    {
                        chat_content: $("#chat-content").val(),
                        seeker_id: seeker_value,
                        recruiter_id: recruiter_value,
                    },
                    function () {
                        //Clear form
                        document.getElementById("chat-content").value = "";

                    });
                }
                
                return false;

            }
        }

        function scrollToBottom() {
            var messages = document.getElementById("chat-content-container");
            messages.scrollTop = messages.scrollHeight;
        }

        function checkScrollToBottom() {
            var msg_count = document.getElementById("ContentPlaceHolder1_txtScriptTrigger").value;

            if (msg_count != prev_msg_count) {
                scrollToBottom();
            }

            //Assign the msg count to the prev msg count
            prev_msg_count = msg_count;
        }

        //Check Scroll Down
        setInterval(function () { checkScrollToBottom(); }, 500);
    </script>
</asp:Content>
