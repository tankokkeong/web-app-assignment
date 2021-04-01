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
                                <select class="form-control jobType custom-select" style="width:100%;" id="jobtype-selection" multiple="multiple"></select>
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
                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsSalaryPosition">
                                    <img src="images/JobsList/salary.png" alt="search" class="JobListContentsSalaryImage"/>
                                </span>
                            </div>

                            <div class="JobListContentsSalaryRange row">
                                <p class="col amount">
                                  <label>Salary Range:</label>
                                    RM <input id="txt_amountLeft" type="text" value="0" readonly="readonly"/> -
                                    RM <input id="txt_amountRight" type="text" value="50000" readonly="readonly"/>
                                </p>
                                <div class="col middle">
                                    <div class="multi-range-slider">
                                        <input type="range" id="input-left" class="rangeSlider" min="0" max="50000" value="0"/>
                                        <input type="range" id="input-right" class="rangeSlider" min="0" max="50000" value="50000"/>
                                        <div class="slider">
                                            <div class="track"></div>
                                            <div class="range"></div>
                                            <div class="thumb left"></div>
                                            <div class="thumb right"></div>
                                        </div>
                                    </div>
                                </div>
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
                    <asp:Label ID="lbl_JobListContentsAllCompanies" CssClass="row" runat="server"></asp:Label>
                    <asp:Label ID="txtPagination" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#location-selection").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
        });
        $('#jobtype-selection').select2({
            placeholder: "Job Type",
        });
        
        $("#jobSpec-selection").select2({
            placeholder: "Job Specialization or Position eg. Accounting",
            allowClear: true,
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
        var inputLeft = document.getElementById("input-left");
        var inputRight = document.getElementById("input-right");

        var thumbLeft = document.querySelector(".slider > .thumb.left");
        var thumbRight = document.querySelector(".slider > .thumb.right");
        var range = document.querySelector(".slider > .range");

        function setLeftValue() {
            var _this = inputLeft,
                min = parseInt(_this.min),
                max = parseInt(_this.max);

            _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);

            var percent = ((_this.value - min) / (max - min)) * 100;

            thumbLeft.style.left = percent + "%";
            range.style.left = percent + "%";
        }
        setLeftValue();

        function setRightValue() {
            var _this = inputRight,
                min = parseInt(_this.min),
                max = parseInt(_this.max);

            _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);

            var percent = ((_this.value - min) / (max - min)) * 100;

            thumbRight.style.right = (100 - percent) + "%";
            range.style.right = (100 - percent) + "%";
        }
        setRightValue();

        inputLeft.addEventListener("input", setLeftValue);
        inputRight.addEventListener("input", setRightValue); 

        inputLeft.addEventListener("mouseover", function () {
            thumbLeft.classList.add("hover");
        })

        inputLeft.addEventListener("mouseout", function () {
            thumbLeft.classList.remove("hover");
        })

        inputLeft.addEventListener("mousedown", function () {
            thumbLeft.classList.add("active");
        })

        inputLeft.addEventListener("mouseup", function () {
            thumbLeft.classList.remove("active");
        })

        inputRight.addEventListener("mouseover", function () {
            thumbRight.classList.add("hover");
        })

        inputRight.addEventListener("mouseout", function () {
            thumbRight.classList.remove("hover");
        })

        inputRight.addEventListener("mousedown", function () {
            thumbRight.classList.add("active");
        })

        inputRight.addEventListener("mouseup", function () {
            thumbRight.classList.remove("active");
        })
    </script>

    <script>
        $(document).ready(function () {
            $("#input-left").on("input change", function () {
                document.getElementById('txt_amountLeft').value = document.getElementById('input-left').value;
            });
        });

        $(document).ready(function () {
            $("#input-right").on("input change", function () {
                document.getElementById('txt_amountRight').value = document.getElementById('input-right').value;
            });
        });
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
            var rangeFrom = document.getElementById('txt_amountLeft').value;
            var rangeEnd = document.getElementById('txt_amountRight').value;


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
                "&job_type=" + job_type + "&job_spec=" + job_spec + "&rangeFrom=" + rangeFrom + "&rangeEnd=" + rangeEnd;
        }

        function getSelectedLocation() {
            var locationQuery = window.location.href.split('?')[1];
            locationQuery = locationQuery.split('&')[1];
            locationQuery = locationQuery.split('=')[1];

            var location = locationQuery.split(',');
            var select2_input = document.getElementById("location-selection");

            if (location !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < location.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(location[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(location[i]) + "' selected id='" + unescape(location[i]) + "'>" + unescape(location[i]) + "</option>";
                    }
                }

                for (var i = 0; i < location.length; i++) {

                    if (document.getElementById(location[i]) != null) {
                        document.getElementById(location[i]).selected = true;
                    }

                }
            }
        }

        function getJobTitle() {
            var titleQuery = window.location.href.split('?')[1];
            titleQuery = titleQuery.split('=')[1];

            var title = titleQuery.split('&')[0];
            title = title.split(',');
            var job_titleText = document.getElementById("ContentPlaceHolder1_txt_SearchJobTitle");

            if (title !== " ") {
                job_titleText.value = title;
            }
        }

        function getSelectedJobType() {
            var jobTypeQuery = window.location.href.split('?')[1];
            jobTypeQuery = jobTypeQuery.split('&')[2];
            jobTypeQuery = jobTypeQuery.split('=')[1];

            var jobType = jobTypeQuery.split(',');
            var select2_input = document.getElementById("jobtype-selection");

            if (jobType !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < jobType.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(jobType[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(jobType[i]) + "' selected id='" + unescape(jobType[i]) + "'>" + unescape(jobType[i]) + "</option>";
                    }
                }

                for (var i = 0; i < jobType.length; i++) {

                    if (document.getElementById(jobType[i]) != null) {
                        document.getElementById(jobType[i]).selected = true;
                    }

                }
            }
        }

        function getSelectedJobSpec() {
            var jobSpecQuery = window.location.href.split('?')[1];
            jobSpecQuery = jobSpecQuery.split('&')[3];
            jobSpecQuery = jobSpecQuery.split('=')[1];

            var jobSpec = jobSpecQuery.split(',');
            var select2_input = document.getElementById("jobSpec-selection");

            if (jobSpec !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < jobSpec.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(jobSpec[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(jobSpec[i]) + "' selected id='" + unescape(jobSpec[i]) + "'>" + unescape(jobSpec[i]) + "</option>";
                    }
                }

                for (var i = 0; i < jobSpec.length; i++) {

                    if (document.getElementById(jobSpec[i]) != null) {
                        document.getElementById(jobSpec[i]).selected = true;
                    }

                }
            }
        }

        //function getSalaryRange() {
        //    var salaryQuery = window.location.href.split('?')[1];

        //    var salaryQueryFrom = salaryQuery.split('&')[4];
        //    var salaryQueryEnd = salaryQuery.split('&')[5];

        //    salaryQueryFrom = salaryQueryFrom.split('=')[1];
        //    salaryQueryEnd = salaryQueryEnd.split('=')[1];

        //    var salaryLeft = document.getElementById("input-left");
        //    var salaryRight = document.getElementById("input-right");

        //    if (salaryQueryEnd !== " " || salaryQueryFrom !== " ") {
        //        salaryLeft.value = salaryQueryFrom;
        //        salaryRight.value = salaryQueryEnd;
        //    }
        //}

        //Print out the available industry
        printSelect2State("location-selection");
        printSelect2JobType("jobtype-selection");
        printSelect2JobSpec("jobSpec-selection");

        getSelectedLocation();
        getJobTitle();
        getSelectedJobType();
        getSelectedJobSpec();
        //getSalaryRange();
    </script>
</asp:Content>