<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_lists.aspx.cs" Inherits="web_app_assignment.job_lists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Lists</title>
    <link href="style/job_lists.css" rel="stylesheet" type="text/css"/>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="JobListContents">
        <div class="JobListContentsBackGroundImage">
            <div class="JobListContentsImagePosition">
                <img src="images/JobsList/search.jpg" alt="searchBackground" class="JobListContentsImage"/>
            </div>
            <div class="JobListContentsBackGroundContent">
                <h2 class="JobListContentsBackGroundContentHeader">
                    Find The Jobs That Matter To You
                </h2>
                <form>
                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsSearchPosition">
                                    <img src="images/JobsList/loupe.png" alt="search" class="JobListContentsSearchImage"/>
                                </span>
                            </div>
                            <asp:TextBox ID="txt_SearchJobTitle" placeholder="Job Title, Keyword or Company" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsLocationPosition">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsLocationImage"/>
                                </span>
                            </div>
                            <div class="JobListContentsLocationDropdown">
                                <select class="form-control selectStates custom-select" style="width:100%;" id="location-selection" multiple="multiple"></select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsJobCategoryPosition">
                                    <img src="images/JobsList/menu.png" alt="Job Category" class="JobListContentsJobCategoryImage"/>
                                </span>
                            </div>
                            <div class="JobListContentsJobTypeDropdown">
                                <select class="form-control jobType custom-select" style="width:100%;" id="jobtype-selection"></select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsJobSpecPosition">
                                    <img src="images/JobsList/suitcase.png" alt="Job Spec" class="JobListContentsJobSpecImage"/>
                                </span>
                            </div>
                            <div class="JobListContentsJobSpecDropdown">
                                <select class="form-control jobSpec custom-select" style="width:100%;" id="jobSpec-selection" multiple="multiple"></select>
                            </div>
                        </div>
                    </div>
                    <button type="button" id="btn_JobListContentsBackgroundInputsSearchButton" class="JobListContentsBackgroundInputsSearchButton btn btn-info" onclick="JobListSearch()">Search</button>
                </form>
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <div class="container">
                <div class="JobListContentsAllCompaniesContainer">
                    <div class="JobListContentsAllCompaniesHeaderPosition">
                        <h2 class="JobListContentsAllCompaniesHeader">Companies Recommended</h2>
                    </div>
                    <div class="PageSizeLimit">
                        Limit
                        <asp:DropDownList ID="ddlPageSize" CssClass="btn btn-sm bg-lightgreen text-white PageSizeLimitPosition" AutoPostBack="true" runat="server">
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                        </asp:DropDownList>
                        Per Page
                    </div>

                    <div class="row">
                        <asp:ListView ID="lvJobListContentsAllCompanies" runat="server">
                            <ItemTemplate>
                                <div class='col-sm-6 mt-3'>
                                    <div class='JobListContentsAllCompaniesBoxes row mr-2'>
                                        <div class='JobListContentsAllCompaniesBoxesCompanyLogoPosition col'>
                                            <img src='<%#Eval("company_photo") %>' alt='company' class='JobListContentsAllCompaniesBoxesCompanyLogoPosition'/>
                                            <div class='JobListContentsAllCompaniesBoxesDetailsStars'>
                                                <div class='jobRating ml-2'>                                                   
                                                    <p runat="server" id="JobRatingDisplay" visible='<%#(is_premium == "true") ? true : false %>'>
                                                        <%#Eval("job_rating") %><i class='fas fa-star text-warning ml-2'></i>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='JobListContentsAllCompaniesBoxesDetails col'>
                                            <h4 class='JobListContentsAllCompaniesBoxesDetailsTitle'>
                                                <%#Eval("job_title") %>
                                            </h4>
                                            <div class='JobListContentsAllCompaniesBoxesDetailsBody'>
                                                <div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>
                                                    <img src='images/JobsList/working-position.png' alt='position' class='JobListContentsAllCompaniesBoxesImages'/>
                                                    <p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'><%#Eval("company_name") %></p>
                                                </div>
                                                <div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>
                                                    <img src='images/JobsList/pin.png' alt='location' class='JobListContentsAllCompaniesBoxesImages'/>
                                                    <p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'><%#Eval("location") %></p>
                                                </div>
                                                <div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>
                                                    <img src='images/JobsList/salary.png' alt='salary' class='JobListContentsAllCompaniesBoxesImages'/>
                                                    <p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'>MYR <%#Eval("salary") %></p>
                                                </div>
                                                <div class='JobListContentsAllCompaniesBoxesDetailsBodyContents'>
                                                    <img src='images/JobsList/clock.png' alt='employee status' class='JobListContentsAllCompaniesBoxesImages'/>
                                                    <p class='JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription'><%#Eval("job_type") %></p>
                                                </div>
                                            </div>
                                            <div class='JobListContentsAllCompaniesBoxesDetailsFooter mt-3'>
                                                <div class='JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton'>
                                                    <button type='button' class='btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow p-1' onclick='directDetails(<%#Eval("post_id") %>)'> More Details </button>
                                                    <button type='button' class='btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow p-1' onclick='directContact(<%#Eval("recruiter_id") %>)'> Contact Now </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>

                            <EmptyDataTemplate>
                                <div class="ml-3">No job found</div>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>

                    <asp:DataPager ID="dpPagination" runat="server" class="row pagination" OnPreRender="dpPagination_PreRender" PagedControlID="lvJobListContentsAllCompanies" PageSize="15">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="page-link page-item"/>
                            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="page-link page-item" CurrentPageLabelCssClass="page-link page-active" NextPreviousButtonCssClass="page-link page-item"/>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="true" ButtonCssClass="page-link page-item" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#location-selection").select2({
            placeholder: "Select Location or Write Location",
            allowClear: false,
            newTag: false,
            tags: true,
        });
        $('#jobtype-selection').select2({
            placeholder: "Job Type",
            allowClear: false,
            newTag: false,
            tags: true,
        });
        
        $("#jobSpec-selection").select2({
            placeholder: "Job Specialization or Position eg. Accounting",
            allowClear: false,
            newTag: false,
            tags: true,
        });

        function directContact(recruiter_id) {
            window.location = 'recruiter-profile.aspx?view=' + recruiter_id;
        }

        function directDetails(count) {
            window.location = 'job_description.aspx?post_id=' + count;
        }

        function updateTextInput(val) {
            document.getElementById('textInputMax').value = val;
        }
    </script>
    
    <script>
        function JobListSearch() {
            var location_selected = $('#location-selection').select2('data');
            var job_location = "";
            var jobType_selected = $('.jobType').select2('data');
            var job_type = "";
            var spec_selected = $('.jobSpec').select2('data');
            var job_spec = "";
            var job_Title = document.getElementById('ContentPlaceHolder1_txt_SearchJobTitle').value;


            for (var i = 0; i < location_selected.length; i++) {

                if (i === 0) {
                    job_location = location_selected[i].text;
                }
                else {
                    job_location = job_location + "," + location_selected[i].text;
                }
            }

            for (var i = 0; i < jobType_selected.length; i++) {

                if (i === 0) {
                    job_type = jobType_selected[i].text;
                }
                else {
                    job_type = job_type + "," + jobType_selected[i].text;
                }
            }

            for (var i = 0; i < spec_selected.length; i++) {

                if (i === 0) {
                    job_spec = spec_selected[i].text;
                }
                else {
                    job_spec = job_spec + "," + spec_selected[i].text;
                }
            }

            //Redirect to job list page
            window.location.href = "job_lists.aspx?job_title=" + job_Title + "&location=" + job_location +
                "&job_type=" + job_type + "&job_spec=" + job_spec;
        }

        function getSelectedLocation() {
            var locationQuery = window.location.href.split('?')[1];
            locationQuery = decodeURIComponent(locationQuery);
            locationQuery = locationQuery.split('&')[1];
            locationQuery = locationQuery.split('=')[1];

            var location = locationQuery.split(',');
            var select2_input = document.getElementById("location-selection");

            if (locationQuery !== "" && location !== "") {
                //Add Customize creation for the users
                for (var i = 0; i < location.length; i++) {

                    //Preserve query string
                    location[i] = location[i].replace("+", " ");

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(unescape(location[i])) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(location[i]) + "' selected id='" + unescape(location[i]) + "'>" + unescape(location[i]) + "</option>";
                    }
                }

                for (var i = 0; i < location.length; i++) {

                    if (document.getElementById(unescape(location[i])) != null) {
                        document.getElementById(unescape(location[i])).selected = true;
                    }

                }
            }
        }

        function getJobTitle() {
            var titleQuery = window.location.href.split('?')[1];
            titleQuery = decodeURIComponent(titleQuery);
            titleQuery = titleQuery.split('=')[1];

            var title = titleQuery.split('&')[0];

            //Preserve query string
            title = title.replace("+", " ");

            var job_titleText = document.getElementById("ContentPlaceHolder1_txt_SearchJobTitle");

            if (title !== "") {
                job_titleText.value = unescape(title);
            }
        }

        function getSelectedJobType() {
            var jobTypeQuery = window.location.href.split('?')[1];
            jobTypeQuery = decodeURIComponent(jobTypeQuery);
            jobTypeQuery = jobTypeQuery.split('&')[2];
            jobTypeQuery = jobTypeQuery.split('=')[1];

            var jobType = jobTypeQuery.split(',');
            var select2_input = document.getElementById("jobtype-selection");

            if (jobTypeQuery !== "" && jobType !== "" ) {

                //Add Customize creation for the users
                for (var i = 0; i < jobType.length; i++) {

                    //Preserve query string
                    jobType[i] = jobType[i].replace("+", " ");

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(unescape(jobType[i])) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(jobType[i]) + "' selected id='" + unescape(jobType[i]) + "'>" + unescape(jobType[i]) + "</option>";
                    }
                }

                for (var i = 0; i < jobType.length; i++) {

                    if (document.getElementById(unescape(jobType[i])) != null) {
                        document.getElementById(unescape(jobType[i])).selected = true;
                    }

                }
            }
        }

        function getSelectedJobSpec() {
            var jobSpecQuery = window.location.href.split('?')[1];
            jobSpecQuery = decodeURIComponent(jobSpecQuery);
            jobSpecQuery = jobSpecQuery.split('&')[3];
            jobSpecQuery = jobSpecQuery.split('=')[1];

            var jobSpec = jobSpecQuery.split(',');
            var select2_input = document.getElementById("jobSpec-selection");

            if (jobSpecQuery !== "" && jobSpec !== "") {               

                //Add Customize creation for the users
                for (var i = 0; i < jobSpec.length; i++) {

                    //Preserve query string
                    jobSpec[i] = jobSpec[i].replace("+", " ");

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(unescape(jobSpec[i])) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(jobSpec[i]) + "' selected id='" + unescape(jobSpec[i]) + "'>" + unescape(jobSpec[i]) + "</option>";
                    }
                }

                for (var i = 0; i < jobSpec.length; i++) {

                    if (document.getElementById(unescape(jobSpec[i])) != null) {
                        document.getElementById(unescape(jobSpec[i])).selected = true;
                    }

                }
            }
        }

        //Print out the available industry
        printSelect2State("location-selection");
        printSelect2JobType("jobtype-selection");
        printSelect2JobSpec("jobSpec-selection");

        getSelectedLocation();
        getJobTitle();
        getSelectedJobType();
        getSelectedJobSpec();
    </script>  
</asp:Content>