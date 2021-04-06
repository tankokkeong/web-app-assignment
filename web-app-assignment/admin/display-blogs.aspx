<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="display-blogs.aspx.cs" Inherits="web_app_assignment.admin.display_blogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/display-blogs.css" rel="stylesheet" type="text/css" />
    <title>Blog Posts</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Change navbar active --%>
    <script>
        $(document).ready(function () {
            navbarActive();

            //Add active to blog management
            live_chat = nav_option[4];
            $(live_chat).addClass("active");

            //Remove active from dashboard
            dashboard = nav_option[0];
            $(dashboard).removeClass("active");
        });
    </script>

    <form runat="server">
        <div class="display-blogpost-container">
            <div class="blog-title">
                <h3>Blog Posts</h3>
            </div>           

            <div class="blog-filter mt-3 mb-3">
                <div class="row">
                    <div class="filter-title col-lg-1 font-weight-bold">
                        Filters:
                    </div>

                    <div class="col-lg-11">
                        <div class="row">
                            <div class="col-sm-12 col-lg-3 blog-filter-container">
                                <input class="form-control" type="number" placeholder="Blog ID" id="blog-id"/>
                            </div>

                            <div class="col-sm-12 col-lg-3 blog-filter-container">
                                <input class="form-control" type="text" placeholder="Blog Title" id="blog-title"/>
                            </div>

                            <div class="col-sm-12 col-lg-3 blog-filter-container">
                                <asp:DropDownList ID="ddlBlogCategory" runat="server" class="form-control"
                                    AppendDataBoundItems="true" DataTextField="category_title" DataValueField="category_title">
                                    <asp:ListItem Value="">Blog Category</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-sm-12 col-lg-3 blog-filter-container">
                                <input class="form-control" type="text" placeholder="Updated By" id="blog-updated-by"/>
                            </div>
                                               
                        </div>

                        <div class="row">
                            <div class="col-sm-12 col-lg-2 blog-filter-container">     
                                <span class="pl-1">From :</span> <input class="form-control" type="date" id="blog-from-date"/>
                            </div>
                            

                            <div class="col-sm-12 col-lg-2 blog-filter-container">
                                <span class="pl-1">To:</span> <input class="form-control" type="date" id="blog-to-date"/>
                            </div>
                        </div>
                    
                        <div class="row mt-2">
                            <div class="col">
                                <button class="btn btn-info" onclick="paymentFilter()" type="button">Search</button>
                                <button class="btn btn-danger" type="button" onclick="clearFilters()">Clear</button>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-4 mt-1 row">
                <div class="col float-right">
                    <a href="create-blogs.aspx" id="newPost" runat="server" class="btn bg-lightgreen text-white float-right">New Post</a>
                </div>                
            </div>

            <div class="table-container">
                <asp:GridView ID="gvBlog" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridViewBlog_RowDataBound" 
                    CssClass="table table-striped table-bordered" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridViewBlog_PageIndexChanging" 
                    EmptyDataText="No Data Found">
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" Width="600px" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="blog_id" HeaderText="Blog ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="blog_title" HeaderText="Blog Title" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="category_title" HeaderText="Category Title" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="300px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="last_updated" HeaderText="Last Updated" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="admin_name" HeaderText="Updated By" HeaderStyle-CssClass="bg-lightgreen text-light" ControlStyle-Width="250px" ControlStyle-Height="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="created_at" HeaderText="Date Published" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="250px"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="blog_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light" HeaderStyle-Width="200px"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Delete Modal -->
        <div class="modal fade" id="deletePost" tabindex="-1" aria-labelledby="deletePostLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="examplePostLabel">Delete Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">Are you sure you want to delete this post?</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnDeletePost" runat="server" Text="Yes" class="btn btn-danger" OnClick="btnDeletePost_Click" />
                        <asp:TextBox ID="txtDeletePost" runat="server" Style="display: none;"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script>
        function deletePost(id) {
            var delete_post = document.getElementById("ContentPlaceHolder1_txtDeletePost");

            delete_post.value = id
        }

        function paymentFilter() {
            //Retrive User input
            var blog_id = document.getElementById("blog-id").value;
            var blog_title = document.getElementById("blog-title").value;
            var blog_category = document.getElementById("ContentPlaceHolder1_ddlBlogCategory").value;
            var updated_by = document.getElementById("blog-updated-by").value;
            var blog_from_date = document.getElementById("blog-from-date").value;
            var blog_to_date = document.getElementById("blog-to-date").value;

            //Generate searching query string

            window.location.href = "display-blogs.aspx?blog_id=" + blog_id + "&blog_title=" + blog_title +
                "&blog_category=" + blog_category + "&updated_by=" + updated_by + "&from=" + blog_from_date + "&to=" + blog_to_date;
        }

        function filterSticky() {

            //User input
            var blog_id = document.getElementById("blog-id");
            var blog_title = document.getElementById("blog-title");
            var blog_category = document.getElementById("ContentPlaceHolder1_ddlBlogCategory");
            var updated_by = document.getElementById("blog-updated-by");
            var blog_from_date = document.getElementById("blog-from-date");
            var blog_to_date = document.getElementById("blog-to-date");

            var query = window.location.href.split("?")[1].split("&");

            //Place the sticky values
            blog_id.value = unescape(query[0].split("=")[1].replace("+", " "));
            blog_title.value = unescape(query[1].split("=")[1].replace("+", " "));
            blog_category.value = unescape(query[2].split("=")[1]).replace("+", " ");
            updated_by.value = unescape(query[3].split("=")[1]).replace("+", " ");
            blog_from_date.value = query[4].split("=")[1].replace("+", " ");
            blog_to_date.value = query[5].split("=")[1].replace("+", " ");

            console.log(query[0].split("=")[1])
        }

        function clearFilters() {
            window.location.href = "display-blogs.aspx";
        }

        //Call sticky form function
        filterSticky();
    </script>

</asp:Content>
