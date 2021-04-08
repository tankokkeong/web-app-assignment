using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment.admin
{
    public partial class careers : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Open connection
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string sql_jobPosted = "SELECT * FROM Applicants WHERE deleted_at IS NULL " +

                                   " ORDER BY seeker_id DESC";

            SqlDataAdapter cmd = new SqlDataAdapter(sql_jobPosted, con);

            DataTable dtbl = new DataTable();
            cmd.Fill(dtbl);
            gvCareer.DataSource = dtbl;
            gvCareer.DataBind();

            //Close Connection
            con.Close();
        }

        protected void gvCareer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename="
                + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Resume/")
                + e.CommandArgument);
            Response.End();
        }
    }
}