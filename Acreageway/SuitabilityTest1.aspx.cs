using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        public void BindDropDownLists(string  ddlchanged)
        {
            Dictionary<string, string> options = new Dictionary<string, string>();
            options.Add("--SELECT--", "--SELECT--");
            options.Add("1st Priority", "1st Priority");
            options.Add("2nd Priority", "2nd Priority");
            options.Add("3rd Priority", "3rd Priority");

            string income = ddl_income.SelectedItem.Value;
            string balance = ddl_Balance.SelectedItem.Value;
            string growth = ddl_Growth.SelectedItem.Value;

            if (ddlchanged.Equals("income"))
            {
                ddl_Balance.Items.Clear();
                ddl_Growth.Items.Clear();

                ddl_Balance.DataSource = options;
                ddl_Balance.DataTextField = "Value";
                ddl_Balance.DataValueField = "Key";
                ddl_Balance.DataBind();

                if(ddl_Balance.Items.FindByValue(income) != null && ddl_Balance.Items.FindByValue(income).ToString() != "--SELECT--")
                {
                    ddl_Balance.Items.Remove(income);
                }

                ddl_Growth.DataSource = options;
                ddl_Growth.DataTextField = "Value";
                ddl_Growth.DataValueField = "Key";
                ddl_Growth.DataBind();

                if (ddl_Growth.Items.FindByValue(income) != null && ddl_Growth.Items.FindByValue(income).ToString() != "--SELECT--")
                {
                    ddl_Growth.Items.Remove(income);
                }
            }
            else
            if (ddlchanged.Equals("balance"))
            {
                //ddl_income.Items.Clear();
                ddl_Growth.Items.Clear();

                //ddl_income.DataSource = options;
                //ddl_income.DataTextField = "Value";
                //ddl_income.DataValueField = "Key";
                //ddl_income.DataBind();

                //if (ddl_income.Items.FindByValue(balance) != null && ddl_income.Items.FindByValue(balance).ToString() != "--SELECT--")
                //{
                //    ddl_income.Items.Remove(balance);
                //}

                ddl_Growth.DataSource = options;
                ddl_Growth.DataTextField = "Value";
                ddl_Growth.DataValueField = "Key";
                ddl_Growth.DataBind();

                if (ddl_Growth.Items.FindByValue(balance) != null && ddl_Growth.Items.FindByValue(balance).ToString() != "--SELECT--")
                {
                    ddl_Growth.Items.Remove(balance);
                }
                if (ddl_Growth.Items.FindByValue(income) != null && ddl_Growth.Items.FindByValue(income).ToString() != "--SELECT--")
                {
                    ddl_Growth.Items.Remove(income);
                }
            }
            else
            if (ddlchanged.Equals("growth"))
            {
                //ddl_income.Items.Clear();
                //ddl_Balance.Items.Clear();

                //ddl_income.DataSource = options;
                //ddl_income.DataTextField = "Value";
                //ddl_income.DataValueField = "Key";
                //ddl_income.DataBind();

                //if (ddl_income.Items.FindByValue(growth) != null && ddl_income.Items.FindByValue(growth).ToString() != "--SELECT--")
                //{
                //    ddl_income.Items.Remove(growth);
                //}

                //ddl_Balance.DataSource = options;
                //ddl_Balance.DataTextField = "Value";
                //ddl_Balance.DataValueField = "Key";
                //ddl_Balance.DataBind();

                //if (ddl_Balance.Items.FindByValue(growth) != null && ddl_Balance.Items.FindByValue(growth).ToString() != "--SELECT--")
                //{
                //    ddl_Balance.Items.Remove(growth);
                //}
            }
        }

        protected void ddl_income_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Balance.Enabled = true;
            BindDropDownLists("income");
        }

        protected void ddl_Balance_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Growth.Enabled = true;
            BindDropDownLists("balance");
        }

        protected void ddl_Growth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDropDownLists("growth");
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            bool valid = ValidateData();
            if (Page.IsValid && valid)
            {
                btn_Next.Enabled = true;
                SaveAnswers();
            }
            else
            {

            }
        }

        public bool ValidateData()
        {
            if (ddl_investmentKnow.SelectedItem.Text == "--SELECT--" || ddl_riskTolerance.SelectedItem.Text == "--SELECT--" || ddl_income.SelectedItem.Text == "--SELECT--" || ddl_Balance.SelectedItem.Text == "--SELECT--" || ddl_Growth.SelectedItem.Text == "--SELECT--")
            {
                return false;
            }
            return true;
        }

        private void SaveAnswers()
        {
            List<String> questions = new List<String>();
            List<String> answers = new List<String>();
            string inv_know = string.Empty, risk_tol = string.Empty, income = string.Empty, balance = string.Empty, growth = string.Empty;

            inv_know = ddl_investmentKnow.SelectedItem.Text;
            questions.Add(lbl_investmentKnow.Text);
            answers.Add(inv_know);

            risk_tol = ddl_riskTolerance.SelectedItem.Text;
            questions.Add(lbl_RiskTolerance.Text);
            answers.Add(risk_tol);

            income = ddl_income.SelectedItem.Text;
            questions.Add(lbl_Income.Text);
            answers.Add(income);

            balance = ddl_Balance.SelectedItem.Text;
            questions.Add(lbl_Balance.Text);
            answers.Add(balance);

            growth = ddl_Growth.SelectedItem.Text;
            questions.Add(lbl_Growth.Text);
            answers.Add(growth);

            DAL dal = new DAL();
            //TESTING
            string investor_id = "7BBA56A7-82A3-4AE7-AAF1-7A8849649AE8";
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest2.aspx", false);
        }


    }
}