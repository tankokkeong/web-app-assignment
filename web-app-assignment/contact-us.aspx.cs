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
        Helper helper = new Helper();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> Languages = new Dictionary<string, string>();

            if (Session["Languages_EN"] != null)
            {
                Languages.Add("Message", "信息");
                Languages.Add("Subject", "标题");
                Languages.Add("Email", "电子邮件");
                Languages.Add("Contact Number", "联系电话");
                Languages.Add("Name", "姓名");
                Languages.Add("We'd love to hear from you.", "我们很乐意听取您的意见。");
                Languages.Add("Contact Us", "联系我们");

                lblMessage.Text = Languages["Message"];
                lblSubject.Text = Languages["Subject"];
                lblEmail.Text = Languages["Email"];
                lblContactNum.Text = Languages["Contact Number"];
                lblName.Text = Languages["Name"];
                lblWe.Text = Languages["We'd love to hear from you."];
                lblContactUs1.Text = Languages["Contact Us"];
                lblContactUs2.Text = Languages["Contact Us"];
            }
            else if (Session["Languages_CN"] != null)
            {
                Languages.Add("Message", "Message");
                Languages.Add("Subject", "Subject");
                Languages.Add("Email", "Email");
                Languages.Add("Contact Number", "Contact Number");
                Languages.Add("Name", "Name");
                Languages.Add("We'd love to hear from you.", "We'd love to hear from you.");
                Languages.Add("Contact Us", "Contact Us");

                lblMessage.Text = Languages["Message"];
                lblSubject.Text = Languages["Subject"];
                lblEmail.Text = Languages["Email"];
                lblContactNum.Text = Languages["Contact Number"];
                lblName.Text = Languages["Name"];
                lblWe.Text = Languages["We'd love to hear from you."];
                lblContactUs1.Text = Languages["Contact Us"];
                lblContactUs2.Text = Languages["Contact Us"];
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //read from contact-us textBox
                string name = txtName.Text;
                string contactNum = txtContactNum.Text;
                string email = txtEmail.Text;
                string subject = txtSubject.Text;
                string message = txtMessage.Text;

                try
                {

                    if (Session["Recruiter"] != null)
                    {
                        string recruiterID = helper.getRecruiterID();
                        SqlConnection con = new SqlConnection(strcon);

                        string sqlInsert = "INSERT INTO ContactMessage(contact_name, phone_number, company_email, subject, contact_message," +
                                     "recruiter_id, created_at) VALUES(@contact_name, @phone_number, @company_email," +
                                     "@subject, @contact_message, @recruiter_id, @created_at)";


                        //Connect to the database
                        SqlCommand cmd = new SqlCommand(sqlInsert, con);
                        con.Open();

                        //Insert parameters
                        cmd.Parameters.AddWithValue("@contact_name", name);
                        cmd.Parameters.AddWithValue("@phone_number", contactNum);
                        cmd.Parameters.AddWithValue("@company_email", email);
                        cmd.Parameters.AddWithValue("@subject", subject);
                        cmd.Parameters.AddWithValue("@contact_message", message);
                        cmd.Parameters.AddWithValue("@recruiter_id", recruiterID);
                        cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

                        //Execute the queries
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Message Sent Successful!');</script>");

                        //Clear the form
                        ClearForm();

                    }
                    else if (Session["User"] != null)
                    {
                        string seekerID = helper.getSeekerID();
                        SqlConnection con = new SqlConnection(strcon);

                        string sqlInsert2 = "INSERT INTO ContactMessage(contact_name, phone_number, company_email, subject, contact_message," +
                                     "seeker_id, created_at) VALUES(@contact_name, @phone_number, @company_email," +
                                     "@subject, @contact_message, @seeker_id, @created_at)";


                        //Connect to the database
                        SqlCommand cmd2 = new SqlCommand(sqlInsert2, con);
                        con.Open();

                        //Insert parameters
                        cmd2.Parameters.AddWithValue("@contact_name", name);
                        cmd2.Parameters.AddWithValue("@phone_number", contactNum);
                        cmd2.Parameters.AddWithValue("@company_email", email);
                        cmd2.Parameters.AddWithValue("@subject", subject);
                        cmd2.Parameters.AddWithValue("@contact_message", message);
                        cmd2.Parameters.AddWithValue("@seeker_id", seekerID);
                        cmd2.Parameters.AddWithValue("@created_at", DateTime.Now);

                        //Execute the queries
                        cmd2.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Message Sent Successful!');</script>");

                        //Clear the form
                        ClearForm();
                    }
                    else
                    {
                        SqlConnection con = new SqlConnection(strcon);

                        string sqlInsert3 = "INSERT INTO ContactMessage(contact_name, phone_number, company_email, subject, contact_message," +
                                     " created_at) VALUES(@contact_name, @phone_number, @company_email," +
                                     "@subject, @contact_message, @created_at)";

                        //Connect to the database
                        SqlCommand cmd3 = new SqlCommand(sqlInsert3, con);
                        con.Open();
                        //Insert parameters
                        cmd3.Parameters.AddWithValue("@contact_name", name);
                        cmd3.Parameters.AddWithValue("@phone_number", contactNum);
                        cmd3.Parameters.AddWithValue("@company_email", email);
                        cmd3.Parameters.AddWithValue("@subject", subject);
                        cmd3.Parameters.AddWithValue("@contact_message", message);
                        cmd3.Parameters.AddWithValue("@created_at", DateTime.Now);

                        //Execute the queries
                        cmd3.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Message Sent Successful!');</script>");

                        //Clear the form
                        ClearForm();
                    }










                }
                catch (Exception error)
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