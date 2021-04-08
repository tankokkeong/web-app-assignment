<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="contact-message.aspx.cs" Inherits="web_app_assignment.admin.contact_message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Message</title>
    <link href="css/contact-message.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            contact_message = nav_option[3];
            $(contact_message).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>
    <div class="message-container">
        <div class="message-title">
            <h2>Contact Message</h2>
        </div>
        <form runat="server">

            <div class="table-container">
                <asp:GridView ID="gvContactMessage" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvContactMessage_RowDataBound"
                    CssClass="table table-striped table-bordered" AllowPaging="true" PageSize="5"
                    OnPageIndexChanging="gvContactMessage_PageIndexChanging">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField DataField="contact_name" HeaderText="Name" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="400px"></asp:BoundField>
                        <asp:BoundField DataField="phone_number" HeaderText="Contact Number" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField DataField="company_email" HeaderText="Email" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="500px"></asp:BoundField>
                        <asp:BoundField DataField="contact_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Delete Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete this message record?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnDeleteMessage" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnDeleteMessage_Click" />
                            <asp:TextBox ID="txtDeleteMessage" runat="server" Style="display: none;"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>

    <script>
        function deleteMessage(id) {
            var delete_message = document.getElementById("ContentPlaceHolder1_txtDeleteMessage");

            //Change the id
            delete_message.value = id;
        }
    </script>
</asp:Content>
