<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_description.aspx.cs" Inherits="web_app_assignment.job_description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Description</title>
    <link href="style/job_description.css" rel="stylesheet" type="text/css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="JobDescription">
        <div class="JobDescriptionDetails">
            <div class="JobDescriptionDetailsImagePosition">
                <img src="images/home/partner1-min.png" alt="company" class="JobDescriptionDetailsImage"/>
            </div>
            <div class="JobDescriptionDetailsBody">
                <h2 class="JobDescriptionDetailsBodyHeader">H&M</h2>
                <div class="JobDescriptionDetailsBodyContents">
                    <div class="JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/pin.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <p class="JobDescriptionDetailsBodyContentsDetailsDescription">Penang</p>
                    </div>
                    <div class="JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/working-position.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <p class="JobDescriptionDetailsBodyContentsDetailsDescription">Fashion Designer</p>
                    </div>
                    <div class="JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/salary.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <p class="JobDescriptionDetailsBodyContentsDetailsDescription">MYR 1,680 - MYR 2,019</p>
                    </div>
                </div>
            </div>
            <div class="JobDescriptionDetailsApplyNow">
                <button type="button" class="btn btn-danger JobDescriptionDetailsApplyNowButton">Apply Now</button>
            </div>
        </div>
        <div class="JobDescriptionContents">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="jobdescription-tab" data-toggle="tab" href="#jobdescription" role="tab" aria-controls="jobdescription" aria-selected="true">Job Description</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="companyoverview-tab" data-toggle="tab" href="#companyoverview" role="tab" aria-controls="companyoverview" aria-selected="false">Company Overview</a>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="jobdescription" role="tabpanel" aria-labelledby="jobdescription-tab">
                    <div class="JobDescriptionContentsBody">
                        <h2 class="JobDescriptionContentsBodyHeader">H&M (Fashion Designer)</h2>
                    </div>
                    <div class="JobDescriptionContentsBodyContents1">
                        <h4 class="JobDescriptionContentsBodySubHeader">Responsibilities : </h4>
                        <ul>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                        </ul>
                    </div>
                    <div class="JobDescriptionContentsBodyContents2">
                        <h4 class="JobDescriptionContentsBodySubHeader">Requirements : </h4>
                        <ul>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                            <li>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida.
                            </li>
                        </ul>
                    </div>
                    <div class="JobDescriptionContentsBodyContents3">
                        <h4 class="JobDescriptionContentsBodySubHeader">Additional Information : </h4>
                        <div class="JobDescriptionContentsBodyContents3Details">
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Qualification</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Diploma</button>
                                    <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Degree</button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Experience Required</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>At Least 1 Year</button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Working Hours</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Monday - Friday 9A.M. - 6P.M.</button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Job Type</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Full Time</button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Job Specializations</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Fashion Designs</button>
                                    <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Arts</button>
                                    <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Creative Design</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="companyoverview" role="tabpanel" aria-labelledby="companyoverview-tab">
                    <div class="companyOverviewInformation">
                        <h5 class="companyOverviewInformationPara">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse arcu augue, iaculis a quam ut, varius 
                            dignissim enim. Morbi egestas dolor semper lectus vulputate, interdum placerat ante venenatis. Nullam tincidunt 
                            nulla sed consequat ullamcorper. Etiam sagittis vel arcu non varius. Morbi et congue magna. Morbi fermentum venenatis 
                            neque, ac auctor justo fermentum imperdiet. Donec viverra blandit scelerisque. Duis maximus pulvinar tincidunt. 
                            Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam aliquet, nibh at mattis 
                            pellentesque, dolor ipsum pharetra nibh, vitae pretium libero nunc sit amet lacus. Praesent at sapien nec mi finibus 
                            congue iaculis eget orci.
                        </h5>
                        <div class="companyOverviewInformationDetails">
                            <h3 class="companyOverviewInformationDetailsHeader">Additional Company Information : </h3>
                            <div class="companyOverviewInformationDetailsSubDetails">
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Company Size</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>126,376 Employees</button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Industry</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Clothing Retail Company</button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Average Processing Time</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>27 Days</button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Benefit & Others</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Insurance Coverage</button>
                                        <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Performance Bonus</button>
                                        <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Dental</button>
                                        <button type="button" class="btn btn-info btn-lg JobDescriptionContentsBodySubHeadersTagsButton" disabled>Medical</button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Headquaters</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="btn btn-lg btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>Stockholm, Sweden</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
