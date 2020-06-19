using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class OpportunityList : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOpportunities();
            }
        }

        private void LoadOpportunities()
        {
            var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            var role = roleManager.FindByNameAsync("Investor").Result;
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            if (User?.Identity.IsAuthenticated == false)
            {
                dt = dal.LoadOpportunityList();
            }
            else
            {
                dt = dal.LoadOpportunityList(User.Identity.GetUserId().ToString());
            }
            rpt_Opportunity.DataSource = dt;
            rpt_Opportunity.DataBind();
        }

       
    }
}