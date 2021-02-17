<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-management.aspx.cs" Inherits="web_app_assignment.admin.admin_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Management</title>
    <link href="css/admin-management.css" rel="stylesheet" />
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

        <div class="admin-container">
        <div class="admin-title">
            <h3>Admin Management</h3>
        </div>

        <div class="table-container">

            <div class="float-right mb-3 mt-3">
                <button class="btn bg-lightgreen text-light" data-toggle="modal" data-target="#addAdmin">New Admin</button>
            </div>

            <table class="table table-striped table-bordered">
              <thead>
                <tr class="bg-lightgreen text-light">
                  <th scope="col">Admin ID</th>
                  <th scope="col">Admin Name</th>
                  <th scope="col">Admin Email</th>
                  <th scope="col">Role</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                  <%for (int i = 0; i < 5; i++)
                      { %>
                <tr>
                  <th scope="row">U0001</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>Recrutier</td>
                  <td>
                      <span class="badge badge-primary action-btn" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></span>
                      <span class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></span>
                      <span class="badge badge-danger action-btn" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></span>
                  </td>
                </tr>

                <tr>
                    <th scope="row">U0002</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>Job Seeker</td>
                    <td>
                        <span class="badge badge-primary action-btn" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></span>
                        <span class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></span>
                        <span class="badge badge-danger action-btn" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></span>
                    </td>
                </tr>
                <%}; %>
              </tbody>
            </table>
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
            <form>
                 <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Admin Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" placeholder="email@example.com">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Admin Role</label>
                    <div class="col-sm-10">
                      <select class="form-control">
                          <option>Editor</option>
                          <option>Role</option>
                      </select>
                    </div>
                  </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Add</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
