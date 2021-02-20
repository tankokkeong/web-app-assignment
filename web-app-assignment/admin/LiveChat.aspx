<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="LiveChat.aspx.cs" Inherits="web_app_assignment.admin.LiveChat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Live Chat</title>
    <link href="css/LiveChat.css" rel="stylesheet" type="text/css"/>
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
              <tbody>
                <tr>
                    <th scope="row">
                        <input type="checkbox"/>
                    </th>
                    <td>Jason Hing</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-secondary">Topic Design</button>
                    </td>
                    <td>Good Afternnon, we need to do the testing by monday . Please read me</td>
                    <td>
                        <img src="images/Admin-LiveMessage/more.png" alt="more" class="LiveChat_MessagesInputImage"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <input type="checkbox"/>
                    </th>
                    <td>Jason Hing</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-secondary">Topic Design</button>
                    </td>
                    <td>Good Afternnon, we need to do the testing by monday . Please read me</td>
                    <td>
                        <img src="images/Admin-LiveMessage/more.png" alt="more" class="LiveChat_MessagesInputImage"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <input type="checkbox"/>
                    </th>
                    <td>Jason Hing</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-secondary">Topic Design</button>
                    </td>
                    <td>Good Afternnon, we need to do the testing by monday . Please read me</td>
                    <td>
                        <img src="images/Admin-LiveMessage/more.png" alt="more" class="LiveChat_MessagesInputImage"/>
                    </td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
</asp:Content>