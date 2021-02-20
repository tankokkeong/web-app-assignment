<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="clients-management.aspx.cs" Inherits="web_app_assignment.admin.user_management" %>

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

    <div class="clients-container">
        <div class="client-title">
            <h3>User Management</h3>
        </div>

        <div class="table-container">
            <table class="table table-striped table-bordered">
              <thead>
                <tr class="bg-lightgreen text-light">
                  <th scope="col">User ID</th>
                  <th scope="col">User Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Role</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                  <%for (int i = 0; i < 5; i++)
                      { %>

                <tr>
                    <th scope="row">U0002</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>Job Seeker</td>
                    <td>
                        <a href="clients-details.aspx?edit" class="badge badge-primary action-btn" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></a>
                        <a href="clients-details.aspx?view" class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></a>
                    </td>
                </tr>
                <%}; %>
              </tbody>
            </table>
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
                          <option>Active</option>
                          <option>Inactive</option>
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
</asp:Content>
