<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_lists.aspx.cs" Inherits="web_app_assignment.job_lists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Lists</title>
    <link href="style/job_lists.css" rel="stylesheet" type="text/css"/>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  <div class="JobListContents">
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
                    <div class="PageSizeLimit">
                        Limit
                        <asp:DropDownList ID="ddlPageSize" CssClass="btn btn-sm bg-lightgreen text-white dropdown-toggle PageSizeLimitPosition" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" runat="server">
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="60">60</asp:ListItem>
                        </asp:DropDownList>
                        Per Page
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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

</asp:Content>
