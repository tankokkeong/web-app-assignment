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
        <asp:GridView ID="gvContactMessage" runat="server" AutoGenerateColumns="false" DataKeyNames="contact_id" AllowSorting="true" >
            <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#c0c0c0"/>
            <Columns>
                <asp:BoundField DataField="contact_name" HeaderText="Name" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="400px"/>
                <asp:BoundField DataField="phone_number" HeaderText="Contact Number" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"/>
                <asp:BoundField DataField="company_email" HeaderText="Email" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="500px"/>
                 <asp:HyperLinkField DataNavigateUrlFields="contact_id" DataNavigateUrlFormatString="message-details.aspx?Id={0}" HeaderStyle-CssClass="bg-lightgreen text-light" Text="View" HeaderStyle-Width="50px"/>
                <asp:ButtonField Text="Delete" HeaderStyle-CssClass="bg-lightgreen text-light" />
            </Columns>
        </asp:GridView>
     </div>

     </form>


    <%--
        <div class="table-container">
            <table class="table table-striped table-bordered">
              <thead>
                <tr class="bg-lightgreen text-light">
                  <th scope="col">Name</th>
                  <th scope="col">Contact Number</th>
                  <th scope="col">Email</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Mark</td>
                  <td>0123456789</td>
                  <td>demo@gmail.com</td>
                  <td>
                      <a href="message-details.aspx" class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></a>
                      <span class="badge badge-danger action-btn" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></span>
                  </td>
                </tr>
              </tbody>
            </table>
        </div>
    --%>
    </div>
</asp:Content>
