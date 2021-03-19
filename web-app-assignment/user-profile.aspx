
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="web_app_assignment.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Profile</title>
    <link href="style/user-profile.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="profile-row">
            <div class="profile-col">
                <div class="picture-container">
                    <asp:Image ID="imgSeekerProfile" runat="server" class="profile-pic"/>
                </div>
            </div>
            
            <div class="profile-col user-title-col">
                <div class="user-title">
                    <h2><asp:Label ID="lblSeekerProfileName" runat="server" Text=""></asp:Label>
                        <span class="user-location text-secondary ml-3">
                            <i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblSeekerProfileLocation" runat="server" Text=""></asp:Label>
                        </span>

                        <%
                            if(Session["User"] != null)
                            {
                                Response.Write("<a href='edit-user.aspx' class='btn btn-secondary float-right'>Edit Profile</a>");
                            }
                        %>
                    </h2>
                    <h3 class="text-lightgreen"><asp:Label ID="lblSeekerProfession" runat="server" Text=""></asp:Label></h3>
                </div>

                <div class="profile-bios">
                     <h3 class="text-secondary">Bio Links: 
                         <span>
                             <asp:HyperLink ID="SeekerFBLink" runat="server" CssClass="text-secondary" NavigateUrl="" Target="_blank"><i class="fab fa-facebook-square"></i></asp:HyperLink>
                         </span> 

                         <span>
                             <asp:HyperLink ID="SeekerLinkedInLink" runat="server" CssClass="text-secondary" NavigateUrl="" Target="_blank"><i class="fab fa-linkedin"></i></asp:HyperLink>
                         </span>

                     </h3>
                </div>
            </div>
            
        </div>

        <div class="profile-row mt-3">
            

            <div class="user-details mt-3">
                <div class="details-header text-center">
                    <ul class="details-nav text-center">
                        <li class="detail-nav-selected" onclick="userProfileSwitchTab('about')" id="about-tab">About</li>

                        <%
                            if(Session["User"] != null)
                            {
                                Response.Write("<li id='application-tab' onclick=\"userProfileSwitchTab('application')\">My Application</li>");
                            }
                        %>
                    </ul>
                </div>

                <div class="my-info row" id="about-content">
                    <div class="brief-info col-sm-12 col-lg-6">
                        <asp:Label ID="lblSeekerIntroduction" runat="server" Text="Label"></asp:Label>
                    </div>

                    <div class="basic-info col-sm-12 col-lg-6">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">My Details</th>
                                <th scope="col"></th>             
                            </tr>
                            </thead>
                            <tbody>
                                <tr> 
                                    <td>Name</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerName" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Email</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerEmail" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Phone</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerPhone" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Gender</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerGender" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Preferred Industry</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblPreferredIndustry" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Location</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerLocation" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Country:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerCountry" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Experience:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerExperience" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Skills:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblSeekerSkills" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- Delete Completed Alert --%>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none" id="job-cancel-alert">
                    Job application cancelled successful!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div id="job-application-content" class="my-info row" style="display:none;">
                    
                    <div class="application-container">
                       <asp:Label ID="lblJobStatus" runat="server" Text="" class="application-container"></asp:Label>

                    </div>
                    
                </div>

            </div>
        </div>
    </div>

    <script>
        function cancelApplication(id) {
            var cancel_input = document.getElementById("ContentPlaceHolder1_txtApplicationID");

            //Change the id
            cancel_input.value = id;
        }

        //Check Cancelled Job Application
        function checkCancelledApplication() {
            var link = window.location.href.split("?");
            var deleted_alert = document.getElementById("job-cancel-alert");

            if (link[1] === "cancelApplication") {

                //Change to job application tab
                userProfileSwitchTab("application");
                deleted_alert.style.display = "";
            }
        }

        checkCancelledApplication();
    </script>
    <!-- Cancel Application Modal -->
    <div class="modal fade" id="cancelApplicationModal" tabindex="-1" aria-labelledby="cancelApplicationModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Cancel Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to cancel your application?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <asp:Button ID="btnCancelApplication" runat="server" Text="Cancel" class="btn btn-danger" OnClick="btnCancelApplication_Click"/>
            <asp:TextBox ID="txtApplicationID" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
