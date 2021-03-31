<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-recruiter.aspx.cs" Inherits="web_app_assignment.edit_recruiter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Recruiter</title>
    <link href="style/edit-recruiter.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.16.0/full-all/ckeditor.js"></script>   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="profile-form">
                <div class="form-row mb-3">
                    <h2>Company Information</h2>
                </div>

               <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <asp:Image ID="imgRecruiterProfile" runat="server" class="edit-profile-pic"/><br />
                    
                    <label for="inputEmail4">Profile Photo</label>
                    <asp:FileUpload ID="fileCompanyPhoto" runat="server" cssClass="form-control" onchange="profilePhotoUpload()"/>
                    <asp:TextBox ID="txtCompanyPhoto" runat="server" style="display:none;"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Company photo is required!" ControlToValidate="txtCompanyPhoto" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="only .jpg, .png and gif are allowed!" ControlToValidate="fileCompanyPhoto" CssClass="text-danger" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.PNG|.JPG|.GIF)$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
        
              </div>

              <div class="form-row">
                <div class="form-group col-md-6 m-0">
                  <label for="inputEmail4">Company Name:</label>
                   <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Company Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Company name is required!" ControlToValidate="txtCompanyName" CssClass="text-danger"></asp:RequiredFieldValidator>
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
                    <label for="inputAddress">Industry:</label>

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
                 
                 

            </div>

             <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Adress Line 1:</label>                    
                    <asp:TextBox ID="txtAddressLine1" runat="server" CssClass="form-control" placeholder="Address Line 1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address Line 1 is required!" ControlToValidate="txtAddressLine1" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Adress Line 2 <strong>(Optional)</strong>:</label>
                    <asp:TextBox ID="txtAddressLine2" runat="server" CssClass="form-control" placeholder="Address Line 2"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">City:</label>                    
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="City is required!" ControlToValidate="txtCity" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="City can only have characters!" ControlToValidate="txtCity" CssClass="text-danger" ValidationExpression="^[a-zA-Z ]*$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">State:</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="State is required!" ControlToValidate="txtState" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="State can only have characters!" ControlToValidate="txtState" CssClass="text-danger" ValidationExpression="^[a-zA-Z ]*$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6 m-0 country-drop">
                    <label for="inputAddress">Country:</label>                    
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" style="width:100%;">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Country is required!" ControlToValidate="ddlCountry" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <script>
                        $("#ContentPlaceHolder1_ddlCountry").select2({});
                    </script>
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Zip Code:</label>                    
                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Zip Code is required!" ControlToValidate="txtZipCode" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Zip code can only have numbers!" ControlToValidate="txtZipCode" CssClass="text-danger" ValidationExpression="^\d+$" style="position:absolute; left:10px;"></asp:RegularExpressionValidator>
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
                    <textarea id="company_introduction" class="form-control" placeholder="Write your company introduction here" name="company_introduction"></textarea>  
                    <asp:TextBox ID="txtComapanyIntroduction" runat="server" style="display:none;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Company Introduction is required!" ControlToValidate="txtComapanyIntroduction" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <script>
                    var editor = CKEDITOR.replace('company_introduction');
                    var company_introduction_input = document.getElementById("ContentPlaceHolder1_txtComapanyIntroduction");

                    // editor is object of your CKEDITOR
                    editor.on('change', function () {
                        company_introduction_input.value = window.escape(CKEDITOR.instances.company_introduction.getData());

                    });
                </script>
            </div>
          
            <div class="form-group text-center mt-3">
                <asp:Button ID="updateRecruiterProfile" runat="server" Text="Update" cssClass="btn bg-lightgreen text-light" OnClick="updateRecruiterProfile_Click"/>
                <a href="recruiter-profile.aspx" class="btn btn-secondary">Back</a>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
    </div>

    
    <script>
        //Sticky form script
        function getCompanyIntroduction() {
            var introduction_value = document.getElementById("ContentPlaceHolder1_txtComapanyIntroduction");
            var ck_editor = document.getElementById("company_introduction");

            //Assign the value to CK EDITOR
            ck_editor.value = window.unescape(introduction_value.value);
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

        function profilePhotoUpload() {
            var file_input = document.getElementById("ContentPlaceHolder1_fileCompanyPhoto").value;
            var hidden_photo_input = document.getElementById("ContentPlaceHolder1_txtCompanyPhoto");

            //assign file input to hidden field
            hidden_photo_input.value = file_input;
        }

        //Print out the available industry
        printSelect2Industry("industry-selection");

        //Call stick form functions
        getCompanyIntroduction();
        getSelectedIndustry();
       
    </script>
</asp:Content>
