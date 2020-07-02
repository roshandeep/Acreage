using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            userid = User.Identity.GetUserId().ToString();
            EnableDisableButtons(userid);
        }

        public void EnableDisableButtons(string userid)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var rolesList = manager.GetRoles(User.Identity.GetUserId());
            if (rolesList.Contains("Investor"))
            {
                btn_Investments.Visible = true;
                btn_fav.Visible = true;
                div_investments.Visible = true;
                div_fav.Visible = true;
            }
            if(rolesList.Contains("Issuer"))
            {
                btn_opportunities.Visible = true;
                div_opportunities.Visible = true;
            }
        }

        protected void btn_Investments_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserInvestments.aspx?Id=" + userid, false);
        }


        protected void btn_kyc_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserKYCDetails.aspx?Id=" + userid, false);
        }

        protected void btn_fav_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserFavourites.aspx?Id=" + userid, false);
        }

        protected void btn_opportunities_Click(object sender, EventArgs e)
        {

        }
    }
}