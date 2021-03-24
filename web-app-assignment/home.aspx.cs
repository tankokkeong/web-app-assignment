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