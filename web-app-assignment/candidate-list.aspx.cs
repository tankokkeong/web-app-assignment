using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_app_assignment
{
    public partial class candidate_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_jobListContentsApplyNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("job_description.aspx");
        }

        protected void btn_jobListContentsContactNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("job_description.aspx");
        }
    }
}