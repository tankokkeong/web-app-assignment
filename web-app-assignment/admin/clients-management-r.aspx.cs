﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace web_app_assignment.admin
{
    public partial class clients_management_r : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        //Create Helper Class
        Helper helper = new Helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Check Valid User
            helper.checkAdminLogin();

            if (!Page.IsPostBack)
            {
                //Open connection
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_jobPosted = "SELECT * FROM Recruiter WHERE deleted_at IS NULL " +

                                       " ORDER BY recruiter_id DESC";

                SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

                DataTable dtbl = new DataTable();
                cmd.Fill(dtbl);
                GridView3.DataSource = dtbl;
                GridView3.DataBind();

                //Close Connection
                con.Close();

                //Open connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql_premium = "SELECT " +
                                        "(SELECT COUNT(* ) FROM Recruiter WHERE is_premium = 'true') AS is_premium, " +
                                        "(SELECT COUNT(* ) FROM Recruiter WHERE is_premium IS NULL) AS non_premium";

                SqlCommand command = new SqlCommand(sql_premium, con);


                SqlDataReader dread = command.ExecuteReader();

                while (dread.Read())
                {
                    lblUserPrimium.Text = dread["is_premium"].ToString();
                    lblUserNonPremium.Text = dread["non_premium"].ToString();
                }

                //Close Connection
                con.Close();

            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Dictionary<string, string> UserDetails = (Dictionary<string, string>)Session["Admin"];

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Query String
                if (UserDetails["Admin_Right"] == "Viewer")
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>";
                }
                else
                {
                    e.Row.Cells[4].Text = "<a class='badge badge-success action-btn mr-1'  href='clients-details-r.aspx?viewId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='View'><i class='fas fa-eye'></i></a>" +
                     "<a class='badge badge-primary action-btn mr-1'  href='client-edit-r.aspx?editId=" + e.Row.Cells[4].Text + "' data-toggle='tooltip' data-placement='top' title='Edit'><i class='fas fa-edit'></i></a>";
                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GridView3.DataBind();
        }

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GridView3.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Open connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql = "";

            //Retrive User value
            if (txtUserID.Text != "")
            {
                sql += " AND recruiter_id = " + txtUserID.Text;
            }

            if (txtUserEmail.Text != "")
            {
                sql += " AND email LIKE '%" + txtUserEmail.Text + "%'";
            }

            if (ddlUserStatus.SelectedValue != "")
            {
                sql += " AND active = '" + ddlUserStatus.SelectedValue + "'";
            }

            if (txtFromDate.Text != "")
            {
                sql += " AND created_at > '" + txtFromDate.Text + "'";
            }

            if (txtToDate.Text != "")
            {
                sql += " AND created_at < '" + txtToDate.Text + "'";
            }

            string sql_jobPosted = "SELECT * FROM Recruiter WHERE deleted_at IS NULL " +
                                    sql +
                                   " ORDER BY recruiter_id DESC";

            SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            GridView3.DataSource = dtbl;
            GridView3.DataBind();

            //Close Connection
            con.Close();
        }
    }
}