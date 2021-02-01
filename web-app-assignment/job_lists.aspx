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
                    Find the jobs that matter to you
                </h2>
                <div class="JobListContentsBackgroundInputs">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="JobListContentsSearchPosition">
                                <img src="images/JobsList/loupe.png" alt="search" class="JobListContentsSearchImage"/>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="Job Title, Keyword or Company" aria-label="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="JobListContentsBackgroundInputs">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="JobListContentsLocationPosition">
                                <img src="images/JobsList/pin.png" alt="location" class="JobListContentsLocationImage"/>
                            </span>
                        </div>
                        <div class="JobListContentsLocationDropdown">
                            <select class="custom-select" id="selectStates" multiple>
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
                <div class="JobListContentsBackgroundInputs">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="JobListContentsJobCategoryPosition">
                                <img src="images/JobsList/menu.png" alt="Job Category" class="JobListContentsJobCategoryImage"/>
                            </span>
                        </div>
                        <div class="JobListContentsJobCategoryDropdown">
                            <select class="custom-select" id="jobCategory" multiple>
                                <option value="">All</option>
                                <option value="New">New</option>
                                <option value="Recent">Recent</option>
                                <option value="Full Time">Full Time</option>
                                <option value="Part Time">Part Time</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="JobListContentsBackgroundInputs">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="JobListContentsJobSpecPosition">
                                <img src="images/JobsList/suitcase.png" alt="Job Spec" class="JobListContentsJobSpecImage"/>
                            </span>
                        </div>
                        <div class="JobListContentsJobSpecDropdown">
                            <select class="custom-select" id="jobSpec" multiple>
                                <option value="">All</option>
                                <option value="Accounting">Accounting</option>
                                <option value="Information Technology">Information Technology</option>
                                <option value="Architect">Architect</option>
                                <option value="Web Development">Web Development</option>
                            </select>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-info JobListContentsBackgroundInputsSearchButton">Search</button>
            </div>
        </div>

        <div class="JobListContentsAllCompanies">
            <h2 class="JobListContentsAllCompaniesHeader">All Companies</h2>
            <div class="container">
                <div class="row">
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner1-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
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
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner4-min.png"" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Technician</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Johor</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 1,750 - MYR 2,970</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Full Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner3-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
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
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner10-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Customer Services</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Pahang</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 1,000 - MYR 2,200</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Part Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow" href="">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner7-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Software Engineer</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Malacca</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 5,000 - MYR 6,000</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Part Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm JobListContentsAllCompaniesBoxes">
                        <div class="JobListContentsAllCompaniesBoxesCompanyLogoPosition">
                            <img src="images/home/partner6-min.png" class="JobListContentsAllCompaniesBoxesCompanyLogoPosition" alt="company" />
                        </div>
                        <div class="JobListContentsAllCompaniesBoxesDetails">
                            <h4 class="JobListContentsAllCompaniesBoxesDetailsTitle">Industry</h4>
                            <div class="JobListContentsAllCompaniesBoxesDetailsBody">
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/working-position.png" alt="position" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Market Manager</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/pin.png" alt="location" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Kuala Lumpur</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/salary.png" alt="salary" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">MYR 2,800 - MYR 3,900</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsBodyContents">
                                    <img src="images/JobsList/clock.png" alt="emmployee status" class="JobListContentsAllCompaniesBoxesImages"/>
                                    <p class="JobListContentsAllCompaniesBoxesDetailsBodyContentsDescription">Full Time</p>
                                </div>
                            </div>
                            <div class="JobListContentsAllCompaniesBoxesDetailsFooter">
                                <div class="JobListContentsAllCompaniesBoxesDetailsStars">
                                    <%--Stars Here--%>
                                    <p>Stars</p>
                                </div>
                                <div class="JobListContentsAllCompaniesBoxesDetailsApplyButton">
                                    <button type="button" class="btn btn-danger JobListContentsAllCompaniesBoxesDetailsApplyButtonApplyNow">Apply Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#selectStates").select2({
            placeholder: "Select State",
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
    </script>
</asp:Content>
