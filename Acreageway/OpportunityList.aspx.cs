using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class OpportunityList : System.Web.UI.Page
    {
        string investor_id = "7BBA56A7-82A3-4AE7-AAF1-7A8849649AE8";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userRole"] = "Investor";
            if (!IsPostBack)
            {
                LoadOpportunities();
            }
        }

        private void LoadOpportunities()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadOpportunityList(investor_id);
            rpt_Opportunity.DataSource = dt;
            rpt_Opportunity.DataBind();
        }

        protected void lnk_favourite_Command(object sender, CommandEventArgs e)
        {
            ModalPopupExtender1.Show();
            if (e.CommandName == "favourite")
            {
                lbl_msg.Text = "Added To favourites";
                string opportunity_id = e.CommandArgument.ToString();
                Session["opportunity_id_Selected"] = e.CommandArgument.ToString();
                //DAL dal = new DAL();
                //dal.AddToFavourites(investor_id, opportunity_id);
            }
        }

        protected void rpt_Opportunity_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lnk_favourite = (LinkButton)e.Item.FindControl("lnk_favourite");
                if (Session["userRole"].ToString() == "Issuer")
                {
                    lnk_favourite.Visible = false;
                }
            }
            if (e.Item.ItemType == ListItemType.Header)
            {
                var fav_th = e.Item.FindControl("fav_th") as Control;
                if (Session["userRole"].ToString() == "Issuer")
                {
                    fav_th.Visible = false;
                }
            }
        }

        protected void btn_Accept_Click(object sender, EventArgs e)
        {
            if (Session["opportunity_id_Selected"] != null)
            {
                lbl_msg.Text = "Added To favourites";
                string opportunity_id = Session["opportunity_id_Selected"].ToString();
                DAL dal = new DAL();
                dal.AddToFavourites(investor_id, opportunity_id);
                Session["opportunity_id_Selected"] = null;
                LoadOpportunities();
            }
        }
    }
}