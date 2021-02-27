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

               <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <asp:Image ID="imgSeekerProfile" runat="server" class="edit-profile-pic"/><br />
                    
                    <label for="inputEmail4">Profile Photo</label>
                    <asp:FileUpload ID="fileSeekerPhoto" runat="server" cssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Company photo is required!" ControlToValidate="fileSeekerPhoto" CssClass="text-danger"></asp:RequiredFieldValidator>
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
                </div>
              </div>

             <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Phone:</label>                    
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone number is required!" ControlToValidate="txtPhone" CssClass="text-danger"></asp:RequiredFieldValidator>
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

                     <asp:ListBox ID="lstIndustry" style="width:100%;" runat="server" CssClass="form-control" multiple="multiple" SelectionMode ="Multiple">
                     </asp:ListBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Industry is required!" ControlToValidate="lstIndustry" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                    <script>
                        $("#ContentPlaceHolder1_lstIndustry").select2({
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
                   <asp:ListBox ID="lstSkills" style="width:100%;" runat="server" CssClass="form-control" multiple="multiple" SelectionMode ="Multiple">
                        <asp:ListItem Value="Publick Speaking">Publick Speaking</asp:ListItem>
                       <asp:ListItem Value="Java">Java</asp:ListItem>
                       <asp:ListItem Value="C#">C#</asp:ListItem>
                       <asp:ListItem Value="Python">Python</asp:ListItem>
                       <asp:ListItem Value="PHP">PHP</asp:ListItem>
                   </asp:ListBox>                     
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Skills is required!" ControlToValidate="lstSkills" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                    <script>
                        $("#ContentPlaceHolder1_lstSkills").select2({
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
        }

        //Call stick form functions
        getSeekerIntroduction();

    </script>
</asp:Content>
