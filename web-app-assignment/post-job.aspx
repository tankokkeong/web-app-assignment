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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtJobTitle" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Job Description:</label>
                    <div class="col-sm-10">
                       <textarea id="job_description" class="form-control" placeholder="Write Company overview here" name="job_description"></textarea>  
                        <asp:TextBox ID="txtJobDescription" runat="server" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtJobDescription" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <script>
                        var editor = CKEDITOR.replace('job_description');
                        var job_decription_input = document.getElementById("ContentPlaceHolder1_txtJobDescription");

                        // editor is object of your CKEDITOR
                        editor.on('change', function () {
                            job_decription_input.value = window.escape(CKEDITOR.instances.job_description.getData());

                        });
                    </script>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Salary:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtSalary" runat="server" class="form-control" placeholder="Salary"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtSalary" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Industry:</label>
                    <div class="col-sm-10">
                        <select class="form-control multiple-select2" id="industry-select" multiple onchange="formatSelectedIndustry()">
                            <option value="IT">IT</option>
                            <option value="Finance">Finance</option>
                        </select>
                        <asp:TextBox ID="txtIndustry" runat="server" class="form-control" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtIndustry" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Qualification:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="qualification-select" multiple onchange="formatSelectedQualification()">
                            <option value="Diploma">Diploma</option>
                            <option value="Degree">Degree</option>
                            <option value="Master Degree">Master Degree</option>
                        </select>
                        <asp:TextBox ID="txtQualification" runat="server" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtQualification" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Work Hours:</label>
                    <div class="col-sm-10">
                       <asp:TextBox ID="txtWorkingHours" runat="server" class="form-control" placeholder="Working Hours"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtWorkingHours" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Job Specializations:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="specilization-select"  multiple onchange="formatSelectedSpecilizations()">
                            <option value="IT">IT</option>
                            <option value="Finance">Finance</option>
                        </select>
                        <asp:TextBox ID="txtSpecilization" runat="server" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtSpecilization" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Company Overview:</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" placeholder="Write Company overview here" name="company_overview" id="company_overview"></textarea> 
                        <asp:TextBox ID="txtCompanyOverview" runat="server" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtCompanyOverview" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>

                    <script>
                        var editor = CKEDITOR.replace('company_overview');
                        var company_overview_input = document.getElementById("ContentPlaceHolder1_txtCompanyOverview");

                        // editor is object of your CKEDITOR
                        editor.on('change', function () {
                            company_overview_input.value = window.escape(CKEDITOR.instances.company_overview.getData());

                        });
                    </script>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Location:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtLocation" runat="server" class="form-control" placeholder="Location"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtLocation" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Experience Needed:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtExperienceNeeded" runat="server" class="form-control" placeholder="ex: 4 years"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtExperienceNeeded" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Job Type:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Select One</asp:ListItem>
                            <asp:ListItem Value="Full Time">Full Time</asp:ListItem>
                            <asp:ListItem Value="Part Time">Part Time</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is requried!" ControlToValidate="ddlJobType" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Head quarters:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtHeadQuarter" runat="server" class="form-control" placeholder="Head Quaters"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtHeadQuarter" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Benefits & others:</label>
                    <div class="col-sm-10">
                        <select class="multiple-select2" id="benefit-select" multiple onchange="formatSelectedBenefits()">
                            <option value="Medical">Medical</option>
                        </select>
                        <asp:TextBox ID="txtBenefits" runat="server" style="display:none;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtBenefits" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Company Size:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlCompanySize" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Select One</asp:ListItem>
                            <asp:ListItem Value="1 - 50 Employees">1 - 50 employees</asp:ListItem>
                            <asp:ListItem Value="51 - 200 Employees">51 - 200 employees</asp:ListItem>
                            <asp:ListItem Value="251 - 500 Employees">251 - 500 employees</asp:ListItem>
                            <asp:ListItem Value="More than 500 employees">More than 500 employees</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="This field is requried!" ControlToValidate="ddlCompanySize" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Processing Time:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtProcessingTime" runat="server" class="form-control" placeholder="ex: 3-5 days"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="This field is requried!" ControlToValidate="txtProcessingTime" CssClass="text-danger"></asp:RequiredFieldValidator>
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

        function formatSelectedIndustry() {
            var selected_industry = document.getElementById("ContentPlaceHolder1_txtIndustry");
            var selected_value = $("#industry-select").select2('val');

            //Clear previous input
            selected_industry.value = "";

            for (var i = 0; i < selected_value.length; i++) {
                if (i == selected_value.length - 1) {
                    selected_industry.value = selected_industry.value + selected_value[i];
                }
                else {
                    selected_industry.value = selected_industry.value + selected_value[i] + ",";
                }
                
            }

            console.log(selected_industry.value)
        }

        function formatSelectedQualification() {
            var selected_qualification = document.getElementById("ContentPlaceHolder1_txtQualification");
            var selected_value = $("#qualification-select").select2('val');

            //Clear previous input
            selected_qualification.value = "";

            for (var i = 0; i < selected_value.length; i++) {

                if (i == selected_value.length-1) {
                    selected_qualification.value = selected_qualification.value + selected_value[i];
                }
                else {
                    selected_qualification.value = selected_qualification.value + selected_value[i] + ",";
                }
                
            }

            console.log(selected_qualification.value)
        }

        function formatSelectedSpecilizations() {
            var selected_specilizations = document.getElementById("ContentPlaceHolder1_txtSpecilization");
            var selected_value = $("#specilization-select").select2('val');

            //Clear previous input
            selected_specilizations.value = "";

            for (var i = 0; i < selected_value.length; i++) {

                if (i == selected_value.length - 1) {
                    selected_specilizations.value = selected_specilizations.value + selected_value[i];
                }
                else {
                    selected_specilizations.value = selected_specilizations.value + selected_value[i] + ",";
                }

            }

            console.log(selected_specilizations.value)
        }

        function formatSelectedBenefits() {
            var selected_benefits = document.getElementById("ContentPlaceHolder1_txtBenefits");
            var selected_value = $("#benefit-select").select2('val');

            //Clear previous input
            selected_benefits.value = "";

            for (var i = 0; i < selected_value.length; i++) {

                if (i == selected_value.length - 1) {
                    selected_benefits.value = selected_benefits.value + selected_value[i];
                }
                else {
                    selected_benefits.value = selected_benefits.value + selected_value[i] + ",";
                }

            }

            console.log(selected_benefits.value)
        }
    </script>
</asp:Content>
