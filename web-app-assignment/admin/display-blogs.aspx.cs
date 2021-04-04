using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace web_app_assignment.admin
{
    public partial class display_blogs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (UserDetails["Admin_Right"] == "Viewer" || UserDetails["Admin_Right"] == "Editor")
            {
                newPost.Visible = false;
            }

            if (!this.IsPostBack)
            {
                this.SearchBlog();
            }
        }

        private void SearchBlog()
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM BlogPost WHERE deleted_at IS NULL";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " AND blog_title LIKE '%' + @blogtitle + '%' AND deleted_at IS NULL ORDER BY blog_id DESC";
                        cmd.Parameters.AddWithValue("@blogtitle", txtSearch.Text.Trim());
                    }
                    else
                    {
                        sql += " ORDER BY blog_id DESC";
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridViewBlog.DataSource = dt;
                        GridViewBlog.DataBind();
                    }
                }
            }
        
        }

        protected void GridViewBlog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[4].Text = "";
                }
                else if (UserDetails["Admin_Right"] == "Editor")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-primary action-btn mr-1'  href='edit-blogs.aspx?Id=" + e.Row.Cells[4].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                }
                else if (UserDetails["Admin_Right"] == "Super Admin")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-primary action-btn mr-1'  href='edit-blogs.aspx?Id=" + e.Row.Cells[4].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deletePost' type='button' onclick='deletePost(" + e.Row.Cells[4].Text + ")'><i class='fas fa-trash'></i></span>";
                }
            }
        }

        protected void btnDeletePost_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            try
            {
                int id = Convert.ToInt32(txtDeletePost.Text);

                SqlConnection con = new SqlConnection(strcon);

                //Read User profile Details
                string sqlDelete = "UPDATE BlogPost SET deleted_at = @delete WHERE blog_id = @Id";

                SqlCommand cmdDelete = new SqlCommand(sqlDelete, con);

                con.Open();
                //Insert parameters
                cmdDelete.Parameters.AddWithValue("@delete", DateTime.Now);
                cmdDelete.Parameters.AddWithValue("@Id", id);

                //Execute the queries
                cmdDelete.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record Deleted successful!');</script>");
                Response.Redirect("display-blogs.aspx");
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.SearchBlog();
        }

        protected void GridViewBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewBlog.PageIndex = e.NewPageIndex;
            this.SearchBlog();
        }
    }
}