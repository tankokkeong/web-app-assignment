<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="payments.aspx.cs" Inherits="web_app_assignment.admin.payments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Payment Records</title>
    <link href="css/payments.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[5];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>
    <form runat="server">
        <div class="payment-container">
        <div class="payment-title">
            <h2>Payment Records</h2>
        </div>

        <div class="table-container">
            <table class="table table-striped table-bordered">
                <thead>
                <tr class="bg-lightgreen text-light">
                  <th scope="col">Payment ID</th>
                  <th scope="col">Payment Methods</th>
                  <th scope="col">User Role</th>
                  <th scope="col">Username</th>
                  <th scope="col">Payment date</th>
                </tr>
              </thead>
              <tbody>
            <asp:ListView ID="lvPaymentRecords" runat="server">
                <ItemTemplate>
                    
              
                <tr>
                    <th scope="row"><%#Eval("payment_id") %></th>
                    <td><%#Eval("payment_method") %></td>
                    <td><%#Eval("user_role") %></td>
                    <td><%#Eval("username") %></td>
                    <td>
                        <%#Eval("created_at") %>
                    </td>
                </tr>
              
                </ItemTemplate>
            </asp:ListView>
                  </tbody>
            </table>

            <asp:DataPager ID="dpPaymentPagination" runat="server" PagedControlID="lvPaymentRecords" PageSize="50" class="pagination mt-3" OnPreRender="dpPaymentPagination_PreRender">
                <Fields >
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="page-link page-item"/>
                    <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="page-link page-item" CurrentPageLabelCssClass="page-link page-active" NextPreviousButtonCssClass="page-link page-item"/>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="true" ButtonCssClass="page-link page-item"/>
                </Fields>
        </asp:DataPager>
        </div>
    </div>
    </form>
    
</asp:Content>
