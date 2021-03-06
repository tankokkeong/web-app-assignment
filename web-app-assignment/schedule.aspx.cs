using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class schedule : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Get Seeker ID
                string seeker_id = Request.QueryString["seeker"] ?? "";

                SqlConnection con = new SqlConnection(strcon);

                //Open Database Connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sql = "SELECT * FROM JobSeeker WHERE seeker_id = @seeker_id";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@seeker_id", seeker_id);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    txtMeetingAttendees.Text = dr["contact_email"].ToString();
                }

                con.Close();


            }
            catch (Exception error)
            {
                Response.Write("<script>alert('" + error.Message + "');</script>");
            }
        }
    }
}