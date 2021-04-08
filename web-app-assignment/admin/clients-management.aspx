<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="clients-management.aspx.cs" Inherits="web_app_assignment.admin.clients_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Management</title>
    <link href="css/user-management.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            admin_management = nav_option[2];
            $(admin_management).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="clients-container">
            <div class="client-title">
                <h3>User Management</h3>
            </div>

            <div class="user-filter mt-3 mb-3">
                <div class="row">
                    <div class="filter-title col-lg-1 font-weight-bold">
                        Filters:
                    </div>

                    <div class="col-lg-11">
                        <div class="row">
                            <div class="col-sm-12 col-lg-3 user-filter-container">                                
                                <asp:TextBox ID="txtUserID" runat="server" TextMode="Number" min="1" CssClass="form-control" placeholder="User Id"></asp:TextBox>
                            </div>
                            
                            <div class="col-sm-12 col-lg-3 user-filter-container">
                                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" placeholder="User Email"></asp:TextBox>
                            </div>

                            <div class="col-sm-12 col-lg-3 user-filter-container">
                                <asp:DropDownList ID="ddlUserStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">User Status</asp:ListItem>
                                    <asp:ListItem Value="active">Active</asp:ListItem>
                                    <asp:ListItem Value="inactive">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-sm-12 col-lg-3 user-filter-container">
                                 <select class="form-control" onchange="changeClientsType()" id="client-management-option">
                                    <option value="Job Seeker">Job Seeker</option>
                                    <option value="Recruiter">Recruiter</option>
                                </select>

                                <script>
                                    function changeClientsType() {
                                        var x = document.getElementById("client-management-option").value;

                                        if (x === "Job Seeker") {
                                            window.location = "clients-management.aspx";
                                        }
                                        else if (x === "Recruiter") {
                                            window.location = "clients-management-r.aspx";
                                        }
                                    }

                                    function clearFilter() {
                                        window.location.href = "clients-management.aspx";
                                    }
                                </script>
                            </div>
                                               
                        </div>

                        <div class="row">
                            <div class="col-sm-12 col-lg-2 user-filter-container">     
                                <span class="pl-1">From :</span>                                 
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" class="form-control"></asp:TextBox>
                            </div>
                            

                            <div class="col-sm-12 col-lg-2 user-filter-container">
                                <span class="pl-1">To:</span>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    
                        <div class="row mt-2">
                            <div class="col">
                                <asp:Button ID="btnUserSearch" runat="server" Text="Search" class="btn btn-info" OnClick="btnSearch_Click"/>
                                <button class="btn btn-danger" type="button" onclick="clearFilter()">Clear</button>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>     

            <div class="row">
               <label class="col-sm-12 col-lg-2 col-form-label">Premium:</label>
                <div class="col-sm-12 col-lg-3 pr-1">
                    <asp:Label ID="lblUserPrimium" runat="server" Text="Label"></asp:Label> Users
                </div>
            </div>

            <div class="row">
               <label class="col-sm-12 col-lg-2 col-form-label">Non Premium:</label>
                <div class="col-sm-12 col-lg-3 pr-1">
                    <asp:Label ID="lblUserNonPremium" runat="server" Text="Label"></asp:Label> Users
                </div>
            </div>

            <%--display--%>
            <div class="table-container">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" CssClass="table table-striped table-bordered" 
                    AllowPaging="true" PageSize="50" OnPageIndexChanging="GridView2_PageIndexChanging" EmptyDataText="No User Found">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="seeker_id" HeaderText="User ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="full_name" HeaderText="User Name" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="email" HeaderText="User Email" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="active" HeaderText="User Status" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="seeker_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
