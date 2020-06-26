using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer != null)
            {
                if (Request.UrlReferrer.AbsoluteUri.Contains("KYC"))
                {
                    ModalPopupExtender2.Show();
                }
            }
            if (!IsPostBack)
            {
                LoadOpportunities();
            }
        }

        private void LoadOpportunities()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.DefaultpageOpportunity();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void btn_ViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }
    }
}