using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btn_Save_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                btn_Next.Enabled = true;
                SaveAnswers();
            }
        }

        public void SaveAnswers()
        {
            List<String> questions = new List<String>();
            List<String> answers = new List<String>();
            string family = string.Empty, head = string.Empty, government = string.Empty;
            string deputy = string.Empty, ambassador = string.Empty, military = string.Empty;
            string president = string.Empty, agency = string.Empty, judge = string.Empty;
            string leader = string.Empty, holder = string.Empty, tpd = string.Empty, hio = string.Empty;

            family = ddl_family.SelectedItem.Text;
            questions.Add(lbl_family.Text);
            answers.Add(family);

            head = ddl_head.SelectedItem.Text;
            questions.Add(lbl_head.Text);
            answers.Add(head);

            government = ddl_government.SelectedItem.Text;
            questions.Add(lbl_government.Text);
            answers.Add(government);

            deputy = ddl_deputy.SelectedItem.Text;
            questions.Add(lbl_deputy.Text);
            answers.Add(deputy);

            ambassador = ddl_ambassador.SelectedItem.Text;
            questions.Add(lbl_ambassador.Text);
            answers.Add(ambassador);

            military = ddl_military.SelectedItem.Text;
            questions.Add(lbl_military.Text);
            answers.Add(military);

            president = ddl_president.SelectedItem.Text;
            questions.Add(lbl_president.Text);
            answers.Add(president);

            agency = ddl_agency.SelectedItem.Text;
            questions.Add(lbl_agency.Text);
            answers.Add(agency);

            judge = ddl_judge.SelectedItem.Text;
            questions.Add(lbl_judge.Text);
            answers.Add(judge);

            leader = ddl_leader.SelectedItem.Text;
            questions.Add(lbl_leader.Text);
            answers.Add(leader);

            holder = ddl_holder.SelectedItem.Text;
            questions.Add(lbl_holder.Text);
            answers.Add(holder);

            tpd = ddl_tpd.SelectedItem.Text;
            questions.Add(lbl_tpd.Text);
            answers.Add(tpd);

            hio = ddl_hio.SelectedItem.Text;
            questions.Add(lbl_hio.Text);
            answers.Add(hio);

            DAL dal = new DAL();
            //TESTING
            string investor_id = "7BBA56A7-82A3-4AE7-AAF1-7A8849649AE8";
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }
    }
}