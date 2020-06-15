using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class PreSuitabilityTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveAnswers();
            }
            else
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Information Missing";
            }
        }

        public void SaveAnswers()
        {
            int amount = Convert.ToInt32(txt_ans1.Text.Trim());
            string income = rdb_ans2.SelectedItem.Text;
            string com_income = rdb_ans3.SelectedItem.Text;
            string fin_asset = rdb_ans4.SelectedItem.Text;
            string net_asset = rdb_ans5.SelectedItem.Text;
            string email = txt_email.Text.Trim();
            string fullName = txt_fullname.Text.Trim();
            DecideInvestorType(amount, income, com_income, fin_asset, net_asset);
        }

        private void DecideInvestorType(int amount, string income, string com_income, string fin_asset, string net_asset)
        {
            if(com_income.Equals("$300,000 to $1,000,000") || com_income.Equals("$300,000 to $1,000,000") || income.Equals("$200,000 to $500,000") || income.Equals("Over $500,000")
                || fin_asset.Equals("Over $1,000,000") || net_asset.Equals("$1,000,000 to $5,000,000") || net_asset.Equals("Over $5,000,000"))
            {
                Session["InvestorType"] = "Accredited Investor";
            }
            else
            {
                Session["InvestorType"] = "Retail Investor";
            }
        }
    }
}