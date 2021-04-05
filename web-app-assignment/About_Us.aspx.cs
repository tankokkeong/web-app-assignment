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

            if (Session["Languages_EN"] != null)
            {
                Languages.Add("Vision", "愿景");
                Languages.Add("Mission", "宗旨");
                Languages.Add("Who We Are?", "我们是谁？");
                Languages.Add("About Us", "关于我们");
                Languages.Add("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.", "员鲢，尝它愧窑浆纬选哗擦燕服嘲羔午跟寒恰棉碳黔渗肌肥写蛄概训绥籽但锈禹重甩夕帽勿出稿契。");

                lblVision.Text = Languages["Vision"];
                lblMission.Text = Languages["Mission"];
                lblWhoWeAre.Text = Languages["Who We Are?"];
                lblAboutUs.Text = Languages["About Us"];
                lblLorem1.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem2.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem3.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem4.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem5.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem6.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem7.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem8.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
            }
            else if (Session["Languages_CN"] != null)
            {
                Languages.Add("Vision", "Vision");
                Languages.Add("Mission", "Mission");
                Languages.Add("Who We Are?", "Who We Are?");
                Languages.Add("About Us", "About Us");
                Languages.Add("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis.");

                lblVision.Text = Languages["Vision"];
                lblMission.Text = Languages["Mission"];
                lblWhoWeAre.Text = Languages["Who We Are?"];
                lblAboutUs.Text = Languages["About Us"];
                lblLorem1.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem2.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem3.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem4.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem5.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem6.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem7.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];
                lblLorem8.Text = Languages["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. In hac habitasse platea dictumst. Proin fermentum leo vel orci. Diam in arcu cursus euismod quis."];

            }
        }
    }
}