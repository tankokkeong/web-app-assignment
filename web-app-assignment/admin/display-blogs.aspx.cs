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

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            try
            {
                //Open connection
                SqlConnection con = new SqlConnection(strcon);

                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    newPost.Visible = false;
                }             

                //drop down list
                string sqlList = "SELECT * FROM BlogCategory WHERE deleted_at IS NULL";
                SqlCommand cmdList = new SqlCommand(sqlList, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmdList);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlBlogCategory.DataSource = dt;
                ddlBlogCategory.DataBind();

                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_blog = "SELECT blog_id, blog_title, BP.last_updated, admin_name, BP.created_at, BC.category_title " +
                                " FROM BlogPost BP, Admin AD, BlogCategory BC " +
                                " WHERE BP.edited_by = AD.admin_id " +
                                " AND BP.blog_category_id = BC.blog_category_id " +
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
                //Retrieve Query Strings
                string blog_id = Request.QueryString["blog_id"] ?? "";
                string blog_title = Request.QueryString["blog_title"] ?? "";
                string blog_category = Request.QueryString["blog_category"] ?? "";
                string updated_by = Request.QueryString["updated_by"] ?? "";
                string from_date = Request.QueryString["from"] ?? "";
                string to_date = Request.QueryString["to"] ?? "";

                if (blog_id != "" || blog_title != "" || blog_category != "" || updated_by != "" || from_date != "" || to_date != "")
                {
                    sql += " AND";
                }

                //Check payment id query
                if (blog_id != "")
                {
                    sql += " blog_id ='" + blog_id + "'";
                }

                if (blog_title != "")
                {
                    if (blog_id != "")
                    {
                        sql += " AND blog_title LIKE '%" + blog_title + "%'";
                    }
                    else
                    {
                        sql += " blog_title LIKE '%" + blog_title + "%'";
                    }

                }

                if (blog_category != "")
                {
                    if (blog_id != "" || blog_title != "")
                    {
                        sql += " AND category_title ='" + blog_category + "'";
                    }
                    else
                    {
                        sql += " category_title ='" + blog_category + "'";
                    }

                }

                if (updated_by != "")
                {
                    if (blog_id != "" || blog_title != "" || blog_category != "")
                    {
                        sql += " AND admin_name LIKE '%" + updated_by + "%'";
                    }
                    else
                    {
                        sql += " admin_name LIKE '%" + updated_by + "%'";
                    }

                }

                if (from_date != "")
                {
                    if (blog_id != "" || blog_title != "" || blog_category != "" || updated_by != "")
                    {
                        sql += " AND BP.created_at > '" + from_date + "'";
                    }
                    else
                    {
                        sql += " BP.created_at > '" + from_date + "'";
                    }

                }

                if (to_date != "")
                {
                    if (blog_id != "" || blog_title != "" || blog_category != "" || updated_by != "" || from_date != "")
                    {
                        sql += " AND BP.created_at < '" + to_date + "'";
                    }
                    else
                    {
                        sql += " BP.created_at < '" + to_date + "'";
                    }

                }

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
                    e.Row.Cells[6].Text = "<a class='badge badge-success action-btn mr-1'  href='view-blogs.aspx?viewId=" + e.Row.Cells[6].Text + "' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else if (UserDetails["Admin_Right"] == "Super Admin" || UserDetails["Admin_Right"] == "Editor")
                {
                    e.Row.Cells[6].Text = "<a class='badge badge-success action-btn mr-1'  href='view-blogs.aspx?viewId=" + e.Row.Cells[6].Text + "' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                                     "<a class='badge badge-primary action-btn mr-1'  href='edit-blogs.aspx?editId=" + e.Row.Cells[6].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deletePost' type='button' onclick='deletePost(" + e.Row.Cells[6].Text + ")'><i class='fas fa-trash'></i></span>";
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