using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class Career : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> Languages = new Dictionary<string, string>();

            var languages_selected = Request.QueryString["language"];

            if (languages_selected == "EN")
            {
                Session["Languages_EN"] = true;
                Session.Remove("Languages_CN");
            }
            else if (languages_selected == "CN")
            {
                Session["Languages_CN"] = true;
                Session.Remove("Languages_EN");
            }

            if (Session["Languages_CN"] != null)
            {
                Languages.Add("Upload Your Resume", "上传您的简历");
                Languages.Add("Specific Your current employment status", "您目前的具体就业状况");
                Languages.Add("What Position are you looking for", "您在找什么职位");
                Languages.Add("Email", "电子邮件");
                Languages.Add("Full Name", "全名");
                Languages.Add("Application Form", "申请表格");
                Languages.Add("Fill out the below for job opportunies", "填写下面的工作机会");
                Languages.Add("Our Team", "我们的队伍");
                Languages.Add("Career Center", "诚聘英才");
                Languages.Add("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.", "映获保东都秋！竹钩递谱冬庄。徐谈姓狱缚越脓培铸先坏振百嘛仪炎像她妻；颊窑突咽几彩。");

                lblUpload.Text = Languages["Upload Your Resume"];
                lblSpecific.Text = Languages["Specific Your current employment status"];
                lblWhat.Text = Languages["What Position are you looking for"];
                lblEmail.Text = Languages["Email"];
                lblFullName.Text = Languages["Full Name"];
                lblApplication.Text = Languages["Application Form"];
                lblFill.Text = Languages["Fill out the below for job opportunies"];
                lblOurTeam.Text = Languages["Our Team"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblLorem1.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem2.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem3.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem4.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem5.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Upload Your Resume", "Upload Your Resume");
                Languages.Add("Specific Your current employment status", "Specific Your current employment status");
                Languages.Add("What Position are you looking for", "What Position are you looking for");
                Languages.Add("Email", "Email");
                Languages.Add("Full Name", "Full Name");
                Languages.Add("Application Form", "Application Form");
                Languages.Add("Fill out the below for job opportunies", "Fill out the below for job opportunies");
                Languages.Add("Our Team", "Our Team");
                Languages.Add("Career Center", "Career Center");
                Languages.Add("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.");

                lblUpload.Text = Languages["Upload Your Resume"];
                lblSpecific.Text = Languages["Specific Your current employment status"];
                lblWhat.Text = Languages["What Position are you looking for"];
                lblEmail.Text = Languages["Email"];
                lblFullName.Text = Languages["Full Name"];
                lblApplication.Text = Languages["Application Form"];
                lblFill.Text = Languages["Fill out the below for job opportunies"];
                lblOurTeam.Text = Languages["Our Team"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblLorem1.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem2.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem3.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem4.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
                lblLorem5.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, aliquet sit amet elementum vel, vehicula eget eros. Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent.Vivamus arcu metus, mattis sed sagittis at, sagittis quis neque. Praesent."];
            }
        }
    }
}