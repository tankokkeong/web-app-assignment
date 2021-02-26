
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
                    <img src="images/user%20profile/demo-user.png" id="profile-pic"/>
                </div>
            </div>
            
            <div class="profile-col user-title-col">
                <div class="user-title">
                    <h2><asp:Label ID="lblSeekerProfileName" runat="server" Text=""></asp:Label>
                        <span class="user-location text-secondary ml-3">
                            <i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblSeekerProfileLocation" runat="server" Text=""></asp:Label>
                        </span>

                        <a href="edit-user.aspx" class="btn btn-secondary float-right">Edit Profile</a>
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

        <div class="profile-row">
            

            <div class="user-details mt-3">
                <div class="details-header text-center">
                    <ul class="details-nav text-center">
                        <li class="detail-nav-selected" onclick="userProfileSwitchTab('about')" id="about-tab">About</li>
                        <li id="application-tab" onclick="userProfileSwitchTab('application')">My Application</li>
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

                <div id="job-application-content" class="my-info row" style="display:none;">
                    
                    <div class="application-container">
                        <% for (int i = 0; i < 10; i++)
                            { %>
                        <div class="application-bar row">
                            <div class="col-sm-3 mt-3">
                                <img src="images/home/partner5-min.png" class="company-pic"/>
                            </div>

                            <div class="col-sm-3 mt-3">
                                <div class="company-name text-lightgreen">Company Name</div>
                                <div class="company-location">
                                    <span class="company-location-details text-secondary"><i class="fas fa-map-marker-alt"></i> Kuala Lumpur, Selangor</span>
                                </div>
                                <div class="hiring-position">
                                    <span class="hiring-details">Graphic Designer</span>
                                </div>
                                <div class="view-profile">
                                    <button class="btn btn-info">View Profile</button>
                                </div>
                            </div>

                            <div class="col-sm-3 mt-3">
                                <div class="application-status text-info">Applied</div>
                                <div>
                                    Front-End Developer
                                </div>
                                <div class="employment-type badge badge-success">
                                    Full Time
                                </div>
                            </div>

                            <div class="col-sm-3 mt-3">
                                <div class="mt-2">
                                    <a href="chatbox.aspx" class="btn btn-success">Chat</a>
                                </div>

                                <div class="mt-2">
                                    <button class="btn btn-danger">Remove</button>
                                </div>
                            </div>
                        </div>

                        <%} %>

                    </div>
                    
                </div>

            </div>
        </div>
    </div>
</asp:Content>
