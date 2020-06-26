using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class InvestInOpportunity : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null && Request.QueryString["Name"] != null)
                {
                    string opp_id = Request.QueryString["Id"].ToString();
                    string name = Request.QueryString["Name"].ToString();

                    ViewState["opp_id"] = Request.QueryString["Id"].ToString();
                    ViewState["name"] = Request.QueryString["Name"].ToString();

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

                    string strBase64 = Convert.ToBase64String((byte[])row["image_data"]);
                    img_Logo.ImageUrl = "data:Image/png;base64," + strBase64;

                    lbl_minimum_investment_per_investor.Text = row["minimum_investment_per_investor"].ToString();
                    lbl_total_amt.Text = row["total_amt"].ToString();
                    lbl_amt_left.Text = (Convert.ToDouble(row["total_amt"]) - Convert.ToDouble(row["amt_left"])).ToString();
                    int progress = Convert.ToInt32((Convert.ToDouble(row["total_amt"]) - Convert.ToDouble(row["amt_left"])) / Convert.ToDouble(row["total_amt"]) * 100);
                    progress_bar.Attributes.Add("style", "width:" + progress + "%");
                    progress_bar.Attributes.Add("aria-valuemax", row["total_amt"].ToString());
                    progress_bar.Attributes.Add("aria-valuenow", row["amt_left"].ToString());

                    ViewState["minimum_investment_per_investor"] = row["minimum_investment_per_investor"].ToString();
                    ViewState["total_amt"] = row["total_amt"].ToString();
                }
            }
        }

        protected void btn_Invest_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            if (txt_investAmt.Text == "")
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Enter an Amount you want to Invest.";
            }
            else
            {
                double amount_to_be_invested = Convert.ToDouble(txt_investAmt.Text);
                double minimum_investment_per_investor = Convert.ToDouble(ViewState["minimum_investment_per_investor"]);
                bool isValid = CheckValidTransaction();
                if (isValid)
                {
                    string trans_id = Guid.NewGuid().ToString();
                    string opp_id = ViewState["opp_id"].ToString();
                    string name = ViewState["name"].ToString();
                    string investor_id = User.Identity.GetUserId().ToString();
                    double amount_left = Convert.ToDouble(ViewState["total_amt"]) - amount_to_be_invested;
                    dal.InvestInOpportunity(trans_id, opp_id, investor_id, amount_to_be_invested);
                    ShowopprtunityDetails(opp_id, name);
                }
            }
        }

        public bool CheckValidTransaction()
        {
            double amount_to_be_invested = Convert.ToDouble(txt_investAmt.Text);
            double minimum_investment_per_investor = Convert.ToDouble(ViewState["minimum_investment_per_investor"]);
            double amount_left = Convert.ToDouble(ViewState["total_amt"]) - amount_to_be_invested;
            if (amount_to_be_invested < minimum_investment_per_investor)
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Enter an amount greater than the Minimum Amount";
                return false;
            }
            if (amount_left < 0)
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "The amount to be invested is greater than the amount left for investment.";
                return false;
            }

            return true;
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            string opp_id = ViewState["opp_id"].ToString();
            string name = ViewState["name"].ToString();
            Response.Redirect("OpportunityDetails.aspx?Id=" + opp_id + "&Name=" + name, false);
        }
    }
}