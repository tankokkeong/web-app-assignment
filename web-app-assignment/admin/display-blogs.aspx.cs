﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class display_blogs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT * FROM BlogPost WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();

                GridViewBlog.DataSource = read;
                GridViewBlog.DataBind();

                read.Close();
                con.Close();
            }
        }

        protected void GridViewBlog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                e.Row.Cells[4].Text = "<a class='badge badge-primary action-btn mr-1'  href='edit-blogs.aspx?Id=" + e.Row.Cells[4].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deletePost' type='button' onclick='deletePost(" + e.Row.Cells[4].Text + ")'><i class='fas fa-trash'></i></span>";
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
    }
}