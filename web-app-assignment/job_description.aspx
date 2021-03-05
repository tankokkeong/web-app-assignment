<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_description.aspx.cs" Inherits="web_app_assignment.job_description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Description</title>
    <link href="style/job_description.css" rel="stylesheet" type="text/css"/>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="JobDescription">
        <div class="row JobDescriptionDetails">
            <div class="ml-5 col JobDescriptionDetailsImagePosition">
                <asp:Image ID="img_JobDescriptionDetailsImage" CssClass="JobDescriptionDetailsImage" runat="server" />
            </div>
            <div class="col ml-3 JobDescriptionDetailsBody">
                <h2 class="JobDescriptionDetailsBodyHeader">
                    <asp:Label ID="lbl_JobDescriptionDetailsHeader" runat="server" Text=""></asp:Label>
                </h2>
                <div class="JobDescriptionDetailsBodyContents">
                    <div class="col JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/pin.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <asp:Label ID="lbl_JobDescriptionDetailsLocation" CssClass="JobDescriptionDetailsBodyContentsDetailsDescription" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/working-position.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <asp:Label ID="lbl_JobDescriptionDetailsJobTitle" CssClass="ml-2 JobDescriptionDetailsBodyContentsDetailsDescription" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col JobDescriptionDetailsBodyContentsDetails">
                        <img src="images/JobsList/salary.png" alt="location" class="JobDescriptionDetailsBodyContentsImage"/>
                        <asp:Label ID="lbl_JobDescriptionDetailsJobSalary" CssClass="ml-2 JobDescriptionDetailsBodyContentsDetailsDescription" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col JobDescriptionDetailsApplyNow">
                <asp:Button ID="btn_JobDescriptionDetailsApplyNowButton" CssClass="btn btn-danger" runat="server" Text="Apply Now" OnClick="btn_JobDescriptionDetailsApplyNowButton_Click"/>
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

                    <%--The CkEditor Stuff in here--%>
                    <div>
                        <asp:Label ID="lbl_JobDescriptionDesc" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="JobDescriptionContentsBodyContents3">
                        <h4 class="JobDescriptionContentsBodySubHeader">Additional Information : </h4>
                        <div class="JobDescriptionContentsBodyContents3Details">
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Qualification</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <asp:Label ID="lbl_JobDescriptionQualification" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Experience Required</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                        <asp:Label ID="lbl_JobDescriptionExpReq" runat="server" Text=""></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Working Hours</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                        <asp:Label ID="lbl_JobDescriptionWorkingHours" runat="server" Text=""></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Job Type</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                        <asp:Label ID="lbl_JobDescriptionJobType" runat="server" Text=""></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div class="JobDescriptionContentsBodySubContents">
                                <h5 class="JobDescriptionContentsBodySubHeaders">Job Specializations</h5>
                                <div class="JobDescriptionContentsBodySubHeadersTags">
                                    <asp:Label ID="lbl_JobDescriptionJobSpec" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="companyoverview" role="tabpanel" aria-labelledby="companyoverview-tab">
                    <div class="companyOverviewInformation">
                        <%--The CkEditor Stuff in here--%>
                        <div>
                            <asp:Label ID="lbl_JobDescriptionCompOverview" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="companyOverviewInformationDetails">
                            <h3 class="companyOverviewInformationDetailsHeader">Additional Company Information : </h3>
                            <div class="companyOverviewInformationDetailsSubDetails">
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Company Size</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                            <asp:Label ID="lbl_JobDescriptionCompSize" runat="server" Text=""></asp:Label>
                                        </button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Industry</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <asp:Label ID="lbl_JobDescriptionIndustry" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Average Processing Time</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                            <asp:Label ID="lbl_JobDescriptionProcessTime" runat="server" Text=""></asp:Label>
                                        </button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Headquaters</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <button type="button" class="mr-4 btn btn-info JobDescriptionContentsBodySubHeadersTagsButton" disabled>
                                            <asp:Label ID="lbl_JobDescriptionHeadquaters" runat="server" Text=""></asp:Label>
                                        </button>
                                    </div>
                                </div>
                                <div class="companyOverviewInformationDetailsSubs">
                                    <h5 class="companyOverviewInformationDetailsSubHeaders">Benefit & Others</h5>
                                    <div class="JobDescriptionContentsBodySubHeadersTags">
                                        <asp:Label ID="lbl_JobDescriptionBenefitOther" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="JobDescriptionContentsReviews">
                <div>
                    <div class="JobDescriptionContentsReviewsHeader row">
                        <h4 class="ml-4 col-sm">Job Review</h4>
                            <div class="ml-4 form-group rating col-sm"> 
                                <input type="radio" class="form-control" name="rating" value="5" id="5">
                                <label for="5">☆</label>
                                <input type="radio" class="form-control" name="rating" value="4" id="4">
                                <label for="4">☆</label>
                                <input type="radio" class="form-control" name="rating" value="3" id="3">
                                <label for="3">☆</label>
                                <input type="radio" class="form-control" name="rating" value="2" id="2">
                                <label for="2">☆</label>
                                <input type="radio" class="form-control" name="rating" value="1" id="1">
                                <label for="1">☆</label>
                            </div>
                        </div>
                        <div class="form-group col-sm">
                          <div id="ck-editor1" class="form-control"></div>
                        </div>
                        <asp:Button ID="btn_JobDescriptionContentsReviewsPostButton" CssClass="btn btn-primary JobDescriptionContentsReviewsPostButton" runat="server" Text="Post" />
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    ClassicEditor
        .create(document.querySelector('#ck-editor1'))
        .catch(error => {
            console.error(error);
        });
</script>
</asp:Content>
