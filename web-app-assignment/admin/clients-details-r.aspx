<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="clients-details-r.aspx.cs" Inherits="web_app_assignment.admin.clients_details_r" %>

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
                <label for="staticEmail" class="col-sm-2 col-form-label">User ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtID" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Company Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtName" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Company Email:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
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
                <label for="staticContactEmail" class="col-sm-2 col-form-label">Premium:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPremium" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticAddress1" class="col-sm-2 col-form-label">Address Line 1:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAddress1" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticAddress2" class="col-sm-2 col-form-label">Address Line 2:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAddress2" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCity" class="col-sm-2 col-form-label">City:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCity" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticState" class="col-sm-2 col-form-label">State:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtState" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticZipCode" class="col-sm-2 col-form-label">Zip Code:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtZipCode" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCountry" class="col-sm-2 col-form-label">Country:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCountry" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticIndustry" class="col-sm-2 col-form-label">Industry:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtIndustry" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
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

            <div class="form-group row">
                <label for="staticRating" class="col-sm-2 col-form-label">Rating:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtRating" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="clients-management-r.aspx" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
