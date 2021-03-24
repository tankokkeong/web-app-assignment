<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog-explore.aspx.cs" Inherits="web_app_assignment.blog_explore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog-Explore</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="common-list-container">
                <div class="row">
                    
                    <%for (int i = 0; i < 12; i++)
                        { %>
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
                    <%}; %>
                </div>
            </div>
        </div>
</asp:Content>
