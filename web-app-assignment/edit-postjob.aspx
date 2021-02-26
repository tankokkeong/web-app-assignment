<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-postjob.aspx.cs" Inherits="web_app_assignment.edit_postob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Job</title>
    <link href="style/edit-postjob.css" rel="stylesheet" />
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
                        <asp:ListBox ID="lstIndustry" runat="server" multiple="multiple" SelectionMode="Multiple"></asp:ListBox>                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is requried!" ControlToValidate="lstIndustry" CssClass="text-danger"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Qualification:</label>
                    <div class="col-sm-10">
                        <asp:ListBox ID="lstQualification" runat="server" multiple="multiple" SelectionMode="Multiple">
                            <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                            <asp:ListItem Value="Degree">Degree</asp:ListItem>
                            <asp:ListItem Value="Master Degree">Master Degree</asp:ListItem>
                        </asp:ListBox>                
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is requried!" ControlToValidate="lstQualification" CssClass="text-danger"></asp:RequiredFieldValidator>

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
                        <asp:ListBox ID="lstJobSpecialization" runat="server" multiple="multiple" SelectionMode="Multiple"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is requried!" ControlToValidate="lstJobSpecialization" CssClass="text-danger"></asp:RequiredFieldValidator>

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
                        <asp:ListBox ID="lstBenefits" runat="server" multiple="multiple" SelectionMode="Multiple">
                            <asp:ListItem Value="Medical">Medical</asp:ListItem>
                        </asp:ListBox>                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="This field is requried!" ControlToValidate="lstBenefits" CssClass="text-danger"></asp:RequiredFieldValidator>

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
                    <asp:Button ID="btnUpdateJob" runat="server" Text="Update" class="btn btn-info" OnClick="btnUpdateJob_Click"/>
                    <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        $("#ContentPlaceHolder1_lstIndustry").select2({
            placeholder: "Enter one or more industries",
            allowClear: true,
            tags: true,
        });

        $("#ContentPlaceHolder1_lstQualification").select2({
            placeholder: "Enter one or more qualifications",
            allowClear: true,
            tags: true,
        });

        $("#ContentPlaceHolder1_lstJobSpecialization").select2({
            placeholder: "Enter one or more specilizations",
            allowClear: true,
            tags: true,
        });

        $("#ContentPlaceHolder1_lstBenefits").select2({
            placeholder: "Enter one or benefits",
            allowClear: true,
            tags: true,
        });

        //Sticky form script
        function getCompanyOverview() {
            var company_overview_value = document.getElementById("ContentPlaceHolder1_txtCompanyOverview");
            var ck_editor = document.getElementById("company_overview");

            //Assign the value to CK EDITOR
            ck_editor.value = window.unescape(company_overview_value.value);

            //Escape the input value
            company_overview_value.value = window.escape(company_overview_value.value);
        }

        function getJobDescription() {
            var job_description_value = document.getElementById("ContentPlaceHolder1_txtJobDescription");
            var ck_editor = document.getElementById("job_description");

            //Assign the value to CK EDITOR
            ck_editor.value = window.unescape(job_description_value.value);

            //Escape the input value
            job_description_value.value = window.escape(job_description_value.value);
        }

        //Call stick form functions
        getCompanyOverview();
        getJobDescription();
    </script>
</asp:Content>
