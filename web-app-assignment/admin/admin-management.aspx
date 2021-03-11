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
                <button type="button" class="btn bg-lightgreen text-light" data-toggle="modal" data-target="#addAdmin">New Admin</button>
            </div>
            
            <%--display--%>
            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CssClass="table table-striped table-bordered" >
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke"/>
                    <Columns>
                        <asp:BoundField runat="server" DataField="admin_id" HeaderText="Admin ID" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_name" HeaderText="Admin Name" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_email" HeaderText="Admin Email" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="400px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_right" HeaderText="Role" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    <!-- New Admin Modal -->
    <div class="modal fade" id="addAdmin" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Add New Admin</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                 <div class="form-group row">
                     <div class="col-sm-10">
                     <asp:Label ID="lblAdminEmail" runat="server" Text="Admin Email"></asp:Label>
                     <asp:TextBox ID="txtAdminEmail" runat="server" class="form-control"></asp:TextBox>
                    <%--<label for="staticEmail" class="col-sm-2 col-form-label">Admin Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" placeholder="email@example.com">--%>
                     </div>
                 </div>
                 <div class="form-group row">
                     <div class="col-sm-10">
                         <asp:Label ID="lblAdminRight" runat="server" Text="Admin Role "></asp:Label>
<%--                    <label for="inputPassword" class="col-sm-2 col-form-label">Admin Role</label>--%>
                         <asp:DropDownList ID="listAdminRight" runat="server" >
                            <asp:ListItem Value="Default">Please Select</asp:ListItem>
                            <asp:ListItem Value="Editor">Editor</asp:ListItem>  
                            <asp:ListItem Value="Viewer">Viewer</asp:ListItem>
                         </asp:DropDownList>
                      <%--<select class="form-control">
                          <option>Super Admin</option>
                          <option>Editor</option>
                          <option>Viewer</option>
                      </select>--%>
                     </div>
                 </div>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <asp:Button ID="btnAddAdmin" runat="server" Text="Add" class="btn btn-primary" OnClick="btnAddAdmin_Click"/>
           <%--<button type="button" class="btn btn-primary">Add</button>--%>
          </div>
        </div>
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
            <asp:Button ID="btnDeleteAdmin" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnDeleteAdmin_Click"/>
            <asp:TextBox ID="txtDeleteAdmin" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    <script>
        function deleteAdmin(admin_id) {
            var delete_admin = document.getElementById("ContentPlaceHolder1_txtDeleteAdmin");

            delete_admin.value = admin_id;
        }
    </script>
    </form>
</asp:Content>
