<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="blog-category-management.aspx.cs" Inherits="web_app_assignment.blog_category_management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/blog-category-management.css" rel="stylesheet" type="text/css"/>
    <title>Blog Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
 <div class="display-blogpost-container">
         <div class="float-right mb-4 mt-1">
             <a href="#" class="btn bg-lightgreen text-white btn-lg"  data-toggle="modal" data-target="#addCategory">New Category</a>
         </div>
         <div class="blog-title">
                <h3>Blog Category</h3>
          </div>

                <div class="post-table-container">
                <asp:GridView ID="GridViewCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridViewCategory_RowDataBound" CssClass="table table-striped table-bordered" >
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke"/>
                    <Columns>
                        <asp:BoundField runat="server" DataField="blog_category_id" HeaderText="Category ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="category_title" HeaderText="Category Title" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="last_updated" HeaderText="Last Updated" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="blog_category_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                </div>
            <%-- 
                 <div class="post-table-container">
                     <table class="table table-striped table-bordered">
                         <thead class="bg-lightgreen thead-post text-white">
                            <tr class="table-head-title">                        
                                 <th>Category</th>
                                 <th>Created at</th>
                                 <th>Action</th>
                            </tr>
                         </thead>

                         <tbody>
                             <tr>
                                 <th class="content-blog">Career</th>
                                 <th class="content-blog">2021-02-04 20:20:20</th>
                                 <th>
                                     <div class="action-icon">
                                        <a href="#" class="action-icon-link"><i class="fa fa-eye fa-lg" style="color:black" aria-hidden="true"></i></a>
                                        <a href="edit-blogs.aspx" class="action-icon-link" data-toggle="modal" data-target="#updateCategory"><i class="fas fa-edit fa-lg"  style="color:black" aria-hidden="true"></i></a>
                                        <a href="#" class="action-icon-link" data-toggle="modal" data-target="#deleteCategory" onclick="deleteCategory()"><i class="fas fa-trash-alt fa-lg" style="color:black" aria-hidden="true"></i></a>
                                     </div>
                             
                                  </th>
                             </tr>
                         </tbody>
                     </table>
                 </div>
              --%>
    </div>

 <!-- New Post Modal -->
    <div class="modal fade" id="addCategory" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Add New Admin</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                 <div class="form-group row">
                     <div class="col-sm-10">
                     <asp:Label ID="lblCategory" runat="server" Text="Blogs Category"></asp:Label>
                     <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                    <%--<label for="staticEmail" class="col-sm-2 col-form-label">Admin Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" placeholder="email@example.com">--%>
                     </div>
                 </div>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <asp:Button ID="btnAddCategory" runat="server" Text="Add" class="btn btn-primary" OnClick="btnAddCategory_Click" />
           <%--<button type="button" class="btn btn-primary">Add</button>--%>
          </div>
        </div>
      </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Are you sure you want to delete this category record?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <asp:Button ID="btnDeleteCategory" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnDeleteCategory_Click"/>
            <asp:TextBox ID="txtDeleteCategory" runat="server" style="display:none;"></asp:TextBox>
          </div>
        </div>
      </div>
    </div>

    </form>
  
    <script>
        function deleteCategory(id) {
            var delete_category = document.getElementById("ContentPlaceHolder1_txtDeleteCategory");

            //Change the id
            delete_category.value = id;
        }
    </script>
</asp:Content>
