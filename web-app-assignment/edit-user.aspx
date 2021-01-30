<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-user.aspx.cs" Inherits="web_app_assignment.edit_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit User</title>
    <link href="style/edit-user.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <form>
            <div class="form-row">
                <h2>Personal Information</h2>
            </div>

           <div class="form-row">
            <div class="form-group col-md-6">
              <img src="images/user%20profile/demo-user.png" id="edit-profile-pic"/><br />
                <label for="inputEmail4">Profile Photo</label>
              <input type="file" class="form-control" id="inputEmail4">
            </div>
        
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">First Name</label>
              <input type="text" class="form-control" id="inputEmail4">
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Last Name</label>
              <input type="text" class="form-control" id="inputPassword4">
            </div>
          </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Phone</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Email</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>

         <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 1</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 2</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>
          
            <div class="form-row">
                <h2>Education</h2>
            </div>

            <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Phone</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Email</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>

         <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 1</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 2</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>

            <div class="form-row">
                <h2>Experience</h2>
            </div>

            <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Phone</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Email</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>

         <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 1</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Phone">
          </div>

            <div class="form-group col-md-6">
                <label for="inputAddress">Adress Line 2</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Email">
          </div>
        </div>
          
          <button type="submit" class="btn bg-lightgreen text-light">Update</button>
            <a href="user-profile.aspx" class="btn btn-secondary">Back</a>
        </form>
    </div>
</asp:Content>
