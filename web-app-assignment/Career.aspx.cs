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
                Languages.Add("I build great teams and then try to point everyone in the right direction.", "我组建了优秀的团队，然后尝试为每个人指明正确的方向。");
                Languages.Add("The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.", "您正在阅读的事实意味着我们做得对。通过模因和咖啡，通过社交媒体，广告，电子邮件和事件为您带来了令人敬畏的品牌和内容。");
                Languages.Add("We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful AND pretty!", "我们是秘密的调味酱-品牌内容工作室，由一群才华横溢的创意人士组成。我们专注于通过无障碍的内容创建和创意解决方案吸引有才华的年轻求职者。简而言之，我们使事情变得有用且美观！");
                Languages.Add("If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!", "如果一张图片的价值不超过一千字，那么雇主品牌化将使您的竞争对手无话可说，而求职者会惊讶。有了经验丰富的顾问，别让事情变本加厉。与我们联系并开始吧！");
                Languages.Add("A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude.", "一群充满激情和以人为本的猎头公司，他们不仅希望根据工作经验和教育水平来帮助雇主找到高质量的人才，而且还要强调文化和态度。");
                Languages.Add("Founder", "创办人");
                Languages.Add("Marketing Teams", "营销团队");
                Languages.Add("Creative Teams", "创意团队");
                Languages.Add("Sales Teams", "销售团队");
                Languages.Add("Recruitment Teams", "招募团队");

                lblUpload.Text = Languages["Upload Your Resume"];
                lblSpecific.Text = Languages["Specific Your current employment status"];
                lblWhat.Text = Languages["What Position are you looking for"];
                lblEmail.Text = Languages["Email"];
                lblFullName.Text = Languages["Full Name"];
                lblApplication.Text = Languages["Application Form"];
                lblFill.Text = Languages["Fill out the below for job opportunies"];
                lblOurTeam.Text = Languages["Our Team"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblDesc1.Text = Languages["I build great teams and then try to point everyone in the right direction."];
                lblDesc2.Text = Languages["The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."];
                lblDesc3.Text = Languages["We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful AND pretty!"];
                lblDesc4.Text = Languages["If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!"];
                lblDesc5.Text = Languages["A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude."];
                lblPpl1.Text = Languages["Founder"];
                lblPpl2.Text = Languages["Marketing Teams"];
                lblPpl3.Text = Languages["Creative Teams"];
                lblPpl4.Text = Languages["Sales Teams"];
                lblPpl5.Text = Languages["Recruitment Teams"];
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
                Languages.Add("I build great teams and then try to point everyone in the right direction.", "I build great teams and then try to point everyone in the right direction.");
                Languages.Add("The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.", "The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.");
                Languages.Add("We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful AND pretty!", "We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful AND pretty!");
                Languages.Add("If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!", "If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!");
                Languages.Add("A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude.", "A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude.");
                Languages.Add("Founder", "Founder");
                Languages.Add("Marketing Teams", "Marketing Teams");
                Languages.Add("Creative Teams", "Creative Teams");
                Languages.Add("Sales Teams", "Sales Teams");
                Languages.Add("Recruitment Teams", "Recruitment Teams");

                lblUpload.Text = Languages["Upload Your Resume"];
                lblSpecific.Text = Languages["Specific Your current employment status"];
                lblWhat.Text = Languages["What Position are you looking for"];
                lblEmail.Text = Languages["Email"];
                lblFullName.Text = Languages["Full Name"];
                lblApplication.Text = Languages["Application Form"];
                lblFill.Text = Languages["Fill out the below for job opportunies"];
                lblOurTeam.Text = Languages["Our Team"];
                lblCareerCenter.Text = Languages["Career Center"];
                lblDesc1.Text = Languages["I build great teams and then try to point everyone in the right direction."];
                lblDesc2.Text = Languages["The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."];
                lblDesc3.Text = Languages["We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful AND pretty!"];
                lblDesc4.Text = Languages["If a picture is worth a thousand words, employer branding will leave your competitors speechless and job seekers amazed. With experienced consultants at the ready, don’t leave things to chance. Reach out to us and get started!"];
                lblDesc5.Text = Languages["A group of passionate and people-oriented headhunters who desire to help employers find quality talents, not only based on their working experiences and education level, but also emphasize on culture and attitude."];
                lblPpl1.Text = Languages["Founder"];
                lblPpl2.Text = Languages["Marketing Teams"];
                lblPpl3.Text = Languages["Creative Teams"];
                lblPpl4.Text = Languages["Sales Teams"];
                lblPpl5.Text = Languages["Recruitment Teams"];
            }
        }
    }
}