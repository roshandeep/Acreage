using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class UserFavourites : System.Web.UI.Page
    {
        string investor_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserFavouritesList();
        }

        public void UserFavouritesList()
        {
            investor_id = Request.QueryString["Id"].ToString();
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.UserFavourites(investor_id);
            rpt_UserfavOpportunity.DataSource = dt;
            rpt_UserfavOpportunity.DataBind();
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserDashboard.aspx", false);
        }
    }
}