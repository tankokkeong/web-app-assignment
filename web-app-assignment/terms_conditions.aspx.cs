using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class terms_conditions : System.Web.UI.Page
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
                Languages.Add("Terms & Conditions", "条款及细则");
                Languages.Add("When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone", "当您注册使用Jobs4U.com网站时，将要求您创建密码。为了防止欺诈，您必须对此密码保持机密，并且不得泄露或与任何人共享");
                Languages.Add("If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account.", "如果Jobs4U.com有理由相信可能会违反安全性或滥用Jobs4U.com网站，则我们可能会要求您更改密码或暂停您的帐户。");
                Languages.Add("Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights.", "Jobs4U.com网站和Jobs4U.com内容受版权，商标，数据库权和其他知识产权的保护。");
                Languages.Add("3. Intellectual Property", "3. 知识产权");
                Languages.Add("2. Password and Security", "2. 密码和安全性");
                Languages.Add("In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent.", "如果这些条款与您与Jobs4U.com签订的任何合同之间存在任何冲突，则以这些条款为准。");
                Languages.Add("1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk.", "1.1此Jobs4U.com网站是根据这些条款提供给您使用的。这些条款构成您与Jobs4U.com之间的具有约束力的协议。通过访问或使用Jobs4U.com网站，您同意接受和/或受这些条款的约束。您同意自行承担使用Jobs4U.com网站的风险。");
                Languages.Add("This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website.", "本页说明您（“您”）可以使用Jobs4U.com网站的使用条款（“条款”），以及您与Jobs4U.com Pte Ltd（“ Jobs4U.com”，“我们”或“我们”）的关系”）。请仔细阅读它们，因为它们会影响您在法律下的权利和义务。如果您不同意这些条款，请不要注册或使用Jobs4U.com网站。");
                Languages.Add("1. Binding Agreement", "1. 约束协议");

                lblTerms1.Text = Languages["Terms & Conditions"];
                lblTerms2.Text = Languages["Terms & Conditions"];
                lbl10.Text = Languages["1. Binding Agreement"];
                lbl11.Text = Languages["1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk."];
                lbl12.Text = Languages["In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent."];
                lbl20.Text = Languages["2. Password and Security"];
                lbl21.Text = Languages["When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone"];
                lbl22.Text = Languages["If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account."];
                lbl30.Text = Languages["3. Intellectual Property"];
                lbl31.Text = Languages["Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights."];
                lblIntro.Text = Languages["This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website."];
           
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Terms & Conditions", "Terms & Conditions");
                Languages.Add("When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone", "When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone");
                Languages.Add("If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account.", "If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account.");
                Languages.Add("Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights.", "Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights.");
                Languages.Add("3. Intellectual Property", "3. Intellectual Property");
                Languages.Add("2. Password and Security", "2. Password and Security");
                Languages.Add("In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent.", "In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent.");
                Languages.Add("1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk.", "1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk.");
                Languages.Add("This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website.", "This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website.");
                Languages.Add("1. Binding Agreement", "1. Binding Agreement");

                lblTerms1.Text = Languages["Terms & Conditions"];
                lblTerms2.Text = Languages["Terms & Conditions"];
                lbl10.Text = Languages["1. Binding Agreement"];
                lbl11.Text = Languages["1.1 This Jobs4U.com Website is provided to you for your use subject to these Terms. These Terms form a binding agreement between you and Jobs4U.com. By accessing or using the Jobs4U.com Website you agree to accept and/or to be bound by these Terms. you agree to use the Jobs4U.com Website at your own risk."];
                lbl12.Text = Languages["In the case of any conflict between these Terms and any contract you have with Jobs4U.com, these Terms will take precedent."];
                lbl20.Text = Languages["2. Password and Security"];
                lbl21.Text = Languages["When you register to use the Jobs4U.com Website you will be asked to create a password. In order to prevent fraud, you must keep this password confidential and must not disclose it or share it with anyone"];
                lbl22.Text = Languages["If Jobs4U.com has reason to believe that there is likely to be a breach of security or misuse of the Jobs4U.com Website, we may require you to change your password or we may suspend your account."];
                lbl30.Text = Languages["3. Intellectual Property"];
                lbl31.Text = Languages["Jobs4U.com Website and Jobs4U.com Content are protected by copyright, trade mark, database right and other intellectual property rights."];
                lblIntro.Text = Languages["This page states the terms of use (“Terms”) under which you (“You”) may use the Jobs4U.com Website, and Your relationship with Jobs4U.com Pte Ltd (“Jobs4U.com”, “we” or “us”). Please read them carefully as they affect Your rights and liabilities under the law. If You do not agree to these Terms, please do not register for or use the Jobs4U.com Website."];
            }
        }
    }
}