<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="careers.aspx.cs" Inherits="web_app_assignment.admin.careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Career</title>
    <link href="css/careers.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[7];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="career-container">
            <div class="career-title">
                <h2>Applicants Records</h2>
            </div>

            <div class="table-container">
                <asp:GridView ID="gvCareer" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" 
                    AllowPaging="true" PageSize="50" EmptyDataText="No Applicants Found" OnRowCommand="gvCareer_RowCommand">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="applicant_id" HeaderText="Applicant ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="applicant_name" HeaderText="Applicant Name" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="applicant_email" HeaderText="Applicant Email" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="applicant_position" HeaderText="Position Interested" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="applicant_status" HeaderText="Applicant Status" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>     
                        <asp:BoundField runat="server" DataField="created_at" HeaderText="Applied Date" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Resume" ShowHeader="False" HeaderStyle-CssClass="bg-lightgreen text-light">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-info"
                                    CausesValidation="False" 
                                    CommandArgument='<%# Eval("resume") %>'
                                    CommandName="Download" Text='Download'>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
