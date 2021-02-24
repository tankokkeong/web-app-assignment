<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="post-job.aspx.cs" Inherits="web_app_assignment.post_job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post Job</title>
    <link href="style/post-job.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.16.0/full-all/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="post-job-container">
        <div class="post-job-form">
            <div class="post-job-header text-center">
                <h1>Job Details</h1>
            </div>

            <form>
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Job Title:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" placeholder="Job title"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Job Description:</label>
                    <div class="col-sm-10">
                       <textarea  class="form-control" placeholder="Write Company overview here" name="job_description"></textarea>  
                    </div>

                    <script>
                        CKEDITOR.replace('job_description');
                    </script>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Salary:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtSalary" runat="server" class="form-control" placeholder="Salary"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Industry:</label>
                    <div class="col-sm-10">
                        <select class="form-control multiple-select2" id="industry-select" aria-label="jobCategory" aria-describedby="jobCategory" multiple>
                            <option value="IT">IT</option>
                            <option value="Finance">Finance</option>
                        </select>
                       <%--<asp:TextBox ID="txtIndustry" runat="server" class="form-control" placeholder="Industry"></asp:TextBox>--%>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Qualification:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="qualification-select"  multiple>
                            <option value="IT">IT</option>
                            <option value="Finance">Finance</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Work Hours:</label>
                    <div class="col-sm-10">
                       <asp:TextBox ID="txtWorkingHours" runat="server" class="form-control" placeholder="Working Hours"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Job Specializations:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="specilization-select"  multiple>
                            <option value="IT">IT</option>
                            <option value="Finance">Finance</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Company Overview:</label>
                    <div class="col-sm-10">
                       <textarea  class="form-control" placeholder="Write Company overview here" name="company_overview"></textarea>  
                    </div>

                    <script>
                        CKEDITOR.replace('company_overview');
                    </script>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Location:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" placeholder="Location"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Experience Needed:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtExperienceNeeded" runat="server" class="form-control" placeholder="ex: 4 years"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Job Type:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Full Time">Full Time</asp:ListItem>
                            <asp:ListItem Value="Part Time">Part Time</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Experience Needed:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="ex: 4 years"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Head quarters:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtHeadQuarter" runat="server" class="form-control" placeholder="Head Quaters"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Benefits & others:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="benefit-select"  multiple>
                            <option value="Medical">Medical</option>
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Company Size:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlCompanySize" runat="server" CssClass="form-control">
                            <asp:ListItem Value="1 - 50 Employees">1 - 50 employees</asp:ListItem>
                            <asp:ListItem Value="51 - 200 Employees">51 - 200 employees</asp:ListItem>
                            <asp:ListItem Value="251 - 500 Employees">251 - 500 employees</asp:ListItem>
                            <asp:ListItem Value="More than 500 employees">More than 500 employees</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Processing Time:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="ex: 3-5 days"></asp:TextBox>
                    </div>
                </div>
                


                <div class="mt-3 text-center">
                    <asp:Button ID="btn_submit" runat="server" Text="Post" OnClick="btn_submit_Click" class="btn btn-info"/>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        $("#industry-select").select2({
            placeholder: "Enter one or more industries",
            allowClear: true,
            tags: true,
        });

        $("#qualification-select").select2({
            placeholder: "Enter one or more qualifications",
            allowClear: true,
            tags: true,
        });

        $("#specilization-select").select2({
            placeholder: "Enter one or more specilizations",
            allowClear: true,
            tags: true,
        });

        $("#benefit-select").select2({
            placeholder: "Enter one or benefits",
            allowClear: true,
            tags: true,
        });
    </script>
</asp:Content>
