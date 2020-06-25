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
        string investor_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            var role = roleManager.FindByNameAsync("Investor").Result;
            investor_id = User.Identity.GetUserId().ToString();
        }

        protected void btn_Investments_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserInvestments.aspx?Id=" + investor_id, false);
        }

        protected void btn_kyc_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserKYCDetails.aspx?Id=" + investor_id, false);
        }

        protected void btn_fav_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserFavourites.aspx?Id=" + investor_id, false);
        }
    }
}