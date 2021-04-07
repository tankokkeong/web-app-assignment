using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class About_Us : System.Web.UI.Page
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
                Languages.Add("Vision", "愿景");
                Languages.Add("Mission", "宗旨");
                Languages.Add("Who We Are?", "我们是谁？");
                Languages.Add("About Us", "关于我们");
                Languages.Add("Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate.", "Jobs4U于2020年在马来西亚成立，目前拥有800名才华横溢的团队，这使我们在我们运营所在的每个国家/地区都拥有强大的本地影响力。");
                Languages.Add("With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers.", "凭借我们对每个市场的了解和见识以及对技术的热情，我们为求职者提供了最佳机会，并为雇主创造了非凡的价值。");
                Languages.Add("We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers.", "我们致力于不断提高我们为求职者和雇主提供的价值。为此，我们将继续发展我们的产品和服务产品，以更好地促进求职者与雇主的匹配。");
                Languages.Add("I build great teams and then try to point everyone in the right direction.", "我组建了优秀的团队，然后尝试为每个人指明正确的方向。");
                Languages.Add("The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.", "您正在阅读的事实意味着我们做得对。通过模因和咖啡，通过社交媒体，广告，电子邮件和事件为您带来了令人敬畏的品牌和内容。");
                Languages.Add("We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!", "我们是秘密的调味酱-品牌内容工作室，由一群才华横溢的创意人士组成。我们专注于通过无障碍的内容创建和创意解决方案吸引有才华的年轻求职者。简而言之，我们使事情变得有用而美观！");
                Languages.Add("Helps people discover any job with any employer in the market.", "帮助人们找到市场上任何雇主的任何工作。");
                Languages.Add("To connect businesses with talent and improve lives through better careers.", "使企业与人才建立联系，并通过更好的职业生涯改善生活。");

                lblVision1.Text = Languages["Vision"];
                lblMission.Text = Languages["Mission"];
                lblWhoWeAre.Text = Languages["Who We Are?"];
                lblAboutUs.Text = Languages["About Us"];
                lblDesc1.Text = Languages["Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate."];
                lblDesc2.Text = Languages["With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers."];
                lblDesc3.Text = Languages["We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers."];
                lblPpl1.Text = Languages["I build great teams and then try to point everyone in the right direction."];
                lblPpl2.Text = Languages["The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."];
                lblPpl3.Text = Languages["We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!"];
                lblMissionDesc.Text = Languages["Helps people discover any job with any employer in the market."];
                lblVisionDesc.Text = Languages["To connect businesses with talent and improve lives through better careers."];
            }
            else if (Session["Languages_EN"] != null)
            {
                Languages.Add("Vision", "Vision");
                Languages.Add("Mission", "Mission");
                Languages.Add("Who We Are?", "Who We Are?");
                Languages.Add("About Us", "About Us");
                Languages.Add("Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate.", "Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate.");
                Languages.Add("With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers.", "With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers.");
                Languages.Add("We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers.", "We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers.");
                Languages.Add("I build great teams and then try to point everyone in the right direction.", "I build great teams and then try to point everyone in the right direction.");
                Languages.Add("The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.", "The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee.");
                Languages.Add("We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!", "We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!");
                Languages.Add("Helps people discover any job with any employer in the market.", "Helps people discover any job with any employer in the market.");
                Languages.Add("To connect businesses with talent and improve lives through better careers.", "To connect businesses with talent and improve lives through better careers.");

                lblVision1.Text = Languages["Vision"];
                lblMission.Text = Languages["Mission"];
                lblWhoWeAre.Text = Languages["Who We Are?"];
                lblAboutUs.Text = Languages["About Us"];
                lblDesc1.Text = Languages["Founded in Malaysia in 2020, Jobs4U now has a team of 800 talented individuals, giving us a strong local presence in every country in which we operate."];
                lblDesc2.Text = Languages["With our understanding and insights on each market, as well our passion for technology, we provide jobseekers the best opportunities and deliver exceptional value to employers."];
                lblDesc3.Text = Languages["We are committed to continuously improving the value we provide to jobseekers and employers. To deliver on this, we continue to evolve our product and service offerings to better facilitate the matching of jobseekers to employers."];
                lblPpl1.Text = Languages["I build great teams and then try to point everyone in the right direction."];
                lblPpl2.Text = Languages["The fact that you’re reading this means we did something right. Awesome branding and content brought to you via social media, ads, emails and events, powered by memes and coffee."];
                lblPpl3.Text = Languages["We are the secret sauce - a branding content studio consisting of a team of talented creative individuals. We specialize in attracting talented young jobseekers through hassle free content creation and creative solutions. To put it simply, we make things helpful & pretty!"];
                lblMissionDesc.Text = Languages["Helps people discover any job with any employer in the market."];
                lblVisionDesc.Text = Languages["To connect businesses with talent and improve lives through better careers."];
            }
        }
    }
}