using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace web_app_assignment
{

    public partial class Reset_Password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = Session["seeker_verify_key"].ToString();
           
        }

        protected void forgotPasswordFormEmailButtonSubmit_Click(object sender, EventArgs e)
        {
            string key = Session["seeker_verify_key"].ToString();

            SqlConnection con = new SqlConnection(strcon);

            string query = "SELECT COUNT(*) FROM JobSeeker WHERE verify_key = @verify_key";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            cmd.Parameters.AddWithValue("@verify_key", key);
            string output = cmd.ExecuteScalar().ToString();

            if(output == "1")
            {
                SqlConnection conn = new SqlConnection(strcon);

                string qry = "UPDATE JobSeeker SET password = @password";

                SqlCommand command = new SqlCommand(qry, conn);

                conn.Open();

                command.Parameters.AddWithValue("@verify_key", new_password.Text);

                command.ExecuteNonQuery();

                conn.Close();             
            }
            con.Close();

        }
    }
}