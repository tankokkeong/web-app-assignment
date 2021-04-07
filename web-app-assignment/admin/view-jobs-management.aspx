<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="view-jobs-management.aspx.cs" Inherits="web_app_assignment.admin.view_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Management Details</title>
    <link href="css/view-jobs-management.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to user management
            pages_management = nav_option[6];
            $(pages_management).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <div class="view-jobs-container">
        <div class="view-jobs-header mb-3">
            <h2>View Jobs</h2>
        </div>

        <form runat="server">
            <div class="form-group row">
                <label for="staticTitle" class="col-sm-2 col-form-label">Jobs Title:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtJobTitle" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Industry:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtIndustry" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="blogImageDisplay" class="col-sm-2 col-form-label">Salary:</label>
                <div class="col-sm-10">
                    <div class="picture-container">
                        <asp:TextBox ID="txtSalary" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticDesc" class="col-sm-2 col-form-label">Job Type:</label>
                <div class="col-sm-10">
                    <div>
                        <asp:TextBox ID="txtJobType" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Rating:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtRating" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

                        <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Company Overview:</label>
                <div class="col-sm-10">
                    <div ID="txtCompanyOverview" ReadOnly="true" CssClass="form-control" runat="server"></div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Job Description:</label>
                <div class="col-sm-10">
                    <div ID="txtJobDescription" ReadOnly="true" CssClass="form-control" runat="server"></div>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Qualification:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtQualification" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Location:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLocation" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Working Hours:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtWorkingHours" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Experience Needed:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtExperienceNeeded" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Job Specialization:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtJobSpecialization" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Head Quaters:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtHQ" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Benefits:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtBenefits" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Company Size:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtCompanySize" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="staticCategory" class="col-sm-2 col-form-label">Process Time:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtProcessTime" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group text-center">
                <a href="jobs-management.aspx" class="btn btn-secondary">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
