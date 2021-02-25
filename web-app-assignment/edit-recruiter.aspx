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
                    <asp:FileUpload ID="fileCompanyPhoto" runat="server" cssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Company photo is required!" ControlToValidate="fileCompanyPhoto" CssClass="text-danger"></asp:RequiredFieldValidator>
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
                </div>
              </div>

             <div class="form-row">
                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Phone:</label>                    
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone number is required!" ControlToValidate="txtPhone" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                
                 <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">Industry:</label>

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
                </div>

                <div class="form-group col-md-6 m-0">
                    <label for="inputAddress">State:</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="State is required!" ControlToValidate="txtState" CssClass="text-danger"></asp:RequiredFieldValidator>
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
            ck_editor.value = introduction_value.value;
        }

        //Call stick form functions
        getCompanyIntroduction();

    </script>
</asp:Content>
