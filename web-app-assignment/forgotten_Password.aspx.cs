using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace web_app_assignment
{
    public partial class Forgotten_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgotPasswordFormEmailButtonSubmit_Click (object sender, EventArgs e)
        {
            //string uniqueCode = string.Empty;
            //SqlCommand cmd = new SqlCommand();
            //SqlDataReader dr;

            //try
            //{
            //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
            //    if (con.State == ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }

            //    cmd = new SqlCommand("SELECT * FROM Recruiter ")
            //}
            //catch (Exception error)
            //{
            //    Response.Write(error.Message);
            //}
        }
    }
}