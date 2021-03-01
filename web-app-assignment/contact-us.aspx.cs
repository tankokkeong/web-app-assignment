using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace web_app_assignment
{
    public partial class contact_us : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                //read from contact-us textBox
                string name = txtName.Text;
                string contactNum = txtContactNum.Text;
                string email = txtEmail.Text;
                string subject = txtSubject.Text;
                string message = txtMessage.Text;

                try 
                {
                    SqlConnection con = new SqlConnection(strcon);

                    con.Open();
                    string sql = "INSERT INTO ContactMessage(contact_name, phone_number, company_email, subject, contact_message, visitor_id," +
                                 "seeker_id, recruiter_id, replied_by, replied_date, created_at) VALUES(@contact_name, @phone_number, @company_email," +
                                 "@subject, @contact_message, @visitor_id, @seeker_id, @recruiter_id, @replied_by, @replied_date, @created_at)";

                    //Connect to the database
                    SqlCommand cmd = new SqlCommand(sql, con);

                    //Insert parameters
                    cmd.Parameters.AddWithValue("@contact_name", name);
                    cmd.Parameters.AddWithValue("@phone_number", contactNum);
                    cmd.Parameters.AddWithValue("@company_email", email);
                    cmd.Parameters.AddWithValue("@subject", subject);
                    cmd.Parameters.AddWithValue("@contact_message", message);
                    cmd.Parameters.AddWithValue("@visitor_id",1);
                    cmd.Parameters.AddWithValue("@seeker_id",2);
                    cmd.Parameters.AddWithValue("@recruiter_id",2);
                    cmd.Parameters.AddWithValue("@replied_by",2);
                    cmd.Parameters.AddWithValue("@replied_date",DateTime.Now);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                    //Execute the queries
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Message Sent Successful!');</script>");

                    //Clear the form
                    ClearForm();


                }
                catch(Exception error)
                {
                    lblError.Text = error.Message;
                }


            }
            else
            {
                lblError.Text = "FAILED";
            }

        }

        protected void ClearForm()
        {
            txtName.Text = "";
            txtContactNum.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";

        }
    }
}