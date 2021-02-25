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
                                <select class="form-control">
                                    <option value="">All</option>
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
                                  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                                </p>
                            
                                <div id="slider-range"></div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btn_JobListContentsBackgroundInputsSearchButton" CssClass="JobListContentsBackgroundInputsSearchButton btn btn-info" runat="server" Text="Search" />
                </form>
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <div class="container">
                <div class="JobListContentsAllCompaniesHeaderPosition">
                    <h2 class="JobListContentsAllCompaniesHeader">Companies Recommended</h2>
                </div>

                <% for (int i = 0; i < 5; i++)
                            { %>
                <div class="row">
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner1-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                            <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                <%--Stars Here--%>
                                <p>Stars</p>
                            </div>
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Fashion Designer</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Penang</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 1,680 - MYR 2,019</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Full Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton">
                                    <asp:Button ID="Button1" CssClass="btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow" 
                                        runat="server" Text="More Details" OnClick="btn_jobListContentsApplyNow2_Click" />
                                    <asp:Button ID="Button2" CssClass="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow" 
                                        runat="server" Text="Contact Now" OnClick="btn_jobListContentsContactNow2_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner3-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                            <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                <%--Stars Here--%>
                                <p>Stars</p>
                            </div>
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Accounting</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Sabah</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 2,680 - MYR 3,019</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Full Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyDetailsButton">
                                    <asp:Button ID="btn_jobListContentsApplyNow2" CssClass="btn btn-primary JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow" 
                                        runat="server" Text="More Details" OnClick="btn_jobListContentsApplyNow2_Click" />
                                    <asp:Button ID="btn_jobListContentsContactNow2" CssClass="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow" 
                                        runat="server" Text="Contact Now" OnClick="btn_jobListContentsContactNow2_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <%}; %>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#selectStates").select2({
            placeholder: "Select Location or Write Location",
            allowClear: true,
            tags: true,
        });

        $("#jobCategory").select2({
            placeholder: "Select Job Category",
            allowClear: true,
            tags: true,
        });

        $("#jobSpec").select2({
            placeholder: "Job Specialization or Position eg. Accounting",
            allowClear: true,
            tags: true,
        });

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
                    $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                }
            });
            $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                " - $" + $("#slider-range").slider("values", 1));
        });
    </script>
</asp:Content>
