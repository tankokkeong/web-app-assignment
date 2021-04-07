<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="jobs-management.aspx.cs" Inherits="web_app_assignment.admin.jobs_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Jobs Management</title>
    <link href="css/jobs-management.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to payments management
            live_chat = nav_option[6];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="jobs-management-container">
             <div class="jobs-managemen-title">
                <h2>Jobs Posted</h2>
            </div>
        
            <%-- Delete Alert --%>
            <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:none;" id="job-removed-alert">
              Job removed successful!
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <div class="payment-filter mt-3 mb-3">
                <div class="row">
                    <div class="filter-title col-lg-1 font-weight-bold">
                        Filters:
                    </div>

                    <div class="col-lg-11">
                        <div class="row">
                            <div class="col-sm-12 col-lg-3 job-filter-container">
                                <input class="form-control" type="number" placeholder="Post ID" id="post-id" min="1"/>
                            </div>

                            <div class="col-sm-12 col-lg-3 job-filter-container">
                                <select class="form-control" id="job-type">
                                    <option value="">Job Type</option>
                                    <option value="Full Time">Full Time</option>
                                    <option value="Part Time">Part Time</option>
                                </select>
                            </div>

                            <div class="col-sm-12 col-lg-3 job-filter-container">
                                <input class="form-control" type="number" placeholder="Company ID" id="company-id" min="1"/>
                            </div>

                            <div class="col-sm-12 col-lg-3 job-filter-container">
                                <input class="form-control" type="text" placeholder="Company Name" id="company-name"/>
                            </div>
                                               
                        </div>

                        <div class="row">
                            <div class="col-sm-12 col-lg-2 job-filter-container">     
                                <span class="pl-1">From :</span> <input class="form-control" type="date" id="job-from-date"/>
                            </div>
                            

                            <div class="col-sm-12 col-lg-2 job-filter-container">
                                <span class="pl-1">To:</span> <input class="form-control" type="date" id="job-to-date"/>
                            </div>
                        </div>
                    
                        <div class="row mt-2">
                            <div class="col">
                                <button class="btn btn-info" onclick="jobFilter()" type="button">Search</button>
                                <button class="btn btn-danger" type="button" onclick="clearFilters()">Clear</button>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-container">
                <asp:GridView ID="gvJobPosted" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-striped table-bordered" AllowPaging="true" PageSize="50" OnPageIndexChanging="gvJobPosted_PageIndexChanging"
                    EmptyDataText="No Data Found" OnRowDataBound="gvJobPosted_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" Width="600px" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="post_id" HeaderText="Post ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="job_title" HeaderText="Job Title" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="salary" HeaderText="Salary" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="job_type" HeaderText="Job Type" HeaderStyle-CssClass="bg-lightgreen text-light" ControlStyle-Width="200px" ControlStyle-Height="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="created_at" HeaderText="Date Published" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="company_name" HeaderText="Company_name" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="recruiter_id" HeaderText="Company ID" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="post_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Delete Modal -->
        <div class="modal fade" id="JobDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Jobs Removal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Reason:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlReasonSuspended" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Spam">Spam</asp:ListItem>
                            <asp:ListItem Value="Abusive Job Post behavior">Abusive Job Post behavior</asp:ListItem>
                            <asp:ListItem Value="Violated rules and regulations">Violated rules and regulations</asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="hfJobID" runat="server" />
                    </div>
                </div>
        
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <asp:Button ID="btnRemoveJob" runat="server" Text="Remove" class="btn btn-danger" OnClick="btnRemoveJob_Click"/>
              </div>
            </div>
          </div>
        </div>
    </form>

    <script>
        function deleteJob(id) {
            var delete_input = document.getElementById("ContentPlaceHolder1_hfJobID");

            delete_input.value = id;
        }

        //Check Removed Job
        function checkRemovedJob() {
            var link = window.location.href.split("?");
            var deleted_alert = document.getElementById("job-removed-alert");

            if (link[1] === "deleted") {

                //Change to job application tab
                deleted_alert.style.display = "";
            }
        }

        checkRemovedJob();

        function jobFilter() {
            //Retrive User input
            var post_id = document.getElementById("post-id").value;
            var job_type = document.getElementById("job-type").value;
            var company_id = document.getElementById("company-id").value;
            var company_name = document.getElementById("company-name").value;
            var job_from_date = document.getElementById("job-from-date").value;
            var job_to_date = document.getElementById("job-to-date").value;

            //Generate searching query string

            window.location.href = "jobs-management.aspx?post_id=" + post_id + "&job_type=" + job_type +
                "&company_id=" + company_id + "&company_name=" + company_name + "&from=" + job_from_date + "&to=" + job_to_date;
        }

        function filterSticky() {

            //User input
            var post_id = document.getElementById("post-id");
            var job_type = document.getElementById("job-type");
            var company_id = document.getElementById("company-id");
            var company_name = document.getElementById("company-name");
            var job_from_date = document.getElementById("job-from-date");
            var job_to_date = document.getElementById("job-to-date");

            var query = window.location.href.split("?")[1].split("&");

            //Place the sticky values
            post_id.value = unescape(query[0].split("=")[1].replace("+", " "));
            job_type.value = unescape(query[1].split("=")[1].replace("+", " "));
            company_id.value = unescape(query[2].split("=")[1]).replace("+", " ");
            company_name.value = unescape(query[3].split("=")[1]).replace("+", " ");
            job_from_date.value = query[4].split("=")[1].replace("+", " ");
            job_to_date.value = query[5].split("=")[1].replace("+", " ");

            console.log(query[0].split("=")[1])
        }

        function clearFilters() {
            window.location.href = "jobs-management.aspx";
        }

        //Call sticky form function
        filterSticky();
    </script>
</asp:Content>
