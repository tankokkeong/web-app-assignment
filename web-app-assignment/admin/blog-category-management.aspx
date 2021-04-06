<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="blog-category-management.aspx.cs" Inherits="web_app_assignment.blog_category_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/blog-category-management.css" rel="stylesheet" type="text/css" />
    <title>Blog Category</title>
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

            <div class="float-right mb-4 mt-1">
                <a href="blog-category-create.aspx" id="newCat" runat="server" class="btn bg-lightgreen text-white btn-lg">New Category</a>
            </div>
            <div class="blog-title">
                <h3>Blog Category</h3>
            </div>

            <div class="post-table-container">
                <asp:GridView ID="GridViewCategory" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridViewCategory_RowDataBound" CssClass="table table-striped table-bordered">
                    <HeaderStyle CssClass="table table-striped table-bordered" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField runat="server" DataField="blog_category_id" HeaderText="Category ID" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="category_title" HeaderText="Category Title" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="last_updated" HeaderText="Last Updated" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                        <asp:BoundField runat="server" DataField="blog_category_id" HeaderText="Action" HeaderStyle-CssClass="bg-lightgreen text-light"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Delete Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">Are you sure you want to delete this category record?</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnDeleteCategory" runat="server" Text="Yes" class="btn btn-danger" OnClick="btnDeleteCategory_Click" />
                        <asp:TextBox ID="txtDeleteCategory" runat="server" Style="display: none;"></asp:TextBox>
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
