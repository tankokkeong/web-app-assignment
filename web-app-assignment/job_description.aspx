<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="job_description.aspx.cs" Inherits="web_app_assignment.job_description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Description</title>
    <link href="style/job_description.css" rel="stylesheet" type="text/css"/>

    <%-- CK EDITOR --%>
    <script src="https://cdn.ckeditor.com/4.16.0/full-all/ckeditor.js"></script>

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
            <div class="JobDescriptionContentsReviews" runat="server"  id="divReview">
                <div>
                    <div class="user-review-container">
                        <div class="user-review-title">
                            <h4>Job Reviews(<asp:Label ID="lblJobReviewCount" runat="server" Text=""></asp:Label>)</h4>
                        </div>

                        <div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none;" id="success-review">
                          Thanks for your review!
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="user-rating-board" runat="server" id="divUserRatingBoard">
                            <asp:Literal ID="ltrUserRatingBoard" runat="server"></asp:Literal>
                            <%--<div class="total-rating">
                                <h5>Job Rating: 3.8 <i class="fas fa-star text-warning"></i></h5>
                            </div>

                            <div class="row mt-3">
                                <div class="col-lg-2 text-center">
                                    5 stars
                                </div>

                                <div class="col-lg-8">
                                    <div class="progress">
                                      <div class="progress-bar bg-success" role="progressbar" style="width:50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center">
                                    15
                                </div>
                            </div>

                             <div class="row mt-3">
                                <div class="col-lg-2 text-center">
                                    4 stars
                                </div>

                                <div class="col-lg-8">
                                    <div class="progress">
                                      <div class="progress-bar four-star-bg" role="progressbar" style="width:30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center">
                                    15
                                </div>
                            </div>

                             <div class="row mt-3">
                                <div class="col-lg-2 text-center">
                                    3 stars
                                </div>

                                <div class="col-lg-8">
                                    <div class="progress">
                                      <div class="progress-bar bg-warning" role="progressbar" style="width:10%;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center">
                                    15
                                </div>
                            </div>

                             <div class="row mt-3">
                                <div class="col-lg-2 text-center">
                                    2 stars
                                </div>

                                <div class="col-lg-8">
                                    <div class="progress">
                                      <div class="progress-bar two-star-bg" role="progressbar" style="width:7%;" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center">
                                    15
                                </div>
                            </div>

                             <div class="row mt-3">
                                <div class="col-lg-2 text-center">
                                    1 stars
                                </div>

                                <div class="col-lg-8">
                                    <div class="progress">
                                      <div class="progress-bar bg-danger" role="progressbar" style="width:7%;" aria-valuenow="3" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center">
                                    15
                                </div>
                            </div>--%>
                                                       
                        </div>

                        <div class="user-review-display">
                            <asp:ListView ID="lvJobReview" runat="server">
                                <ItemTemplate>
                                    <div class="user-review-list">
                                        <div class="user-review-info row">
                                            <div class="col">
                                                <img src="<%#Eval("user_photo") %>" class="user-review-img rounded"/>                      

                                                <div class="user-rating-review ml-2">
                                                    <h5 class=""><%#Eval("full_name") %></h5>
                                                    <i class="fas fa-star text-warning"></i>
                                                    <i class="fas fa-star <%# Convert.ToInt32(Eval("rating").ToString().Substring(0,1)) > 1 ? "text-warning" : "" %> "></i>
                                                    <i class="fas fa-star <%# Convert.ToInt32(Eval("rating").ToString().Substring(0,1)) > 2 ? "text-warning" : "" %>"></i>
                                                    <i class="fas fa-star <%# Convert.ToInt32(Eval("rating").ToString().Substring(0,1)) > 3 ? "text-warning" : "" %>"></i>
                                                    <i class="fas fa-star <%# Convert.ToInt32(Eval("rating").ToString().Substring(0,1)) > 4 ? "text-warning" : "" %>"></i>
                                                </div>
                                        
                                            </div>

                                            <div class="col">
                                                <div class="review-date float-right text-secondary">
                                                    <%#Eval("review_date") %>
                                                </div>
                                            </div>
                                    
                                        </div>

                                        <div class="user-review-content mt-3 pb-3">
                                            <%#Eval("review_content") %>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>

                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvJobReview" PageSize="5" class="pagination mt-3" OnPreRender="DataPager1_PreRender">
                                <Fields >
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="page-link page-item"/>
                                    <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="page-link page-item" CurrentPageLabelCssClass="page-link page-active" NextPreviousButtonCssClass="page-link page-item"/>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="true" ButtonCssClass="page-link page-item" />
                                </Fields>
                            </asp:DataPager>

                        </div>
                    </div>

                    <div runat="server" id="divReviewInput" visible="false">
                        <div class="JobDescriptionContentsReviewsHeader row mt-3" >
                            <h4 class="ml-4 col-sm">Your Review</h4>
                            <div class="ml-4 form-group rating col-sm"> 
                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" class="star-rate" value="5" onclick="userStarRating(5)"/>
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" class="star-rate" value="4" onclick="userStarRating(4)"/>
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" class="star-rate" value="3" onclick="userStarRating(3)"/>
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" class="star-rate" value="2" onclick="userStarRating(2)"/>
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" class="star-rate" value="1" onclick="userStarRating(1)"/>
                                    <label for="star1" title="text">1 star</label>
                                    <asp:TextBox ID="txtStarRating" runat="server" style="display:none;"></asp:TextBox>              
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Rating is required!" ControlToValidate="txtStarRating" CssClass="text-danger" style="position:relative; top:15px; right:5px;"></asp:RequiredFieldValidator>
                                 </div>                                 
                                  
                            </div>
                        </div>
                        <div class="form-group col-sm">
                            <textarea id="job_review_editor"></textarea>
                            <asp:TextBox ID="txtUserReview" runat="server" style="display:none;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Review message is required!" ControlToValidate="txtUserReview" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btnPostReview" runat="server" Text="Post" class="btn btn-primary" OnClick="btnPostReview_Click"/>
                        </div>
                    </div>
                      
                </div>
            </div>
        </div>
    </div>

<script>
    function checkReviewSuccess() {
        review_alert = document.getElementById("success-review");
        link = window.location.href.split("&");

        if (link[1] === "reviewSuccess") {
            review_alert.style.display = "";
        }

        console.log("hi")
    }

    //Check review success every time the page is refreshed
    checkReviewSuccess();
</script>

<script type="text/javascript">
    editor = CKEDITOR.replace('job_review_editor');
    review_input = document.getElementById("ContentPlaceHolder1_txtUserReview");

    // editor is object of your CKEDITOR
    editor.on('change', function () {
        review_input.value = window.escape(CKEDITOR.instances.job_review_editor.getData());
        console.log(review_input.value)
    });

    function userStarRating(value) {
        rating_input = document.getElementById("ContentPlaceHolder1_txtStarRating");

        //star rating
        rating_input.value = value;
        console.log(rating_input.value)
    }
</script>
</asp:Content>
