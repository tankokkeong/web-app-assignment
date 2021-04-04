<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-management.aspx.cs" Inherits="web_app_assignment.admin.admin_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Management</title>
    <link href="css/admin-management.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
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

        <div class="admin-container">
            <div class="admin-title">
                <h3>Admin Management</h3>
            </div>

            <div class="float-right mb-3 mt-3">
                <a href="admin-create.aspx" id="newAdmin" type="button" class="btn bg-lightgreen text-light" runat="server">New Admin</a>
            </div>

            <%--display--%>
            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CssClass="table table-striped table-bordered">
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="admin_id" HeaderText="Admin ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_name" HeaderText="Admin Name" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_email" HeaderText="Admin Email" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_right" HeaderText="Role" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Delete Modal -->
        <div class="modal fade" id="deleteAdmin" tabindex="-1" aria-labelledby="deleteAdminLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleAdminLabel">Delete Admin</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">Are you sure you want to delete this admin?</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnDeleteAdmin" runat="server" Text="Yes" class="btn btn-danger" OnClick="btnDeleteAdmin_Click" />
                        <asp:TextBox ID="txtDeleteAdmin" runat="server" Style="display: none;"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function deleteAdmin(admin_id) {
                var delete_admin = document.getElementById("ContentPlaceHolder1_txtDeleteAdmin");

                delete_admin.value = admin_id;
            }

            //function addAdmin() {
            //    var adminEmail, adminRight, emailExp;
            //    adminEmail = document.getElementById("txtAdminEmail").value;
            //    adminRight = document.getElementById("listAdminRight").value;
            //    emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; //validate email   

            //    if (adminEmail == '' && adminRight == 'True') {
            //        alert("Plese Enter Admin Email and Admin Role!");
            //        return false;
            //    }
            //    if (adminEmail == '') {
            //        alert("Please Enter Admin Email");
            //        return false;
            //    }
            //    if (adminRight == 'True') {
            //        alert("Please Select Admin Role");
            //        return false;
            //    }
            //    if (adminEmail != '') {
            //        if (!adminEmail.match(emailExp)
            //        {
            //            alert("Invalid Email");
            //            return false;
            //        }
            //    }
            //    return true;
            //}
        </script>

    </form>
</asp:Content>
