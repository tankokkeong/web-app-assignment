<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="recruiter-profile.aspx.cs" Inherits="web_app_assignment.recruiter_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Recruiter Profile</title>
    <link href="style/recruiter-profile.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="profile-container">
        <div class="profile-row">
            <div class="profile-col">
                <div class="picture-container">
                    <asp:Image ID="imgRecruiterProfile" runat="server" class="profile-pic"/>
                    <%--<div class="change-pic-btn text-center"> 
                        <h4>Change Photo</h4>
                    </div>--%>
                </div>
            </div>
            
            <div class="profile-col user-title-col">
                <div class="user-title">
                    <h2>
                        <asp:Label ID="lblRecruiterName" runat="server" Text=""></asp:Label>
                        <span class="user-location text-secondary ml-3">
                            <i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblRecruiterState" runat="server" Text=""></asp:Label>
                        </span>

                        <a href="edit-recruiter.aspx" class="btn btn-secondary float-right">Edit Profile</a>
                    </h2>
                    <h3 class="text-lightgreen">
                        <span class="text-secondary">Industry: </span><asp:Label ID="lblRecruiterIndustry" runat="server" Text=""></asp:Label>
                    </h3>
                </div>

                <div class="profile-bios">
                     <h3 class="text-secondary">Bio Links: 
                         <span>
                             <asp:HyperLink ID="linkFB" runat="server" CssClass="text-secondary" NavigateUrl="" Target="_blank"><i class="fab fa-facebook-square"></i></asp:HyperLink>
                         </span> 

                         <span>
                             <asp:HyperLink ID="linkLinkedIn" runat="server" CssClass="text-secondary" NavigateUrl="" Target="_blank"><i class="fab fa-linkedin"></i></asp:HyperLink>
                         </span>

                     </h3>
                </div>      
            </div>
            
        </div>

        <div class="profile-row">
            

            <div class="user-details mt-3">
                <div class="details-header text-center">
                    <ul class="details-nav text-center">
                        <li class="detail-nav-selected" onclick="recruiterProfileSwitchTab('about')" id="about-tab">About</li>
                        <li id="application-tab" onclick="recruiterProfileSwitchTab('application')">Job Application</li>
                        <li id="job-posted-tab" onclick="recruiterProfileSwitchTab('job-posted')">Job Posted</li>
                    </ul>
                </div>

                <div class="my-info row" id="about-content">
                    <div class="brief-info col-sm-12 col-lg-6">
                        <asp:Label ID="lblIntroduction" runat="server" Text=""></asp:Label>
                        <%--<h3>
                            My self-summary
                        </h3>

                        <p>
                            Lorem Ipsum is simply dummy text of the printing and 
                            typesetting industry. Lorem Ipsum has been the industry's standard 
                            dummy text ever since the 1500s, when an unknown printer took a 
                            galley of type and scrambled it to make a type specimen book. 
                            It has survived not only five centuries, 
                            but also the leap into electronic typesetting, remaining
                            essentially unchanged. It was popularised in the 1960s with the 
                            release of Letraset sheets containing Lorem Ipsum passages, 
                            and more recently with desktop publishing 
                            software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>

                        <h3>
                            My self-summary
                        </h3>

                        <p>
                            Lorem Ipsum is simply dummy text of the printing and 
                            typesetting industry. Lorem Ipsum has been the industry's standard 
                            dummy text ever since the 1500s, when an unknown printer took a 
                            galley of type and scrambled it to make a type specimen book. 
                            It has survived not only five centuries, 
                            but also the leap into electronic typesetting, remaining
                            essentially unchanged. It was popularised in the 1960s with the 
                            release of Letraset sheets containing Lorem Ipsum passages, 
                            and more recently with desktop publishing 
                            software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>

                        <h3>
                            My self-summary
                        </h3>

                        <p>
                            Lorem Ipsum is simply dummy text of the printing and 
                            typesetting industry. Lorem Ipsum has been the industry's standard 
                            dummy text ever since the 1500s, when an unknown printer took a 
                            galley of type and scrambled it to make a type specimen book. 
                            It has survived not only five centuries, 
                            but also the leap into electronic typesetting, remaining
                            essentially unchanged. It was popularised in the 1960s with the 
                            release of Letraset sheets containing Lorem Ipsum passages, 
                            and more recently with desktop publishing 
                            software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>--%>
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
                                    <td>Email:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterEmail" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Phone:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterPhone" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Contact Email:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterContactEmail" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Address Line: 1</td>
                                    <td class="text-lightgreen">                 
                                        <asp:Label ID="lblRecruiterAddress1" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Address Line: 2</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterAddress2" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>City:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterCity" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>State:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterState2" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Zip Code:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterZip" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Country:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterCountry" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Rating:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterRating" runat="server" Text=""></asp:Label>
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
                                <img src="images/user%20profile/demo-user.png" class="company-pic"/>
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
                                    <a href="schedule.aspx" class="btn btn-primary">Schedule</a>
                                </div>

                                <div class="mt-2">
                                    <button class="btn btn-danger">Remove</button>
                                </div>
                            </div>
                        </div>

                        <%} %>

                    </div>
                    
                </div>

                <div id="job-posted-content" class="my-info row" style="display:none;">
                    <div class="mb-3">
                        <a href="post-job.aspx" class="btn btn-primary">Post New Job</a>
                    </div>

                  <%--  <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th scope="col">Job Title</th>
                          <th scope="col">Categories</th>
                          <th scope="col">Location</th>
                          <th scope="col">Budget</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">Front End Developer</th>
                          <td><span class="badge badge-success">Full-Time</span></td>
                          <td>Subang Jaya</td>
                          <td>RM 4,000/M</td>
                          <td>
                              <a class="badge badge-success p-2" role="button">Edit</a>
                              <a class="badge badge-danger p-2" role="button">Delete</a>
                          </td>
                        </tr>
                       <tr>
                          <th scope="row">Front End Developer</th>
                          <td><span class="badge badge-danger">Part-Time</span></td>
                          <td>Subang Jaya</td>
                          <td>RM 4,000/M</td>
                          <td>
                              <a class="badge badge-success p-2" role="button">Edit</a>
                              <a class="badge badge-danger p-2" role="button">Delete</a>
                          </td>
                        </tr>
                      </tbody>
                    </table>--%>

                    <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="false" allowpaging="true" onrowdatabound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="job_title" HeaderText="Job Title" />
                            <asp:BoundField DataField="job_type" HeaderText="Job Type" />
                            <asp:BoundField DataField="location" HeaderText="Job Location" />
                            <asp:BoundField DataField="salary" HeaderText="Salary" />
                            <asp:BoundField DataField="post_id" HeaderText="Action" />
                            <%--<asp:TemplateField HeaderText="Action" >
                                <ItemTemplate>
                                    <a class="badge badge-success p-2" role="button" >Edit</a>
                                    <a class="badge badge-danger p-2" role="button">Delete</a>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
                </div>

                <script>
                    //$(document).ready(function () {
                    //    $('#ContentPlaceHolder1_GridView1').DataTable();
                    //});
                </script>

            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to delete this record?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

            <button type="button" class="btn btn-primary">Yes</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
