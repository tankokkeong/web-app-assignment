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
                                <asp:DropDownList ID="ddl_SearchSkills" CssClass="selectSkills custom-select form-control" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Malacca">Malacca</asp:ListItem>
                                    <asp:ListItem Value="Selangor">Selangor</asp:ListItem>
                                    <asp:ListItem Value="Negeri Sembilan">Negeri Sembilan</asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:DropDownList ID="ddl_JobListContentsLocationSelectStates" CssClass="selectStates custom-select form-control" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Malacca">Malacca</asp:ListItem>
                                    <asp:ListItem Value="Selangor">Selangor</asp:ListItem>
                                    <asp:ListItem Value="Negeri Sembilan">Negeri Sembilan</asp:ListItem>
                                    <asp:ListItem Value="Terengganu">Terengganu</asp:ListItem>
                                    <asp:ListItem Value="Kedah">Kedah</asp:ListItem>
                                    <asp:ListItem Value="Kelantan">Kelantan</asp:ListItem>
                                    <asp:ListItem Value="Pahang">Pahang</asp:ListItem>
                                    <asp:ListItem Value="Perak">Perak</asp:ListItem>
                                    <asp:ListItem Value="Perlis">Perlis</asp:ListItem>
                                    <asp:ListItem Value="Sabah">Sabah</asp:ListItem>
                                    <asp:ListItem Value="Sarawak">Sarawak</asp:ListItem>
                                    <asp:ListItem Value="Kuala Lumpur">Kuala Lumpur</asp:ListItem>
                                    <asp:ListItem Value="Labuan">Labuan</asp:ListItem>
                                    <asp:ListItem Value="Johor">Johor</asp:ListItem>
                                    <asp:ListItem Value="Putrajaya">Putrajaya</asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:DropDownList ID="ddl_JobListContentsSelectIndustry" CssClass="custom-select jobIndustry form-control" runat="server" multiple>
                                    <asp:ListItem Value="Teachers and Trainers for Jewellery Production">Teachers and Trainers for Jewellery Production</asp:ListItem>
                                    <asp:ListItem Value="Wireless Technologist">Wireless Technologist</asp:ListItem>
                                    <asp:ListItem Value="Photonics">Photonics</asp:ListItem>
                                    <asp:ListItem Value="Electrical & Electronics">Electrical & Electronics</asp:ListItem>
                                    <asp:ListItem Value="Designers">Designers</asp:ListItem>
                                    <asp:ListItem Value="Wood Technologists">Wood Technologists</asp:ListItem>
                                    <asp:ListItem Value="Food Industry">Food Industry</asp:ListItem>
                                    <asp:ListItem Value="Biotechnologist">Biotechnologist</asp:ListItem>
                                    <asp:ListItem Value="Conveyor Vulcanizing">Conveyor Vulcanizing</asp:ListItem>
                                    <asp:ListItem Value="Digital Imaging">Digital Imaging</asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:DropDownList ID="ddl_JobListContentsSelectProfession" CssClass="custom-select jobSpec form-control" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                                    <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                    <asp:ListItem Value="Architect">Architect</asp:ListItem>
                                    <asp:ListItem Value="Web Development">Web Development</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btn_JobListContentsBackgroundInputsSearchButton" CssClass="JobListContentsBackgroundInputsSearchButton btn btn-info" runat="server" Text="Search" OnClick="btn_JobListContentsBackgroundInputsSearchButton_Click" />
                
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

        $(".jobSpec").select2({
            placeholder: "Job Specialization or Position eg. Accounting",
            allowClear: true,
            tags: true,
        });

        function directContact() {
            window.location = 'recruiter-profile.aspx';
        }

        function directDetails(count) {
            window.location = 'user-profile.aspx?seeker_id=' + count;
        }

        function updateTextInput(val) {
            document.getElementById('textInputMax').value = val;
        }
    </script>
</asp:Content>
