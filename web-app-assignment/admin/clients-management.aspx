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

            <div class="form-group row mt-3 mb-3">
                <label class="col-sm-2 col-form-label">User Type:</label>
                <div class="col-sm-10">
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
                    </script>
                </div>
            </div>

            <%--display--%>
            <div class="table-container">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" CssClass="table table-striped table-bordered">
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="seeker_id" HeaderText="User ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="full_name" HeaderText="User Name" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="email" HeaderText="User Email" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="seeker_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Edit User Modal -->
        <div class="modal fade" id="editUser" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="editUserLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">User Status</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td>User Status</td>
                                    <td>
                                        <select class="form-control">
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
