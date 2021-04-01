﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="clients-management-r.aspx.cs" Inherits="web_app_assignment.admin.clients_management_r" %>

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

            <div>
                <style>
                    ul {
                        list-style-type: none;
                        margin: 0;
                        padding: 0;
                        overflow: hidden;
                    }

                    li {
                        float: left;
                    }

                        li a {
                            display: block;
                            padding: 8px;
                        }
                </style>
                <ul>
                    <li><a href="clients-management.aspx">Job Seeker</a></li>
                    <li><a href="clients-management-r.aspx">Recruiter</a></li>
                </ul>
            </div>

            <%--display--%>
            <div class="table-container">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView3_RowDataBound" CssClass="table table-striped table-bordered">
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="recruiter_id" HeaderText="User ID" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="company_name" HeaderText="Company Name" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="email" HeaderText="User Email" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="400px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="recruiter_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Edit User Modal -->
            <div class="modal fade" id="editUser" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="editUserLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Edit User</h5>
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
                            <asp:Button ID="btnEditUser" runat="server" Text="Update" class="btn btn-primary" OnClick="btnEditUser_Click" />
                            <asp:TextBox ID="txtEditUser" runat="server" Style="display: none;"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
