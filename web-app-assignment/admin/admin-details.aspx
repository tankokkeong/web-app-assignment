<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-details.aspx.cs" Inherits="web_app_assignment.admin.admin_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Details</title>
    <link href="css/admin-details.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            live_chat = nav_option[2];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <div class="details-container">
        <div class="details-header mb-3">
            <h2>Admin Details</h2>
        </div>

        <form>
          <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control"  value="email@example.com">
            </div>
          </div>

          <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control"  value="email@example.com">
            </div>
          </div>

            <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
              <input type="text" readonly class="form-control"  value="email@example.com">
            </div>
          </div>

            <div class="form-group text-center">
                <a href="admin-management.aspx" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
