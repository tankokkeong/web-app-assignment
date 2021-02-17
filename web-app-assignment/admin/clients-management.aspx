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
                  <th scope="row">U0001</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>Recrutier</td>
                  <td>
                      <span class="badge badge-primary action-btn" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></span>
                      <span class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></span>               
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
                    </td>
                </tr>
                <%}; %>
              </tbody>
            </table>
        </div>
    </div>
</asp:Content>
