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
                                <asp:DropDownList ID="ddl_JobListContentsLocationSelectStates" CssClass="selectStates custom-select" runat="server" multiple>
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
                                <asp:DropDownList ID="ddl_JobListContentsSelectJobType" CssClass="custom-select jobType" name="jobCategory[]" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Full Time">Full Time</asp:ListItem>
                                    <asp:ListItem Value="Part Time">Part Time</asp:ListItem>
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
                                <asp:DropDownList ID="ddl_JobListContentsSelectJobSpec" CssClass="custom-select jobSpec" runat="server" multiple>
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                                    <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                    <asp:ListItem Value="Architect">Architect</asp:ListItem>
                                    <asp:ListItem Value="Web Development">Web Development</asp:ListItem>
                                </asp:DropDownList>
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
                            <div class="JobListContentsSalaryRange">
                                <p>
                                  <label for="amount">Salary Range:</label>

                                    <asp:TextBox ID="txt_amount" CssClass="amount" runat="server" BorderStyle="None"></asp:TextBox>
                                </p>
                                <div id="slider-range"></div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btn_JobListContentsBackgroundInputsSearchButton" CssClass="JobListContentsBackgroundInputsSearchButton btn btn-info" OnClick="btn_JobListContentsBackgroundInputsSearchButton_Click" runat="server" Text="Search" />
                </form>
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <div class="container">
                <div class="JobListContentsAllCompaniesContainer">
                    <div class="JobListContentsAllCompaniesHeaderPosition">
                        <h2 class="JobListContentsAllCompaniesHeader">Companies Recommended</h2>
                    </div>
                    <asp:Label ID="lbl_JobListContentsAllCompanies" CssClass="row" runat="server"></asp:Label>
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

        function directContact() {
            window.location = 'recruiter-profile.aspx';
        }

        function directDetails(count) {
            window.location = 'job_description.aspx?post_id=' + count;
        }

        function updateTextInput(val) {
            document.getElementById('textInputMax').value = val;
        }
    </script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 50000,
                values: [0, 50000],
                slide: function (event, ui) {
                    $(".amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                }
            });
            $(".amount").val("$" + $("#slider-range").slider("values", 0) +
                " - $" + $("#slider-range").slider("values", 1));
        });
    </script>
</asp:Content>
