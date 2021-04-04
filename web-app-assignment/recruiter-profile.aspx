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
                    <h5 class="text-secondary">Plan: <asp:Literal ID="ltrPlan" runat="server"></asp:Literal>
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
                    <div class="brief-info col-sm-12 col-lg-6 mb-3">
                        <asp:Label ID="lblIntroduction" runat="server" Text="" CssClass="pb-3"></asp:Label>
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
                                    <td>My Rating:</td>
                                    <td class="text-lightgreen">
                                        <asp:Label ID="lblRecruiterRating" runat="server" Text=""></asp:Label> <i class="fas fa-star text-warning"></i>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

               

                <div id="job-application-content" class="my-info " style="display:none;">    
                     <%-- Job Approval Alert --%>
                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none" id="job-approved-alert">
                        Job Application is approved!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <%-- Job Applicant deleted Alert --%>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none" id="applicant-deleted-alert">
                        Job applicant is deleted!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <%-- Job Applicant rejected Alert --%>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none" id="applicant-reject-alert">
                        Job applicant is rejected!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <asp:Label ID="lblJobStatus" runat="server" Text=""></asp:Label>

                    <asp:ListView ID="lvJobStatus" runat="server">
                        <ItemTemplate>
                            <div class='application-bar row mt-1'>
                                <div class='col-sm-3 mt-3'>
                                    <img src ="<%#Eval("user_photo") %>" class='company-pic'/>
                                </div>

                                <div class='col-sm-3 mt-3'>
                                    <div class='company-name text-lightgreen'><%#Eval("full_name") %> </div>
                                    <div class='company-location'>
                                        <span class='company-location-details text-secondary'><i class='fas fa-map-marker-alt'></i> <%#Eval("location") %>, <%#Eval("country") %></span>
                                    </div>

                                    <div class='hiring-position'>
                                        <span class='hiring-details'><%#Eval("job_title") %></span>
                                    </div>

                                    <div class='view-profile'>
                                        <a href='user-profile.aspx?view=<%#Eval("seeker_id") %>' class='btn btn-info'>View Profile</a>
                                    </div>
                                </div>

                                <div class='col-sm-3 mt-3'>
                                    <div class='application-status text-info'>Applied</div>
                                    <div>
                                        <%#Eval("job_title") %>
                                    </div>

                                    <div class='employment-type badge badge-success'>
                                        <%#Eval("job_type") %>
                                    </div>
                               </div>

                               <div class='col-sm-3 mt-3' runat="server" Visible='<%# (string)Eval("applied_status") == "Pending" %>'>
                                <div class='mt-2'>
                                    <button class='btn btn-success' data-toggle='modal' data-target='#approveModal' type='button' onclick='approveApplication("<%#Eval("application_id") %>")'>Approve</button>
                                </div>

                                <div class='mt-2'>
                                    <button class='btn btn-danger' type="button" data-toggle='modal' data-target='#rejectModal' onclick="rejectApplicants('<%#Eval("application_id") %>')">Reject</button>
                                </div>
                              </div>
                                
                               <div class='col-sm-3 mt-3' runat="server" Visible='<%# (string)Eval("applied_status") == "Approved" %>'>
                                    <div class='mt-2'>
                                        <a href ="chatbox.aspx?seeker=<%#Eval("seeker_id") %>" class='btn btn-success'>Chat</a>
                                    </div>

                                    <div class='mt-2' runat="server" Visible='<%# Eval("is_premium") != System.DBNull.Value %>'>
                                        <a href ="schedule.aspx?seeker=<%#Eval("seeker_id") %>" class='btn btn-primary'>Schedule</a>
                                    </div>

                                   <div class='mt-2' runat="server" Visible='<%# Eval("is_premium") == System.DBNull.Value %>'>
                                       <span data-toggle='tooltip' data-placement='right' title='Premium only' tabindex='0'>
                                            <button class='btn btn-primary' disabled>Schedule</button><i class='fas fa-lock' id='schedule-lock'></i>
                                       </span>
                                    </div>

                                    <div class='mt-2'>
                                        <button class='btn btn-danger' type="button" data-toggle="modal" data-target="#deleteApplicants" onclick="deleteApplicants('<%#Eval("application_id") %>')">Remove</button>
                                    </div>
                               </div>
                           </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvJobStatus" PageSize="5" QueryStringField="apply" class="pagination mt-3" OnPreRender="DataPager1_PreRender">
                         <Fields >
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="page-link page-item"/>
                            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="page-link page-item" CurrentPageLabelCssClass="page-link page-active" NextPreviousButtonCssClass="page-link page-item"/>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="true" ButtonCssClass="page-link page-item" RenderDisabledButtonsAsLabels="true"/>
                        </Fields>
                    </asp:DataPager>
                </div>

                <%-- Delete Completed Alert --%>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none" id="job-deleted-alert">
                    Job deleted successful!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                

                <div id="job-posted-content" class="my-info" style="display:none;">
                    <div class="mb-3">
                        <asp:Label ID="lblPostJob" runat="server" Text=""></asp:Label>                        
                        
                    </div>


                    <asp:GridView ID="gvJobPosted" runat="server" class="table table-bordered" 
                        AutoGenerateColumns="false" allowpaging="true" onrowdatabound="GridView1_RowDataBound" HeaderStyle-CssClass="bg-lightgreen text-light" OnPreRender="gvJobPosted_PreRender"
                        PageSize="5" AllowSorting="true" OnPageIndexChanging="gvJobPosted_PageIndexChanging" OnSorting="gvJobPosted_Sorting" EmptyDataText="No Job Posted Yet">
                        <Columns>
                            <asp:BoundField DataField="job_title" HeaderText="Job Title" SortExpression="job_title"/>
                            <asp:BoundField DataField="job_type" HeaderText="Job Type" SortExpression="job_type"/>
                            <asp:BoundField DataField="location" HeaderText="Job Location" SortExpression="location"/>
                            <asp:BoundField DataField="salary" HeaderText="Salary" SortExpression="salary"/>
                            <asp:BoundField DataField="post_id" HeaderText="Action" SortExpression="post_id"/>
                        </Columns>
                    </asp:GridView>

                    <asp:HiddenField ID="hfJobPagination" runat="server" />
                </div>

            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="">Delete Confirmation</h5>
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

    <!-- Delete Applicants Modal -->
    <div class="modal fade" id="deleteApplicants" tabindex="-1" aria-labelledby="deleteApplicantsLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="">Delete Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to delete this applicant?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <asp:Button ID="btnDeleteApplicants" runat="server" Text="Yes" class="btn btn-danger" OnClick="btnDeleteApplicants_Click"/>
            <asp:TextBox ID="txtApplicantionID" runat="server" style="display:none;"></asp:TextBox>
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

    <!-- Reject Job Modal -->
    <div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="">Approval Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to reject this job application?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <asp:Button ID="btnRejectApplicant" runat="server" Text="Yes" class="btn btn-danger" OnClick="btnRejectApplicant_Click"/>
            <asp:TextBox ID="txtRejectApplicant" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    <!-- Upgrade Modal -->
    <div class="modal fade" id="premiumModal" tabindex="-1" aria-labelledby="premiumModalLabel" aria-hidden="true">
      <div class="modal-dialog upgrade-dialog">
        <div class="modal-content">
          <div class="modal-header bg-lightgreen text-light">
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
                              <th scope="col" class="text-lightgreen">
                                  <h3>Free</h3>
                                  <h2><div>$0</div></h2>
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
                              <td><asp:Label ID="lblFreePlan" runat="server" Text=""></asp:Label></td>
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
                              <th scope="col" class="text-lightgreen">
                                  <h3>Premium</h3>
                                  <h2><div>$88</div></h2>
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
                                  <asp:Label ID="lblPremiumPlan" runat="server" Text=""></asp:Label>
                                  
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

        function deleteApplicants(id) {
            var delete_applicants_input = document.getElementById("ContentPlaceHolder1_txtApplicantionID");

            //Change the id
            delete_applicants_input.value = id;
        }

        function rejectApplicants(id) {
            var reject_applicants_input = document.getElementById("ContentPlaceHolder1_txtRejectApplicant");

            //Change the id
            reject_applicants_input.value = id;
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

        //Check Reject Job Applicant 
        function checkRejectedApplicant() {
            var link = window.location.href.split("?");
            var reject_alert = document.getElementById("applicant-reject-alert");

            if (link[1] === "rejectApplicants") {

                //Change to job posted tab
                recruiterProfileSwitchTab('application');
                reject_alert.style.display = "";
            }
        }

        //Check Delete Job Applicant
        function checkDeletedApplicant() {
            var link = window.location.href.split("?");
            var delete_alert = document.getElementById("applicant-deleted-alert");

            if (link[1] === "deleteApplicants") {
                //Change to job posted tab
                recruiterProfileSwitchTab('application');
                delete_alert.style.display = "";
            }
        }

        function checkJobPostPagination() {
            var pagination_field = document.getElementById("ContentPlaceHolder1_hfJobPagination").value;

            if (pagination_field === "job-posted") {
                //Change to job posted tab
                recruiterProfileSwitchTab('job-posted');
            }
            else {
                checkApplyPagination();
            }
        }

        function checkApplyPagination() {
            var link = window.location.href.split("?");

            if (link[1].substring(0, 5) === "apply") {

                //Change to job application tab
                userProfileSwitchTab("application");
            }
        }

        //Query string functions
        checkDeleteJob();
        checkApprovedApplication();
        checkJobPostPagination();
        checkDeletedApplicant();
        checkRejectedApplicant();
    </script>
</asp:Content>
