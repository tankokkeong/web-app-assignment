<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="message-details.aspx.cs" Inherits="web_app_assignment.admin.message_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message Details</title>
    <link href="css/message-details.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server">
    <div class="message-container">
        <div class="message-title">
            <h3>Message Details</h3>
        </div>

        <div class="message-form mt-3">
            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                   <%-- <input type="text" readonly class="form-control" value="demo@gmail.com"> --%>
                  <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Subject</label>
                <div class="col-sm-10">
                   <%-- <input type="text" readonly class="form-control" value="Demo Subject"> --%>
                    <asp:TextBox ID="txtSubject" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Message</label>
                <div class="col-sm-10">
                   <%--
                    <textarea class="form-control" readonly rows="15">
                    What is Lorem Ipsum?
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                    Lorem Ipsum has been the industry's standard 
                    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it 
                    to make a type specimen book. It has survived not only five centuries, but also the leap into electronic 
                    typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset 
                    sheets containing Lorem Ipsum passages, 
                    and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                   </textarea> --%>
                    <asp:TextBox ID="txtMessage" ReadOnly="true" CssClass="form-control" placeholder="Message" TextMode="MultiLine" Columns="50" Rows="15" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="text-center">
               <button type="button" class="btn text-light bg-lightgreen" data-toggle="modal" data-target="#replyModal">Reply</button> 
                <a href="contact-message.aspx" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </div>

    <!-- Reply Modal -->
    <div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="reply-container">
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                       <%-- <input type="text" readonly class="form-control" value="demo@gmail.com"> --%>
                       <asp:TextBox ID="txtEmailReply" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Subject</label>
                <div class="col-sm-10">
                   <%-- <input type="text" class="form-control" placeholder="Subject"> --%>
                   <asp:TextBox ID="txtSubjectReply" ReadOnly="true" CssClass="form-control" placeholder="Subject" runat="server"></asp:TextBox>
                </div>
            </div>
          
            <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Reply Message</label>
                <div class="col-sm-10">
                  <%-- <textarea class="form-control" rows="15" placeholder="Reply Message"></textarea> --%>
                  <asp:TextBox ID="txtMessageReply" CssClass="form-control" placeholder="Reply Message" TextMode="MultiLine" Rows="15" runat="server"></asp:TextBox>
                </div>
            </div>
          
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <%-- <button type="button" class="btn btn-primary">Send</button> --%>
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Send" OnClick="btnSubmit_Click"/>
          </div>
        </div>
      </div>
    </div>
   </form>
</asp:Content>
