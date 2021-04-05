<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog-explore.aspx.cs" Inherits="web_app_assignment.blog_explore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog-Explore</title>
    <link href="style/blog-explore.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="common-list-container">
                <br />
                <div class="col-6">
                    <asp:Literal ID="litResultHeader" runat="server"></asp:Literal>
               </div>
                <div class="row">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>

                           <div class='col-sm-12 col-md-6 col-lg-4 mt-3'>
                             <a href='blog_description.aspx?blog=<%#Eval("blog_id") %>' style='text-decoration: none;'>
                              <div class='card' style='width: 100%;'>
                                   <img src='../<%#Eval("blog_image") %>' style='width:100%; height:300px' class='card-img-top' alt='...'>
                                <div class='card-body text-center'>
                                   <p class='card-text font-weight-bold'><%#Eval("blog_title") %></p> 
                                    <p class='card-text font-weight-bold'><%#Eval("blog_description") %></p> 
                                </div>

                                <div class='card-footer text-muted text-center'>
                                    <p class='text-muted text-center'><%#Eval("last_updated") %></p>
                                </div>
                              </div>
                             </a>
                           </div>
                             <br/>
                        </ItemTemplate>
                    </asp:ListView>
                    <%-- 
                    <div class="col-sm-12 col-md-6 col-lg-4 mt-3">
                        <div class="card" style="width: 100%;">
                          <img src="https://jobmajestic.com/blog/media/2021/02/3-Tips-for-Building-Employee-Engagement-Right-Now-Featured-Image-1-768x512.jpg" class="card-img-top" alt="...">
                          <div class="card-body text-center">
                            <p class="card-text font-weight-bold">3 Tips for Building Employee Engagement Right Now.</p>
                         </div>

                            <div class="card-footer text-muted text-center">
                                17 March 2021
                            </div>
                        </div>
                    </div> 
                        --%>
                </div>

                <br />
                <div class="pagination-container text-center">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="6" class="pagination mt-3 mb-3 text-center" OnPreRender="DataPager1_PreRender">
                        <Fields >
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="page-link page-item"/>
                            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="page-link page-item" CurrentPageLabelCssClass="page-link page-active" NextPreviousButtonCssClass="page-link page-item"/>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="false" ShowLastPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="true" ButtonCssClass="page-link page-item" />
                        </Fields>
                    </asp:DataPager>
                </div>
                
            </div>
            <br />
        </div>
</asp:Content>
