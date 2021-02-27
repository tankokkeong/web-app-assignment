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
                <form>
                    <div class="form-group JobListContentsBackgroundInputs">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="JobListContentsSearchPosition">
                                    <img src="images/JobsList/loupe.png" alt="search" class="JobListContentsSearchImage"/>
                                </span>
                            </div>
                            <input type="text" class="form-control" placeholder="Job Title, Keyword or Company" aria-label="searchbar" aria-describedby="searchbar">
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
                                <select class="custom-select" aria-label="locations" aria-describedby="locations" id="selectStates" multiple>
                                    <option value="">All</option>
                                    <option value="Malacca">Malacca</option>
                                    <option value="Selangor">Selangor</option>
                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                    <option value="Terengganu">Terengganu</option>
                                    <option value="Kedah">Kedah</option>
                                    <option value="Kelantan">Kelantan</option>
                                    <option value="Pahang">Pahang</option>
                                    <option value="Penang">Penang</option>
                                    <option value="Perak">Perak</option>
                                    <option value="Perlis">Perlis</option>
                                    <option value="Sabah">Sabah</option>
                                    <option value="Sarawak">Sarawak</option>
                                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                                    <option value="Labuan">Labuan</option>
                                    <option value="Putrajaya">Putrajaya</option>
                                    <option value="Johor">Johor</option>
                                </select>
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
                            <div class="JobListContentsJobCategoryDropdown">
                                <select class="custom-select jobCategory" aria-label="jobCategory" aria-describedby="jobCategory" name="jobCategory[]" multiple="multiple">
                                    <option value="All">All</option>
                                    <option value="Full Time">Full Time</option>
                                    <option value="Part Time">Part Time</option>
                                </select>
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
                                <select class="custom-select" id="jobSpec" aria-label="jobSpec" aria-describedby="jobSpec" multiple>
                                    <option value="">All</option>
                                    <option value="Accounting">Accounting</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Architect">Architect</option>
                                    <option value="Web Development">Web Development</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btn_JobListContentsBackgroundInputsSearchButton" CssClass="JobListContentsBackgroundInputsSearchButton btn btn-info" runat="server" Text="Search" />
                </form>
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <div class="container">
                <div class="JobListContentsAllCompaniesContainer">
                    <div class="JobListContentsAllCompaniesHeaderPosition">
                        <h2 class="JobListContentsAllCompaniesHeader">Candidates Recommended</h2>
                    </div>
                    <asp:Label ID="lbl_JobListContentsAllCompanies" CssClass="row" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#selectStates").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
        });

        $('.jobCategory').select2({
            placeholder: "Job Category",
        });

        $("#jobSpec").select2({
            placeholder: "Job Specialization or Position eg. Accounting",
            allowClear: true,
            tags: true,
        });

        function directContact() {
            window.location = 'recruiter-profile.aspx';
        }

        function directDetails() {
            window.location = 'user-profile.aspx';
        }

        function updateTextInput(val) {
            document.getElementById('textInputMax').value = val;
        }
    </script>
</asp:Content>
