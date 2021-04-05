﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="candidate-list.aspx.cs" Inherits="web_app_assignment.candidate_list" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Candidate List</title>
    <link href="style/candidate-list.css" rel="stylesheet" />
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
                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsSearchPosition">
                                    <img src="images/JobsList/loupe.png" alt="search" class="JobListContentsSearchImage"/>
                                </span>
                            </div>
                            <div class="JobListContentsSkillsDropdown">
                                <select class="form-control selectSkills custom-select" style="width:100%;" id="skills-selection" multiple="multiple"></select>
                            </div>
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
                            <div class="JobListContentsIndustryDropdown">
                                <select class="form-control jobIndustry custom-select" style="width:100%;" id="industry-selection" multiple="multiple"></select>
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
                            <div class="JobListContentsJobProfessionDropdown">
                                <select class="form-control jobProfession custom-select" style="width:100%;" id="profession-selection" multiple="multiple"></select>
                            </div>
                        </div>
                    </div>
                <button id="btn_JobListContentsBackgroundInputsSearchButton" class="btn btn-info JobListContentsBackgroundInputsSearchButton" onclick="CandidateSearch()" type="button">Search</button>                
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <div class="container">
                <div class="JobListContentsAllCompaniesContainer">
                    <div class="JobListContentsAllCompaniesHeaderPosition">
                        <h2 class="JobListContentsAllCompaniesHeader">Candidates Recommended</h2>
                    </div>
                    <div class="PageSizeLimit">
                        Limit
                        <asp:DropDownList ID="ddlPageSize" runat="server" CssClass="btn btn-sm bg-lightgreen text-white PageSizeLimitPosition" AutoPostBack="true">
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
        $("#skills-selection").select2({
            placeholder: "Skills",
            allowClear: false,
            newTag: false,
            tags: true,
        });

        $("#location-selection").select2({
            placeholder: "Select Location or Write Location",
            allowClear: false,
            newTag: false,
            tags: true,
        });

        $('#industry-selection').select2({
            placeholder: "Industry",
            allowClear: false,
            newTag: false,
            tags: true,
        });

        $("#profession-selection").select2({
            placeholder: "Job Profession",
            allowClear: false,
            newTag: false,
            tags: true,
        });

        function directContact() {
            window.location = 'recruiter-profile.aspx';
        }

        function directDetails(count) {
            window.location = 'user-profile.aspx?view=' + count;
        }
    </script>

    <script>
        function CandidateSearch() {
            //Get Search Input
            var location_selected = $('#location-selection').select2('data');
            var job_location = "";
            var skills_selected = $('#skills-selection').select2('data');
            var job_skills = "";
            var industry_selected = $('#industry-selection').select2('data');
            var job_industry = "";
            var profession_selected = $('#profession-selection').select2('data');
            var job_profession = "";

            for (var i = 0; i < location_selected.length; i++) {

                if (i === 0) {
                    job_location = location_selected[i].text;
                }
                else {
                    job_location = job_location + "," + location_selected[i].text;
                }
            }

            for (var i = 0; i < skills_selected.length; i++) {

                if (i === 0) {
                    job_skills = skills_selected[i].text;
                }
                else {
                    job_skills = job_skills + "," + skills_selected[i].text;
                }
            }

            for (var i = 0; i < industry_selected.length; i++) {

                if (i === 0) {
                    job_industry = industry_selected[i].text;
                }
                else {
                    job_industry = job_industry + "," + industry_selected[i].text;
                }
            }

            for (var i = 0; i < profession_selected.length; i++) {

                if (i === 0) {
                    job_profession = profession_selected[i].text;
                }
                else {
                    job_profession = job_profession + "," + profession_selected[i].text;
                }
            }

            //Redirect to job list page
            window.location.href = "candidate-list.aspx?skills=" + job_skills + "&location=" + job_location + "&prefer_industry=" + job_industry + "&profession=" + job_profession;

        }

        //Sticky form script
        function getSelectedIndustry() {
            var industriesQuery = window.location.href.split('?')[1];
            industriesQuery = industriesQuery.split('&')[2];
            industriesQuery = industriesQuery.split('=')[1];

            var industries = industriesQuery.split(',');
            var select2_input = document.getElementById("industry-selection");

            if (industries !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < industries.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(industries[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(industries[i]) + "' selected id='" + unescape(industries[i]) + "'>" + unescape(industries[i]) + "</option>";
                    }
                }

                for (var i = 0; i < industries.length; i++) {

                    if (document.getElementById(industries[i]) != null) {
                        document.getElementById(industries[i]).selected = true;
                    }

                }
            }
        }

        function getSelectedSkills() {
            var skillsQuery = window.location.href.split('?')[1];
            skillsQuery = skillsQuery.split('=')[1];

            var skills = skillsQuery.split('&')[0];
            skills = skills.split(',');
            var select2_input = document.getElementById("skills-selection");

            if (skills !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < skills.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(skills[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(skills[i]) + "' selected id='" + unescape(skills[i]) + "'>" + unescape(skills[i]) + "</option>";
                    }
                }

                for (var i = 0; i < skills.length; i++) {

                    if (document.getElementById(skills[i]) != null) {
                        document.getElementById(skills[i]).selected = true;
                    }

                }
            }
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

        function getSelectedProfession() {
            var professionQuery = window.location.href.split('?')[1];
            professionQuery = professionQuery.split('&')[3];
            professionQuery = professionQuery.split('=')[1];
            console.log(professionQuery);

            var profession = professionQuery.split(',');
            var select2_input = document.getElementById("profession-selection");

            if (profession !== " ") {
                //Add Customize creation for the users
                for (var i = 0; i < profession.length; i++) {

                    //If the selected value didnt exist in the current option
                    if (document.getElementById(profession[i]) == null) {
                        select2_input.innerHTML = select2_input.innerHTML + "<option value='" + unescape(profession[i]) + "' selected id='" + unescape(profession[i]) + "'>" + unescape(profession[i]) + "</option>";
                    }
                }

                for (var i = 0; i < profession.length; i++) {

                    if (document.getElementById(profession[i]) != null) {
                        document.getElementById(profession[i]).selected = true;
                    }

                }
            } 
        }

        //Print out the available industry
        printSelect2Industry("industry-selection");
        printSelect2Skills("skills-selection");
        printSelect2State("location-selection");
        printSelect2Profession("profession-selection");

        getSelectedIndustry();
        getSelectedSkills();
        getSelectedLocation();
        getSelectedProfession();
    </script>
</asp:Content>
