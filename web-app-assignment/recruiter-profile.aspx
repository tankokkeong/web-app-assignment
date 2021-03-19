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
                </div>
            </div>
            
            <div class="profile-col user-title-col">
                <div class="user-title">
                    <h2>
                        <asp:Label ID="lblRecruiterName" runat="server" Text=""></asp:Label>
                        <span class="user-location text-secondary ml-3">
                            <i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblRecruiterState" runat="server" Text=""></asp:Label>
                        </span>

                        <%
                            if(Session["Recruiter"] != null)
                            {
                                Response.Write("<a href='edit-recruiter.aspx' class='btn btn-secondary float-right'>Edit Profile</a>");
                            }
                        %>
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

                <div class="upgrade-container">
                    <h5 class="text-secondary">Plan: Free
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#premiumModal">
                            Upgrade
                        </button>
                    </h5>                    
                </div>

            </div>
            
        </div>

        <div class="profile-row mt-3">
            

            <div class="user-details mt-3">
                <div class="details-header text-center">
                    <ul class="details-nav text-center">
                        <li class="detail-nav-selected" onclick="recruiterProfileSwitchTab('about')" id="about-tab">About</li>

                        <%
                            if(Session["Recruiter"] != null)
                            {
                                Response.Write("<li id='application-tab' onclick=\"recruiterProfileSwitchTab('application')\">Job Application</li>");
                                Response.Write("<li id='job-posted-tab' onclick=\"recruiterProfileSwitchTab('job-posted')\">Job Posted</li>");
                            }
                        %>
                        
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

                <%-- Job Approval Alert --%>
                <div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none" id="job-approved-alert">
                    Job Application is approved!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div id="job-application-content" class="my-info row" style="display:none;">
                    
                    <asp:Label ID="lblJobStatus" runat="server" Text="" class="application-container"></asp:Label>
                    
                </div>

                <%-- Delete Completed Alert --%>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none" id="job-deleted-alert">
                    Job deleted successful!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
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
            <asp:Button ID="btnDeleteJob" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnDeleteJob_Click"/>
            <asp:TextBox ID="txtDeleteJob" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    <!-- Approve Job Modal -->
    <div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Approval Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to approve this job application?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <asp:Button ID="btnApproveJob" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnApproveJob_Click"/>
            <asp:TextBox ID="txtApproveApplication" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    <!-- Upgrade Modal -->
    <div class="modal fade" id="premiumModal" tabindex="-1" aria-labelledby="premiumModalLabel" aria-hidden="true">
      <div class="modal-dialog upgrade-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary text-light">
            <h5 class="modal-title" id="">Upgrade Plans</h5>
            <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="text-light">&times;</span>
            </button>
          </div>

          <div class="modal-body bg-lightgray">
              <div class="row">
                  <div class="col-6">
                      <div class="plan-table-container bg-light rounded">
                        <table class="table table-bordered plan-table">
                          <thead>
                            <tr class="text-center">
                              <th scope="col" class="text-primary">
                                  Free
                                  <div>RM0</div>
                              </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-secondary"></i>Better Search Ranking
                                </div>
                               
                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-secondary"></i>Scheduling function
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-secondary"></i>See company's rating
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-secondary"></i>Job Review
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Apply 1 Job
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Post 1 Job
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Customer Support
                                </div>
                                  
                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Live Chat function
                                </div>
                              </td>
                            </tr>
                            <tr class="text-secondary text-center">
                              <td style="padding: 21px 0px;">Current Plan</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      
                  </div>

                  <div class="col-6">
                      <div class="plan-table-container bg-light rounded">
                        <table class="table table-bordered plan-table">
                          <thead>
                            <tr>
                              <th scope="col" class="text-primary">
                                  Premium
                                  <div>RM88</div>
                              </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>                        
                              <td>
                                  <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Better Search Ranking
                                </div>
                               
                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Scheduling function
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>See company's rating
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Job Review
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Apply Unlimited Jobs
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Post Unlimited Jobs
                                </div>

                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Customer Support
                                </div>
                                  
                                <div class="plan-criteria">
                                    <i class="fas fa-check mr-3 text-lightgreen"></i>Live Chat function
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td class="text-center">
                                  <asp:Button ID="Button1" runat="server" Text="Upgrade" class="btn btn-primary"/>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    
                  </div>
              </div>
            
          </div>
        </div>
      </div>
    </div>

    <script>
        function deleteJob(id) {
            var delete_input = document.getElementById("ContentPlaceHolder1_txtDeleteJob");

            //Change the id
            delete_input.value = id;
        }


        //Check Delete Job Post
        function checkDeleteJob() {
            var link = window.location.href.split("?");
            var deleted_alert = document.getElementById("job-deleted-alert");

            if (link[1] === "deletedJob") {
                //Change to job posted tab
                recruiterProfileSwitchTab('job-posted');
                deleted_alert.style.display = "";
            }
        }

        function approveApplication(id) {
            var approve_input = document.getElementById("ContentPlaceHolder1_txtApproveApplication");

            //Change the id
            approve_input.value = id;
        }

        //Check Approve Job Application
        function checkApprovedApplication() {
            var link = window.location.href.split("?");
            var approved_alert = document.getElementById("job-approved-alert");

            if (link[1] === "approval") {
                //Change to job posted tab
                recruiterProfileSwitchTab('application');
                approved_alert.style.display = "";
            }
        }

        checkDeleteJob();
        checkApprovedApplication();

    </script>
</asp:Content>
