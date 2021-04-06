using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class help : System.Web.UI.Page
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
                Languages.Add("Hi! How Can We Help?", "你好！我们能帮你什么吗？");
                Languages.Add("Frequent Asked Questions", "常问问题");
                Languages.Add("Q1. Sign Up", "Q1. 登记");
                Languages.Add("1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information.", "1. 点击“登录”按钮 <br> 2. 选择“登记”，选择您的角色并填写您的个​​人信息。");
                Languages.Add("Q2. Search for a Job", "Q2. 寻找工作");
                Languages.Add("Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization.", "探索‘职位’页面。在搜索框中按职位，公司，位置，职位类型和专业类别键入关键字。");
                Languages.Add("Q3. Update my profile", "Q3. 更新个人资料");
                Languages.Add("To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button.", "更新个人资料<br> 1. 点击‘用户资料’。<br> 2. 进行必要的更改后，单击‘Update’按钮。");
                Languages.Add("Q4. Forgot Password", "Q4. 忘记密码");
                Languages.Add("Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!", "点击‘Forgot Your Password ?’在我们的“登录”页面上，您的新密码将很快通过电子邮件发送给您！如果您没有在收件箱中收到电子邮件，请检查您的垃圾邮件文件夹！");
                Languages.Add("Q5. Want to know more about us?", "Q5. 想知道更多关于我们？");
                Languages.Add("1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible.", "1. 可以浏览我们的‘关于我们’。 <br> 2. 请随时通过‘联系我们’页面表单给我们留言。我们会尽快与您联系。");
                Languages.Add("Q6. What are the payment methods accepted by Jobs4U?", "Q6. Jobs4U接受哪些付款方式？");
                Languages.Add("We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card.", "我们接受以下付款方式：<br> Google Pay，PayPal和信用卡/借记卡。");

                lblHi.Text = Languages["Hi! How Can We Help?"];
                lblFrequent.Text = Languages["Frequent Asked Questions"];
                lblQ1.Text = Languages["Q1. Sign Up"];
                lblA1.Text = Languages["1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information."];
                lblQ2.Text = Languages["Q2. Search for a Job"];
                lblA2.Text = Languages["Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization."];
                lblQ3.Text = Languages["Q3. Update my profile"];
                lblA3.Text = Languages["To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button."];
                lblQ4.Text = Languages["Q4. Forgot Password"];
                lblA4.Text = Languages["Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!"];
                lblQ5.Text = Languages["Q5. Want to know more about us?"];
                lblA5.Text = Languages["1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible."];
                lblQ6.Text = Languages["Q6. What are the payment methods accepted by Jobs4U?"];
                lblA6.Text = Languages["We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card."];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Hi! How Can We Help?", "Hi! How Can We Help?");
                Languages.Add("Frequent Asked Questions", "Frequent Asked Questions");
                Languages.Add("Q1. Sign Up", "Q1. Sign Up");
                Languages.Add("1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information.", "1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information.");
                Languages.Add("Q2. Search for a Job", "Q2. Search for a Job");
                Languages.Add("Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization.", "Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization.");
                Languages.Add("Q3. Update my profile", "Q3. Update my profile");
                Languages.Add("To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button.", "To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button.");
                Languages.Add("Q4. Forgot Password", "Q4. Forgot Password");
                Languages.Add("Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!", "Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!");
                Languages.Add("Q5. Want to know more about us?", "Q5. Want to know more about us?");
                Languages.Add("1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible.", "1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible.");
                Languages.Add("Q6. What are the payment methods accepted by Jobs4U?", "Q6. What are the payment methods accepted by Jobs4U?");
                Languages.Add("We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card.", "We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card.");

                lblHi.Text = Languages["Hi! How Can We Help?"];
                lblFrequent.Text = Languages["Frequent Asked Questions"];
                lblQ1.Text = Languages["Q1. Sign Up"];
                lblA1.Text = Languages["1. Click on the 'Sign In' button <br> 2. Choose 'Sign Up', select your role & fill in your personal information."];
                lblQ2.Text = Languages["Q2. Search for a Job"];
                lblA2.Text = Languages["Explore the 'Jobs' page. Type in the keywords in the search box by Job Title, Company, Location, Job Type & Specialization."];
                lblQ3.Text = Languages["Q3. Update my profile"];
                lblA3.Text = Languages["To update your profile <br> 1. Click on the 'User Profile'.<br> 2. After you have made the necessary changes, click on the ‘Update’ button."];
                lblQ4.Text = Languages["Q4. Forgot Password"];
                lblA4.Text = Languages["Click on 'Forgot Your Password ?' on our 'Login' PAGE and your new password will be sent to you via email shortly! If you did not received the email at your inbox, kindly check your junk mail folder!"];
                lblQ5.Text = Languages["Q5. Want to know more about us?"];
                lblA5.Text = Languages["1. Can explore our 'About Us'. <br> 2. Please feel free to drop us a message via our Contact Us Page form. We'll get back to you as soon as possible."];
                lblQ6.Text = Languages["Q6. What are the payment methods accepted by Jobs4U?"];
                lblA6.Text = Languages["We accept the following payment methods: <br> Google Pay, PayPal & Credit/Debit Card."];
            }
        }
    }
}