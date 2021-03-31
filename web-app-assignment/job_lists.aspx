﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_lists.aspx.cs" Inherits="web_app_assignment.job_lists" %>

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
                                <asp:ListBox ID="lstSearchLocation" CssClass="form-control selectStates custom-select" SelectionMode="Multiple" multiple="multiple" runat="server"></asp:ListBox>
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
                                <asp:ListBox ID="lstSearchJobType" runat="server" CssClass="form-control jobType custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
                                <asp:ListBox ID="lstSearchJobSpec" runat="server" CssClass="form-control jobSpec custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
        $(".selectStates").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
        });
        $('.jobType').select2({
            placeholder: "Job Type",
        });
        
        $(".jobSpec").select2({
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
                console.log(document.getElementById('txt_amountLeft').value);
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
            var location_selected = $('.selectStates').select2('data');
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
    </script>
</asp:Content>