<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="jobs-management.aspx.cs" Inherits="web_app_assignment.admin.jobs_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Jobs Management</title>
    <link href="css/jobs-management.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[6];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="jobs-management-container">
             <div class="jobs-managemen-title">
                <h2>Jobs Posted</h2>
            </div>
        

            <div class="table-container">
                <asp:GridView ID="gvJobPosted" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-striped table-bordered" AllowPaging="true" PageSize="50" OnPageIndexChanging="gvJobPosted_PageIndexChanging"
                    EmptyDataText="No Data Found" OnRowDataBound="gvJobPosted_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" Width="600px" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="post_id" HeaderText="Post ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="job_title" HeaderText="Job Title" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="industry" HeaderText="Industry" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="salary" HeaderText="Salary" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="job_type" HeaderText="Job Type" HeaderStyle-CssClass="bg-lightgreen text-light" ControlStyle-Width="250px" ControlStyle-Height="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="rating" HeaderText="Rating" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="post_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
