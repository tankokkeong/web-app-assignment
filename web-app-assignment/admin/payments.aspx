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

        <div class="payment-filter mt-3 mb-3">
            <div class="row">
                <div class="filter-title col-lg-1 font-weight-bold">
                    Filters:
                </div>

                <div class="col-lg-11">
                    <div class="row">
                        <div class="col-sm-12 col-lg-3 payment-filter-container">
                            <input class="form-control" type="text" placeholder="Payment ID" id="payment-id"/>
                        </div>

                        <div class="col-sm-12 col-lg-3 payment-filter-container">
                            <select class="form-control" id="payment-methods">
                                <option value="">Payment Methods</option>
                                <option value="Google Pay">Google Pay</option>
                                <option value="PayPal">PayPal</option>
                                <option value="Credit Card">Credit Card</option>
                            </select>
                        </div>

                        <div class="col-sm-12 col-lg-3 payment-filter-container">
                            <select class="form-control" id="payment-user-role">
                                <option value="">User Role</option>
                                <option value="Recruiter">Recruiter</option>
                                <option value="Job Seeker">Job Seeker</option>
                            </select>
                        </div>

                        <div class="col-sm-12 col-lg-3 payment-filter-container">
                            <input class="form-control" type="text" placeholder="Username" id="payment-username"/>
                        </div>
                                               
                    </div>

                    <div class="row">
                        <div class="col-sm-12 col-lg-2 payment-filter-container">     
                            <span class="pl-1">From :</span> <input class="form-control" type="date" id="payment-from-date"/>
                        </div>
                            

                        <div class="col-sm-12 col-lg-2 payment-filter-container">
                            <span class="pl-1">To:</span> <input class="form-control" type="date" id="payment-to-date"/>
                        </div>
                    </div>
                    
                    <div class="row mt-2">
                        <div class="col">
                            <button class="btn btn-info" onclick="paymentFilter()" type="button">Search</button>
                            <button class="btn btn-danger" type="button">Clear</button>
                        </div>
                        
                    </div>
                </div>
            </div>
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
    
    <script>
        function paymentFilter() {
            //Retrive User input
            var payment_id = document.getElementById("payment-id").value;
            var payment_method = document.getElementById("payment-methods").value;
            var user_role = document.getElementById("payment-user-role").value;
            var username = document.getElementById("payment-username").value;
            var payment_from_date = document.getElementById("payment-from-date").value;
            var payment_to_date = document.getElementById("payment-to-date").value;

            //Generate searching query string

            window.location.href = "payments.aspx?payment_id=" + payment_id + "&payment_method=" + payment_method +
                "&user_role=" + user_role + "&username=" + username + "&from=" + payment_from_date + "&to=" + payment_to_date;
        }

        function filterSticky() {

            //User input
            var payment_id = document.getElementById("payment-id");
            var payment_method = document.getElementById("payment-methods");
            var user_role = document.getElementById("payment-user-role");
            var username = document.getElementById("payment-username");
            var payment_from_date = document.getElementById("payment-from-date");
            var payment_to_date = document.getElementById("payment-to-date")

            var query = window.location.href.split("?")[1].split("&");

            //Place the sticky values
            payment_id.value = query[0].split("=")[1];
            payment_method.value = query[1].split("=")[1];
            user_role.value = unescape(query[2].split("=")[1]); 
            username.value = unescape(query[3].split("=")[1]);
            payment_from_date.value = query[4].split("=")[1];
            payment_to_date.value = query[5].split("=")[1];

            console.log(query[0].split("=")[1])
        }

        //Call sticky form function
        filterSticky();
    </script>
</asp:Content>
