using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Data;
using System.Web;

namespace Acreageway
{
    public partial class OpportunityDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Name"] != null)
                {
                    string opp_id = Request.QueryString["Id"].ToString();
                    string name = Request.QueryString["Name"].ToString();
                    ShowopprtunityDetails(opp_id, name);
                }
            }
        }

        private void ShowopprtunityDetails(string opp_id, string name)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.LoadOpportunityDetails(opp_id, name);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    lbl_name.Text = row["oppotunity_name"].ToString();
                    lbl_short_desc.Text = row["short_desc"].ToString();
                    lbl_long_desc.Text = row["long_desc"].ToString();
                    lbl_category.Text = row["category"].ToString();
                    lbl_type_of_security.Text = row["type_of_security"].ToString();
                    lbl_offeringType.Text = row["offering_type"].ToString();

                    string strBase64 = Convert.ToBase64String((byte[])row["image_data"]);
                    img_Logo.ImageUrl = "data:Image/png;base64," + strBase64;

                    lbl_created_by.Text = row["created_by"].ToString();
                    lbl_created_timestamp.Text = row["created_timestamp"].ToString();
                    lbl_expiry_timestamp.Text = row["expiry_timestamp"].ToString();
                    lbl_price_per_security.Text = row["price_per_security"].ToString();
                    lbl_minimum_investment_per_investor.Text = row["minimum_investment_per_investor"].ToString();
                    lbl_total_investors.Text = row["total_investors"].ToString();
                    lbl_total_amt.Text = row["total_amt"].ToString();
                    lbl_amt_left.Text = (Convert.ToDouble(row["total_amt"]) - Convert.ToDouble(row["amt_left"])).ToString();
                    int progress =  Convert.ToInt32((Convert.ToDouble(row["total_amt"]) - Convert.ToDouble(row["amt_left"])) / Convert.ToDouble(row["total_amt"]) * 100);
                    progress_bar.Attributes.Add("style", "width:"+ progress + "%");
                    progress_bar.Attributes.Add("aria-valuemax", row["total_amt"].ToString());
                    progress_bar.Attributes.Add("aria-valuenow", row["amt_left"].ToString());
                }
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }

        protected void btn_Invest_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Accept_Click(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == true)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Name"] != null)
                {
                    string opp_id = Request.QueryString["Id"].ToString();
                    string name = Request.QueryString["Name"].ToString();
                    DAL dal = new DAL();

                    var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
                    var role = roleManager.FindByNameAsync("Investor").Result;
                    dal.AddToFavourites(User.Identity.GetUserId().ToString(), opp_id);
                    Response.Redirect("OpportunityDetails.aspx?Id=" + opp_id + "&Name=" + name, false);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx/?ReturnUrl=" + HttpContext.Current.Request.Url.AbsoluteUri);
            }
        }

        protected void btn_Accept_Invest_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();

            if (User?.Identity.IsAuthenticated == true)
            {
                bool complete = dal.checkKYCStatus(User.Identity.GetUserId().ToString());
                if (complete)
                {
                    if (Request.QueryString["Id"] != null && Request.QueryString["Name"] != null)
                    {
                        string opp_id = Request.QueryString["Id"].ToString();
                        string name = Request.QueryString["Name"].ToString();
                        var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
                        var role = roleManager.FindByNameAsync("Investor").Result;
                        Response.Redirect("InvestInOpportunity.aspx?Id=" + opp_id + "&Name=" + name, false);
                    }
                }
                else
                {
                    Response.Redirect("~/KYC.aspx", false);
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx/?ReturnUrl=" + HttpContext.Current.Request.Url.AbsoluteUri);
            }
           
        }
    }
}