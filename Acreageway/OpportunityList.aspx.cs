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
            EnableAddOpporrunity();
            if (!IsPostBack)
            {
                LoadOpportunities();
            }
        }

        public void EnableAddOpporrunity()
        {
            if (User?.Identity.IsAuthenticated == true)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var rolesList = manager.GetRoles(User.Identity.GetUserId());
                if (rolesList.Contains("Issuer"))
                {
                    btn_Add.Enabled = true;
                    btn_Add.Visible = true;
                }
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

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            bool complete = dal.checkKYCStatus(User.Identity.GetUserId().ToString());
            if (complete)
            {
                Response.Redirect("~/CreateOpportunity.aspx", false);
            }
            else
            {
                Response.Redirect("~/KYC.aspx", false);
            }
            
        }
    }
}