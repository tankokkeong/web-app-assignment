﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class privacy_policy : System.Web.UI.Page
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
                Languages.Add("Privacy Policy", "隐私政策");
                Languages.Add("Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites.", "您的隐私对Jobs4U很重要。请仔细阅读本隐私声明，因为它构成使用条款的一部分，该条款约束Jobs4U.com服务和Jobs4U.com网站的使用。");
                Languages.Add("COLLECTION OF PERSONAL INFORMATION", "收集个人信息");
                Languages.Add("We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications", "当您选择使用任何Jobs4U.com服务和/或使用Jobs4U.com网站时，我们都会直接从您那里收集个人信息。以下是Jobs4U.com可能直接从您那里收集的个人信息的示例：-<br> i）年龄； <br> ii）出生日期； <br> iii）联系电话； <br> iv）您的形象； <br> v）学历； <br> vi）简历； <br> vii）个人兴趣和爱好； <br> viii）信用卡或借记卡详细信息； <br> ix）与求职简历相关的其他信息");
                Languages.Add("PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION", "收集和使用个人信息的目的");
                Languages.Add("The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;", "Jobs4U处理您的个人信息的目的如下：-<br> 1）验证您的身份； <br> 2）评估和/或验证您的就业能力和信誉度； <br> 3）管理和管理提供给您的Jobs4U.com服务； <br> 4）就Jobs4U.com服务与您联系； <br> 5）检测和防止欺诈活动。 <br> 6）帮助Jobs4U.com了解您在Jobs4U.com网站上的浏览偏好，以便Jobs4U.com可以相应地调整内容； <br> 7）维护和开发Jobs4U.com网站和Jobs4U.com服务； <br> 8）处理您所请求的Jobs4U.com服务的订单；");
                Languages.Add("Jobs4U.COM PROFILE", "Jobs4U.COM个人资料");
                Languages.Add("Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases.", "Jobs4U.com会尽力将访问Jobs4U.com简历数据库的权限限制为仅订阅了Jobs4U.com Services的人员，这些各方可能会在自己的文件或数据库中保留Jobs4U.com配置文件的副本。");
                Languages.Add("SECURITY OF PERSONAL INFORMATION", "个人信息的安全");
                Languages.Add("Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL).", "Jobs4U.com致力于确保个人信息的安全。 Jobs4U.com制定了适当的技术，管理和物理程序，以防止个人信息丢失，被盗和滥用，以及防止未经授权的访问，泄露，更改和破坏。在我们的付款网关服务上输入的敏感信息（例如信用卡号）在传输过程中会使用安全套接字层技术（SSL）进行加密。");
                Languages.Add("TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION", "将您的个人信息转移到您当地的司法管辖区之外");
                Languages.Add("It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers.", "如果Jobs4U.com的任何服务提供商或战略合作伙伴（“海外实体”）参与提供部分Jobs4U.com服务，包括但不包括Jobs4U.com的服务提供商或战略合作伙伴（“海外实体”），可能需要将您的个人信息转移到您当地的司法管辖区之外仅限于云服务提供商。");

                lblPrivacyPolicy1.Text = Languages["Privacy Policy"];
                lblPrivacyPolicy2.Text = Languages["Privacy Policy"];
                lblIntro.Text = Languages["Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites."];
                lblPrivacy1.Text = Languages["COLLECTION OF PERSONAL INFORMATION"];
                lblPrivacy11.Text = Languages["We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications"];
                lblPrivacy2.Text = Languages["PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION"];
                lblPrivacy21.Text = Languages["The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;"];
                lblPrivacy3.Text = Languages["Jobs4U.COM PROFILE"];
                lblPrivacy31.Text = Languages["Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases."];
                lblPrivacy4.Text = Languages["SECURITY OF PERSONAL INFORMATION"];
                lblPrivacy41.Text = Languages["Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL)."];
                lblPrivacy5.Text = Languages["TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION"];
                lblPrivacy51.Text = Languages["It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers."];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Privacy Policy", "Privacy Policy");
                Languages.Add("Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites.", "Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites.");
                Languages.Add("COLLECTION OF PERSONAL INFORMATION", "COLLECTION OF PERSONAL INFORMATION");
                Languages.Add("We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications", "We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications");
                Languages.Add("PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION", "PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION");
                Languages.Add("The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;", "The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;");
                Languages.Add("Jobs4U.COM PROFILE", "Jobs4U.COM PROFILE");
                Languages.Add("Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases.", "Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases.");
                Languages.Add("SECURITY OF PERSONAL INFORMATION", "SECURITY OF PERSONAL INFORMATION");
                Languages.Add("Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL).", "Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL).");
                Languages.Add("TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION", "TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION");
                Languages.Add("It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers.", "It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers.");

                lblPrivacyPolicy1.Text = Languages["Privacy Policy"];
                lblPrivacyPolicy2.Text = Languages["Privacy Policy"];
                lblIntro.Text = Languages["Your privacy is important to Jobs4U. Please read this Privacy Notice carefully as it forms part of the Terms of Use which govern the use of the Jobs4U.com Services and the Jobs4U.com Websites."];
                lblPrivacy1.Text = Languages["COLLECTION OF PERSONAL INFORMATION"];
                lblPrivacy11.Text = Languages["We collect personal information directly from you when you choose to engage any of the Jobs4U.com Services and/or to use the Jobs4U.com Websites. The following are examples of personal information Jobs4U.com may collect directly from you:- <br> i) Age; <br> ii) Date of birth; <br> iii) Contact number; <br> iv) Your image; <br> v) Academic qualifications; <br> vi) Resume; <br> vii) Personal interests and preferences; <br> viii) Credit card or debit card details; <br> ix) Other information associated with a resume for job applications"];
                lblPrivacy2.Text = Languages["PURPOSES OF COLLECTING AND USE OF PERSONAL INFORMATION"];
                lblPrivacy21.Text = Languages["The purposes for which Jobs4U processes your personal information are as follows:- <br> 1) To verify your identity; <br> 2) To assess and/or verify your employability and credit worthiness; <br> 3) To administer and manage the Jobs4U.com Services provided to you; <br> 4) To contact you in respect of Jobs4U.com Services; <br> 5) To detect and prevent fraudulent activity. <br> 6) To assist Jobs4U.com in understanding your browsing preferences on the Jobs4U.com Websites so that Jobs4U.com can tailor content accordingly; <br> 7) To maintain and develop the Jobs4U.com Websites and Jobs4U.com Services; <br> 8) To process your order for the Jobs4U.com Services which you have requested;"];
                lblPrivacy3.Text = Languages["Jobs4U.COM PROFILE"];
                lblPrivacy31.Text = Languages["Jobs4U.com uses its best effort to restrict access to the Jobs4U.com Resume Database only to those who have subscribed to the Jobs4U.com Services, these parties may retain a copy of your Jobs4U.com Profile in their own files or databases."];
                lblPrivacy4.Text = Languages["SECURITY OF PERSONAL INFORMATION"];
                lblPrivacy41.Text = Languages["Jobs4U.com is committed to keeping personal information secure. Jobs4U.com has appropriate technical, administrative and physical procedures in place to protect personal information from loss, theft and misuse, as well as against unauthorized access, disclosure, alteration and destruction. Sensitive information (such as a credit card number) entered on our payment gateway services are encrypted during the transmission of that information using secure socket layer technology (SSL)."];
                lblPrivacy5.Text = Languages["TRANSFER OF YOUR PERSONAL INFORMATION OUTSIDE OF YOUR LOCAL JURISDICTION"];
                lblPrivacy51.Text = Languages["It may be necessary for Jobs4U.com to transfer your personal information outside of your local jurisdiction if any of Jobs4U.com’s service providers or strategic partners (“overseas entities”) is involved in providing part of the Jobs4U.com Services, including but not limited to cloud service providers."];
            }
        }
    }
}