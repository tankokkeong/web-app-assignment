﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment.admin
{
    public partial class client_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
            Dictionary<string, string> UserDetail = (Dictionary<string, string>)Session["User"];

            if (!Page.IsPostBack)
            {
                bool found = false;
                string id = Request.QueryString["editId"] ?? "";

                string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @id AND deleted_at IS NULL";

                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtID.Text = (dr["seeker_id"].ToString());
                    txtEmail.Text = (string)dr["email"];
                    listStatus.Text = (string)dr["active"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("clients-management.aspx");
                }
            }
        }
        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
            Dictionary<string, string> UserDetail = (Dictionary<string, string>)Session["User"];

            SqlConnection con = new SqlConnection(strcon);
            string id = Request.QueryString["editId"] ?? "";
            string email = txtEmail.Text;
            string active = listStatus.Text;

            string sql = @"SELECT seeker_id FROM JobSeeker WHERE email = @email AND deleted_at IS NULL";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader dr = cmd.ExecuteReader();

            string sqlEdit = @"UPDATE JobSeeker SET email = @email, active = @active WHERE seeker_id = @id2";

            SqlCommand cmdEdit = new SqlCommand(sqlEdit, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmdEdit.Parameters.AddWithValue("@email", email);
            cmdEdit.Parameters.AddWithValue("@active", active);

            while (dr.Read())
            {
                cmdEdit.Parameters.AddWithValue("@id2", id);
            }

            dr.Close();
            cmdEdit.ExecuteNonQuery();
            con.Close();

            Response.Redirect("clients-management.aspx");
        }
    }
}