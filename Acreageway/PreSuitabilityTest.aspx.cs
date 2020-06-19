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
            string amount = txt_ans1.Text.Trim();
            string income = rdb_ans2.SelectedItem.Text;
            string com_income = rdb_ans3.SelectedItem.Text;
            string fin_asset = rdb_ans4.SelectedItem.Text;
            string net_asset = rdb_ans5.SelectedItem.Text;
            string email = txt_email.Text.Trim();
            string fullName = txt_fullname.Text.Trim();
        }
    }
}