using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack){

                Dictionary<string, string> Languages = new Dictionary<string, string>();

                if (Session["Languages_EN"] != null)
                {
                    Languages.Add("5,000+ Browse Jobs", "5,000+个浏览职位");
                    Languages.Add("Working Partners", "工作伙伴");
                    Languages.Add("Finance", "金融");
                    Languages.Add("Banking", "银行业");
                    Languages.Add("Accounting", "会计");
                    Languages.Add("Software Engineering", "软件工程");
                    Languages.Add("Sales & Marketing", "销售与市场营销");
                    Languages.Add("Graphic Design", "平面设计");
                    Languages.Add("Digital Marketing", "平面设计");
                    Languages.Add("Education", "教育");
                    Languages.Add("Job Services", "求职服务");
                    Languages.Add("Submit Resume", "提交简历");
                    Languages.Add("Search Jobs", "搜索工作");
                    Languages.Add("Create Account", "创建帐号");
                    Languages.Add("Our Work Process", "我们的工作流程");
                    Languages.Add("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing.", "奖懂露谦奥恐垅豫垫襄渐蟹桌倍佐蔬牧幸百爸荚崩汗贸随撤腑碰己肉；脑墨鞭甚材锡袋英报羊垃鸣起侵砾哥卿幼运昭笑滩镍全歧梢束拜慈柔兆诉任楔疆闺灼列怪五磷。");
                    Languages.Add("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "铀，分僵犁质毕生召消岛损锄拱晰醉铺捏益画物完嚼露猾垮亚朋阻匪因牢户闪谎？缓递从九叉卤福？");

                    lblBrowse.Text = Languages["5,000+ Browse Jobs"];
                    lblWorkingPartners.Text = Languages["Working Partners"];
                    lblFinance.Text = Languages["Finance"];
                    lblBanking.Text = Languages["Banking"];
                    lblAccounting.Text = Languages["Accounting"];
                    lblSoftwareEngineering.Text = Languages["Software Engineering"];
                    lblSales.Text = Languages["Sales & Marketing"];
                    lblGraphicDesign.Text = Languages["Graphic Design"];
                    lblDigitalMarketing.Text = Languages["Digital Marketing"];
                    lblEducation.Text = Languages["Education"];
                    lblJobServices.Text = Languages["Job Services"];
                    lblSubmitResume.Text = Languages["Submit Resume"];
                    lblSearchJobs.Text = Languages["Search Jobs"];
                    lblCreateAccount.Text = Languages["Create Account"];
                    lblOurWorkProcess.Text = Languages["Our Work Process"];
                    lblLorem1.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblLorem2.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblLorem3.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblIpsum1.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum2.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum3.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum4.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum5.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum6.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum7.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum8.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                }
                else if (Session["Languages_CN"] != null)
                {
                    Languages.Add("5,000+ Browse Jobs", "5,000+ Browse Jobs");
                    Languages.Add("Working Partners", "Working Partners");
                    Languages.Add("Finance", "Finance");
                    Languages.Add("Banking", "Banking");
                    Languages.Add("Accounting", "Accounting");
                    Languages.Add("Software Engineering", "Software Engineering");
                    Languages.Add("Sales & Marketing", "Sales & Marketing");
                    Languages.Add("Graphic Design", "Graphic Design");
                    Languages.Add("Digital Marketing", "Digital Marketing");
                    Languages.Add("Education", "Education");
                    Languages.Add("Job Services", "Job Services");
                    Languages.Add("Submit Resume", "Submit Resume");
                    Languages.Add("Search Jobs", "Search Jobs");
                    Languages.Add("Create Account", "Create Account");
                    Languages.Add("Our Work Process", "Our Work Process");
                    Languages.Add("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing.", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing.");
                    Languages.Add("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.");

                    lblBrowse.Text = Languages["5,000+ Browse Jobs"];
                    lblWorkingPartners.Text = Languages["Working Partners"];
                    lblFinance.Text = Languages["Finance"];
                    lblBanking.Text = Languages["Banking"];
                    lblAccounting.Text = Languages["Accounting"];
                    lblSoftwareEngineering.Text = Languages["Software Engineering"];
                    lblSales.Text = Languages["Sales & Marketing"];
                    lblGraphicDesign.Text = Languages["Graphic Design"];
                    lblDigitalMarketing.Text = Languages["Digital Marketing"];
                    lblEducation.Text = Languages["Education"];
                    lblJobServices.Text = Languages["Job Services"];
                    lblSubmitResume.Text = Languages["Submit Resume"];
                    lblSearchJobs.Text = Languages["Search Jobs"];
                    lblCreateAccount.Text = Languages["Create Account"];
                    lblOurWorkProcess.Text = Languages["Our Work Process"];
                    lblLorem1.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblLorem2.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblLorem3.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing."];
                    lblIpsum1.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum2.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum3.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum4.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum5.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum6.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum7.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                    lblIpsum8.Text = Languages["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."];
                }

                List<string> LocationStatesItems = new List<string>
                {
                    "Johor",
                    "Kedah",
                    "Kelantan",
                    "Kuala Lumpur",
                    "Labuan",
                    "Melacca",
                    "Negeri Sembilan",
                    "Pahang",
                    "Perak",
                    "Perlis",
                    "Pulau Pinang",
                    "Putrajaya",
                    "Sabah",
                    "Sarawak",
                    "Selangor",
                    "Terengganu",
                };

                lstSearchLocation.DataSource = LocationStatesItems;
                lstSearchLocation.DataBind();
            }
        }

        protected void btn_HomeSearchButton_Click(object sender, EventArgs e)
        {

        }
    }
}