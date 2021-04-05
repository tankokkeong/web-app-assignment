<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="web_app_assignment.blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Blog</title>

    <%-- CSS --%>
    <link href="style/blog.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="blog-container">
        <div class="blog-category latest-category">
            <div class="row">
                <div class="col-sm-12 col-lg-6">
                    <div class="left-latest">
                        <div class="left-thumbnail-container">
                            <img src="https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg" id="latest-thumbnail"/>
                        </div>
                        
                        <div class="left-latest-title mt-3">
                            <h2>毕业生自我推荐(Elevator Pitch)讲稿指南 (附上5个贴士)</h2>
                        </div>

                    </div>
                </div>

                <div class="col-sm-12 col-lg-6">
                    <div class="right-latest">
                        <div class="right-latest-title">
                            <h3>Latest</h3>
                        </div>
                    
                        <div class="right-latest-list">
                            <asp:Literal ID="litResultLatest" runat="server"></asp:Literal>
                           <%-- 
                            <%for (int i = 0; i < 3; i++)
                                { %>
                            <div class="latest-list-container">
                                <div class="row latest-list-row">
                                    <div class="col-5 ">
                                        <div class="list-thumbnail">
                                             <img src="https://jobmajestic.com/blog/media/2021/03/Cover-Ultimate-Elevator-Pitch-CH-768x512.jpg" class="list-thumbnail-pic"/>
                                        </div>
                                    </div>
                      
                                    <div class="col-7 ">
                                        <div class="latest-list-title">
                                            <h5>The Ultimate Elevator Pitch for Fresh Graduates	</h5>
                                        </div>
                    
                                        <div class="latest-list-description">
                                            <h6 class="text-secondary">What is an elevator pitch? Why is it important for</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}; %>
                          --%>
                        </div>
                    
                    </div>
                
                </div>

            </div>

        </div>
     </div>
        
    <asp:Literal ID="litResultBlog" runat="server"></asp:Literal>   

</asp:Content>
