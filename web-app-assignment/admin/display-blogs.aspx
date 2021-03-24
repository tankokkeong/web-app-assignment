<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="display-blogs.aspx.cs" Inherits="web_app_assignment.admin.display_blogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/display-blogs.css" rel="stylesheet" type="text/css"/>
    <title>Blog Posts</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
  <div class="display-blogpost-container">
         <div class="blog-title">
                <h3>Blog Posts</h3>
          </div>

        <div class="blogpost-search-container">

                    <div class="blogpost-search-bar">
                        <input type="text" placeholder="Search.." name="searchpost">
                        <button type="submit" class="btn bg-lightgreen"><i class="fa fa-search"></i></button>
                    </div>
                 </div>

                    <div class="float-right mb-4 mt-1">
                         <a href="create-blogs.aspx" class="btn bg-lightgreen text-white btn-lg">New Post</a>
                    </div>

                 <div class="post-table-container">
                     <table class="table table-striped table-bordered">
                         <thead class="bg-lightgreen thead-post text-white">
                            <tr class="table-head-title">                        
                                 <th>Blog Post</th>
                                 <th>Last Update</th>
                                 <th>Action</th>
                            </tr>
                         </thead>

                         <tbody>
                            <% for (int i = 0; i <= 5 ; i++)
                               {
                            %>
                             <tr>
                                 <th class="content-blog">Blog 1</th>
                                 <th class="content-blog">2021-02-04 20:20:20</th>
                                 <th>
                                     <div class="action-icon">
                                        <a href="#" class="action-icon-link"><i class="fa fa-eye fa-lg" style="color:black" aria-hidden="true"></i></a>
                                        <a href="edit-blogs.aspx" class="action-icon-link"><i class="fas fa-edit fa-lg"  style="color:black" aria-hidden="true"></i></a>
                                        <a href="#" class="action-icon-link" data-toggle="modal" data-target="#deletePost" onclick="deleteAdmin()"><i class="fas fa-trash-alt fa-lg" style="color:black" aria-hidden="true"></i></a>
                                     </div>
                             
                                  </th>
                             </tr>
                            <% 
                               }
                            %>
                         </tbody>
                     </table>
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
            <asp:Button ID="btnDeletePost" runat="server" Text="Yes" class="btn btn-danger" />
            <asp:TextBox ID="txtDeletePost" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    </form>
  
    <script>
        function deletePost() {
            var delete_post = document.getElementById("ContentPlaceHolder1_txtDeletePost");

        }
    </script>

</asp:Content>
