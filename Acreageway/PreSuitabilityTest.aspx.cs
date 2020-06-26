using System;
using System.Web.UI;

namespace Acreageway
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
                 bool valid = SaveAnswers();
                if (valid)
                {
                    Response.Redirect("~/Default.aspx", false);
                }
                else
                {
                    ModalPopupExtender2.Show();
                }
            }
            else
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Information Missing";
            }
        }

        public bool SaveAnswers()
        {
            int amount = Convert.ToInt32(txt_ans1.Text.Trim());
            string ind_income = rdb_ans2.SelectedItem.Text;
            string com_income = rdb_ans3.SelectedItem.Text;
            string fin_asset = rdb_ans4.SelectedItem.Text;
            string net_asset = rdb_ans5.SelectedItem.Text;
            string email = txt_email.Text.Trim();
            string fullName = txt_fullname.Text.Trim();

            if(amount-2500 < 0)
            {
                return false;
            }

            if((ind_income == "$200,000 to $500,000" || ind_income == "Over $500,000") || 
                (com_income == "$300,000 to $1,000,000" || com_income == "Over $1,000,000") ||
                (fin_asset == "Over $1,000,000") || 
                (net_asset == "$1,000,000 to $5,000,000" || net_asset == "Over $5,000,000"))
            {
                Session["investor_Type"] = "Accredited";
            }
            else
            {
                Session["investor_Type"] = "Retail";
            }
            return true;
        }

        protected void chk_NoLimit_CheckedChanged(object sender, EventArgs e)
        {
            Session["investor_Type"] = "Accredited";
            ModalPopupExtender1.Show();
        }

        protected void btn_proceed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest1.aspx", false);
        }

        protected void btn_limitbelow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx", false);
        }
    }
}