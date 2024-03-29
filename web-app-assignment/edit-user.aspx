﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-user.aspx.cs" Inherits="web_app_assignment.edit_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit User</title>
    <link href="style/edit-user.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.16.0/full-all/ckeditor.js"></script>   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="profile-container">
        <div class="profile-form">
                <div class="form-row mb-3">
                    <h2>My Information</h2>
                </div>

                <div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none;" id="updated-alert">
                  Profile updated successful!
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>

               <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <asp:Image ID="imgSeekerProfile" runat="server" class="edit-profile-pic"/><br />
                    
                    <label for="inputEmail4">Profile Photo</label>
                    <asp:FileUpload ID="fileSeekerPhoto" runat="server" cssClass="form-control" onchange="profilePhotoUpload()"/>
                    <asp:TextBox ID="txtSeekerPhoto" runat="server" style="display:none;"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Company photo is required!" ControlToValidate="txtSeekerPhoto" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="only .jpg, .png and gif are allowed!" ControlToValidate="fileSeekerPhoto" CssClass="text-danger" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.PNG|.JPG|.GIF)$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
        
              </div>

              <div class="form-row">
                <div class="form-group col-md-6 m-0">
                  <label for="inputEmail4">Full Name:</label>
                   <asp:TextBox ID="txtSeekerName" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Company name is required!" ControlToValidate="txtSeekerName" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputPassword4">Contact Email:</label>
                    <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" placeholder="Contact Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Contact Email is required!" ControlToValidate="txtContactEmail" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email format!" ControlToValidate="txtContactEmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
                  
              </div>

             <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Phone:</label>                    
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone number is required!" ControlToValidate="txtPhone" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid phone format!" ControlToValidate="txtPhone" CssClass="text-danger" ValidationExpression="^([\+]?(?:00)?[0-9]{1,3}[\s.-]?[0-9]{1,12})([\s.-]?[0-9]{1,4}?)$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
                
                 <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Gender:</label>                    
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select One</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Prefer Not To Say">Prefer Not To Say</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Gender is required!" ControlToValidate="ddlGender" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                 
                 

            </div>

             <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Location:</label>                    
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="ex: Selangor"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Location is required!" ControlToValidate="txtLocation" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                 <div class="form-group col-md-6 m-0 country-drop">
                    <label for="inputAddress">Country:</label>                    
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" style="width:100%;">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Country is required!" ControlToValidate="ddlCountry" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <script>
                        $("#ContentPlaceHolder1_ddlCountry").select2({});
                    </script>
                </div>
            </div>

            <div class="form-row">
                
                 <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Preferred Industry:</label>

                    <select class="form-control" style="width:100%;" id="industry-selection" multiple="multiple" onchange="addIndustry();"></select>
                     <asp:TextBox ID="txtIndustry" runat="server" CssClass="form-control" style="display:none;"></asp:TextBox>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Industry is required!" ControlToValidate="txtIndustry" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                    <script>
                        $("#industry-selection").select2({
                            placeholder: "Enter one or more industries",
                            allowClear: true,
                            tags: true,
                        });
                    </script>
                 </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Profession:</label>
                    <asp:TextBox ID="txtProfession" runat="server" CssClass="form-control" placeholder="ex: Software Engineer"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Profession is required!" ControlToValidate="txtProfession" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Profession can only have characters!" ControlToValidate="txtProfession" CssClass="text-danger" ValidationExpression="^[a-zA-Z ]*$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Experience:</label>                    
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="ex: 4 years"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Experience is required!" ControlToValidate="txtExperience" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Skills:</label>   
                    
                    <select class="form-control" style="width:100%;" id="skill-selection" multiple="multiple" onchange="addSkills()">
                    </select>

                     <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" style="display:none;"></asp:TextBox>  
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Skills is required!" ControlToValidate="txtSkills" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                    <script>
                        $("#skill-selection").select2({
                            placeholder: "Enter one or more skills",
                            allowClear: true,
                            tags: true,
                        });
                    </script>
                </div>
            </div>
          
                <div class="form-row mb-3">
                    <h2>Social Media</h2>
                </div>

                <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputAddress">Facebook Link <strong>(Optional)</strong>:</label>
                    <asp:TextBox ID="txtFacebookLink" runat="server" CssClass="form-control" placeholder="Facebook Link"></asp:TextBox>
              </div>

                <div class="form-group col-md-6">
                    <label for="inputAddress">LinkedIn Link <strong>(Optional)</strong>:</label>
                    <asp:TextBox ID="txtLinkedInLink" runat="server" CssClass="form-control" placeholder="LinkedIn Link"></asp:TextBox>
              </div>

            </div>


            <div class="form-row mb-3">
                <h2>Introduction</h2>
            </div>

            <div class="form-row">
                <label for="staticEmail" class="col-sm-2 col-form-label">Introduction:</label>
                <div class="col-sm-12">
                    <textarea id="jobSeeker_introduction" class="form-control" placeholder="Write your company introduction here" name="jobSeeker_introduction"></textarea>  
                    <asp:TextBox ID="txtjobSeekerIntroduction" runat="server" style="display:none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Your introduction is required!" ControlToValidate="txtjobSeekerIntroduction" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <script>
                    var editor = CKEDITOR.replace('jobSeeker_introduction');
                    var seeker_introduction_input = document.getElementById("ContentPlaceHolder1_txtjobSeekerIntroduction");

                    // editor is object of your CKEDITOR
                    editor.on('change', function () {
                        seeker_introduction_input.value = window.escape(CKEDITOR.instances.jobSeeker_introduction.getData());

                    });
                </script>
            </div>
          
            <div class="form-group text-center mt-3">
                <asp:Button ID="updateSeekerProfile" runat="server" Text="Update" cssClass="btn bg-lightgreen text-light" OnClick="updateSeekerProfile_Click"/>
                <a href="user-profile.aspx" class="btn btn-secondary">Back</a>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
    </div>

    
    <script>
        //Sticky form script
        function getSeekerIntroduction() {
            var introduction_value = document.getElementById("ContentPlaceHolder1_txtjobSeekerIntroduction");
            var ck_editor = document.getElementById("jobSeeker_introduction");

            //Assign the value to CK EDITOR
            ck_editor.value = window.unescape(introduction_value.value);

            //Escape the data
            introduction_value.value = window.escape(CKEDITOR.instances.jobSeeker_introduction.getData());
        }

        function getSelectedIndustry() {
            var selected_industry = document.getElementById("ContentPlaceHolder1_txtIndustry").value.split(",");
            var select2_input = document.getElementById("industry-selection");

            if (document.getElementById("ContentPlaceHolder1_txtIndustry").value !== "") {
                //Add Customize creation for the users
                for (var i = 0; i < selected_industry.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(selected_industry[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + selected_industry[i] + "' selected id='" + selected_industry[i] + "'>" + selected_industry[i] + "</option>";
                    }
                }

                for (var i = 0; i < selected_industry.length; i++) {

                    if (document.getElementById(selected_industry[i]) != null) {
                        document.getElementById(selected_industry[i]).selected = true;
                    }

                }
            }
            

        }

        function getSelectedSkills() {
            var selected_skills = document.getElementById("ContentPlaceHolder1_txtSkills").value.split(",");
            var select2_input = document.getElementById("skill-selection");

            if (document.getElementById("ContentPlaceHolder1_txtSkills").value !== "") {
                //Add Customize creation for the users
                for (var i = 0; i < selected_skills.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(selected_skills[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + selected_skills[i] + "' selected id='" + selected_skills[i] + "'>" + selected_skills[i] + "</option>";
                    }
                }


                for (var i = 0; i < selected_skills.length; i++) {

                    if (document.getElementById(selected_skills[i]) != null) {
                        document.getElementById(selected_skills[i]).selected = true;
                    }

                }
            }
            

        }

        function addIndustry() {
            var selected_industry = $('#industry-selection').select2('data');
            var industry_input = document.getElementById("ContentPlaceHolder1_txtIndustry");

            //Clear previous input
            industry_input.value = "";

            for (var i = 0; i < selected_industry.length; i++) {

                if (i === 0) {
                    industry_input.value = selected_industry[i].text
                }
                else {
                    industry_input.value = industry_input.value + "," + selected_industry[i].text;
                }

            }
        }

        function addSkills() {
            var selected_skill = $('#skill-selection').select2('data');
            var skill_input = document.getElementById("ContentPlaceHolder1_txtSkills");

            //Clear previous input
            skill_input.value = "";

            for (var i = 0; i < selected_skill.length; i++) {

                if (i === 0) {
                    skill_input.value = selected_skill[i].text
                }
                else {
                    skill_input.value = skill_input.value + "," + selected_skill[i].text;
                }

            }
        }

        function profilePhotoUpload() {
            var file_input = document.getElementById("ContentPlaceHolder1_fileSeekerPhoto");
            var hidden_photo_input = document.getElementById("ContentPlaceHolder1_txtSeekerPhoto");

            if (hidden_photo_input.value === "") {
                //assign file input to hidden field
                hidden_photo_input.value = file_input.files[0].name;
            }
        }

        function checkUpdated() {
            var link = window.location.href.split("?");
            var updated_alert = document.getElementById("updated-alert");

            if (link[1] === "updated") {

                //Change to job application tab
                updated_alert.style.display = "";
            }
        }

        //Print out the available industry
        printSelect2Industry("industry-selection");
        printSelect2Skills("skill-selection");

        //Call stick form functions
        getSeekerIntroduction();        
        getSelectedIndustry();
        getSelectedSkills();

        //Check Updated alert
        checkUpdated();

    </script>
</asp:Content>
