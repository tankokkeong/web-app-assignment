﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class blog_category_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

                SqlConnection con = new SqlConnection(strcon);

                string sql = "SELECT * FROM BlogCategory WHERE deleted_at IS NULL";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();

                GridViewCategory.DataSource = read;
                GridViewCategory.DataBind();

                read.Close();
                con.Close();
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string category = txtCategory.Text;

            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];
            SqlConnection con = new SqlConnection(strcon);

            string sqlSession = @"SELECT admin_id FROM Admin WHERE admin_email = @email";
            SqlCommand cmdSession = new SqlCommand(sqlSession, con);
            con.Open();
            cmdSession.Parameters.AddWithValue("@email", UserDetails["Admin_Email"]);
            SqlDataReader drSession = cmdSession.ExecuteReader();

            string sqlInsert = @"INSERT INTO BlogCategory(category_title,edited_by,last_updated,created_at)
                            VALUES (@title, @edited_by, @last_updated, @created_at)";


            SqlCommand cmd = new SqlCommand(sqlInsert, con);
            cmd.Parameters.AddWithValue("@title", category);
            cmd.Parameters.AddWithValue("@last_updated", DateTime.Now);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            while (drSession.Read())
            {
                cmd.Parameters.AddWithValue("@edited_by", drSession["admin_id"]);
            }
            drSession.Close();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("blog-category-management.aspx");
        }

        protected void GridViewCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                e.Row.Cells[3].Text ="<a class='badge badge-primary action-btn mr-1'  href='blog-category-edit.aspx?Id=" + e.Row.Cells[3].Text + "' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>" +
                                     "<span class='badge badge-danger action-btn' data-toggle='modal' data-target='#deleteModal' type='button' onclick='deleteCategory(" + e.Row.Cells[3].Text + ")'><i class='fas fa-trash'></i></span>";
            }
        }

        protected void btnDeleteCategory_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            try
            {

                int id = Convert.ToInt32(txtDeleteCategory.Text);

                SqlConnection con = new SqlConnection(strcon);

                //Read User profile Details
                string sql = "UPDATE BlogCategory SET deleted_at = @delete WHERE blog_category_id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                //Insert parameters
                cmd.Parameters.AddWithValue("@delete", DateTime.Now);
                cmd.Parameters.AddWithValue("@Id", id);

                //Execute the queries
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record Deleted successful!');</script>");
                Response.Redirect("blog-category-management.aspx");


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}