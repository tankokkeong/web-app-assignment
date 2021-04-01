<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="clients-details.aspx.cs" Inherits="web_app_assignment.admin.clients_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Client Details</title>
    <link href="css/client-details.css" rel="stylesheet" />
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
            <h2>Client Details</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticID" class="col-sm-2 col-form-label">User ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtID" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticName" class="col-sm-2 col-form-label">User Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtName" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">User Email:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticSkills" class="col-sm-2 col-form-label">Skills:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSkills" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticGender" class="col-sm-2 col-form-label">Gender:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtGender" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticContactNumber" class="col-sm-2 col-form-label">Contact Number:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtContactNumber" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticContactEmail" class="col-sm-2 col-form-label">Contact Email:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtContactEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticLocation" class="col-sm-2 col-form-label">Location:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLocation" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticProfession" class="col-sm-2 col-form-label">Profession:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtProfession" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticPreferIndustry" class="col-sm-2 col-form-label">Prefer Industry:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPreferIndustry" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCountry" class="col-sm-2 col-form-label">Country:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCountry" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticExperience" class="col-sm-2 col-form-label">Experience:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtExperience" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticFacebook" class="col-sm-2 col-form-label">Facebook:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtFacebook" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticLinkedin" class="col-sm-2 col-form-label">Linkedin:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLinkedin" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticIntroduction" class="col-sm-2 col-form-label">Introduction:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtIntroduction" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="clients-management.aspx" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
