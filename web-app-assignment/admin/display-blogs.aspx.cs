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
            try
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    newPost.Visible = false;
                }

                //Open connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_blog = "SELECT blog_id, blog_title, last_updated, admin_name, BP.created_at " +
                                " FROM BlogPost BP, Admin AD " +
                                " WHERE BP.edited_by = AD.admin_id " +
                                " AND BP.deleted_at IS NULL" + SearchBlogQuery() +  " ORDER BY blog_id DESC";

                SqlDataAdapter cmd = new SqlDataAdapter(sql_blog, con);

                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                gvBlog.DataSource = dtbl;
                gvBlog.DataBind();

                //Close Connection
                con.Close();
            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
           
        }

        protected string SearchBlogQuery()
        {
            string sql = "";

            try
            {

            }
            catch(Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }

            return sql;

        }

        protected void GridViewBlog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[5].Text = "";
                }
                else if (UserDetails["Admin_Right"] == "Super Admin" || UserDetails["Admin_Right"] == "Editor")
                {
                    e.Row.Cells[5].Text = "<a class='badge badge-primary action-btn mr-1'  href='edit-blogs.aspx?Id=" + e.Row.Cells[4].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
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

        protected void GridViewBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            gvBlog.DataBind();
        }
    }
}