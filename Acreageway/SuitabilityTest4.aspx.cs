using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Column1"] = string.Empty;
            dr["Column2"] = string.Empty;
            dr["Column3"] = string.Empty;
            dt.Rows.Add(dr);
            //dr = dt.NewRow();
            //Store the DataTable in ViewState
            ViewState["CurrentTable"] = dt;
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }

        private void AddNewRowToGrid()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        //TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                        DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddl_1");
                        //TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                        DropDownList ddl2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddl_2");
                        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        dtCurrentTable.Rows[i - 1]["Column1"] = ddl1.SelectedItem.Text;
                        dtCurrentTable.Rows[i - 1]["Column2"] = ddl2.SelectedItem.Text;
                        dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;
                        rowIndex++;
                    }

                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;
                    Gridview1.DataSource = dtCurrentTable;
                    Gridview1.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            //Set Previous Data on Postbacks
            SetPreviousData();
        }

        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        //TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                        DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddl_1");
                        //TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                        DropDownList ddl2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddl_2");
                        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");
                        ddl1.Text = dt.Rows[i]["Column1"].ToString();
                        ddl2.Text = dt.Rows[i]["Column2"].ToString();
                        box3.Text = dt.Rows[i]["Column3"].ToString();
                        rowIndex++;
                    }
                }
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            btn_Next.Enabled = true;
            bool valid = ValidateData();
            if(valid && Page.IsValid)
            {
                SaveAnswers();
                lbl_msg.ForeColor = System.Drawing.Color.Green;
                lbl_msg.Text = "KYC Information saved";
            }
            else
            {
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Information Missing or Incorrect!";
            }
        }

        public bool ValidateData()
        {
            int rowIndex = 0;
            for (int i = 0; i < Gridview1.Rows.Count; i++)
            {
                GridViewRow row = Gridview1.Rows[rowIndex];
                string ddl1 = (row.FindControl("ddl_1") as DropDownList).SelectedItem.Text;
                string ddl2 = (row.FindControl("ddl_2") as DropDownList).SelectedItem.Text;
                string txt = (row.FindControl("TextBox3") as TextBox).Text;

                bool isnumeric = IsAllDigits(txt);


                if (ddl1.Equals("--SELECT--") || ddl2.Equals("--SELECT--") || txt == "" || !isnumeric)
                {
                    return false;
                }

                rowIndex++;
            }

            return true;
        }

        bool IsAllDigits(string s)
        {
            foreach (char c in s)
            {
                if (!char.IsDigit(c))
                    return false;
            }
            return true;
        }

        public void SaveAnswers()
        {
            List<String> questions = new List<String>();
            List<String> answers = new List<String>();
            string finIns = string.Empty, assetType = string.Empty, amount = string.Empty, officer = string.Empty, controlPos = string.Empty;

            int rowIndex = 0;

            for (int i = 0; i < Gridview1.Rows.Count; i++)
            {
                GridViewRow row = Gridview1.Rows[rowIndex];
                string source = (row.FindControl("ddl_1") as DropDownList).SelectedItem.Text + " " + (row.FindControl("ddl_2") as DropDownList).SelectedItem.Text;
                string total = (row.FindControl("TextBox3") as TextBox).Text;
                questions.Add(source);
                answers.Add(total);
                rowIndex++;
            }
    

            officer = rdb_officer.SelectedItem.Text;
            questions.Add(lbl_officer.Text);
            answers.Add(officer);

            controlPos = rdb_controlpos.SelectedItem.Text;
            questions.Add(lbl_controlpos.Text);
            answers.Add(controlPos);

            DAL dal = new DAL();
            //TESTING
            string investor_id = "7BBA56A7-82A3-4AE7-AAF1-7A8849649AE8";
            dal.SaveSuitabilityTestResults(investor_id, questions, answers);
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SuitabilityTest5.aspx", false);
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }
    }
}