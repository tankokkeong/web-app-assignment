<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="candidate-list.aspx.cs" Inherits="web_app_assignment.candidate_list" %>
    
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
                                <asp:ListBox ID="lstSearchSkills" runat="server" CssClass="form-control selectSkills custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
                                <asp:ListBox ID="lstSearchLocation" runat="server" CssClass="form-control selectStates custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
                                <asp:ListBox ID="lstSearchIndustry" runat="server" CssClass="form-control jobIndustry custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
                                <asp:ListBox ID="lstSearchJobProfession" runat="server" CssClass="form-control jobProfession custom-select" multiple="multiple" SelectionMode ="Multiple"></asp:ListBox>
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
        $(".selectSkills").select2({
            placeholder: "Skills",
            allowClear: true,
            tags: true,
        });

        $(".selectStates").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
        });

        $('.jobIndustry').select2({
            placeholder: "Industry",
            allowClear: true,
            tags: true,
        });

        $(".jobProfession").select2({
            placeholder: "Job Profession",
            allowClear: true,
            tags: true,
        });

        function directContact() {
            window.location = 'recruiter-profile.aspx';
        }

        function directDetails(count) {
            window.location = 'user-profile.aspx?view=' + count;
        }

        function updateTextInput(val) {
            document.getElementById('textInputMax').value = val;
        }
    </script>

    <script>
        function CandidateSearch() {
            //Get Search Input
            var location_selected = $('.selectStates').select2('data');
            var job_location = "";
            var skils_selected = $('.selectSkills').select2('data');
            var job_skills = "";
            var industry_selected = $('.jobIndustry').select2('data');
            var job_industry = "";
            var profession_selected = $('.jobProfession').select2('data');
            var job_profession = "";

            for (var i = 0; i < location_selected.length; i++) {

                if (i === 0) {
                    job_location = location_selected[i].text;
                }
                else {
                    job_location = job_location + "," + location_selected[i].text;
                }
            }

            for (var i = 0; i < skils_selected.length; i++) {

                if (i === 0) {
                    job_skills = skils_selected[i].text;
                }
                else {
                    job_skills = job_skills + "," + skils_selected[i].text;
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
    </script>
</asp:Content>
