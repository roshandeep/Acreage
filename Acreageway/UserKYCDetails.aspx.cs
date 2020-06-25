using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreageway
{
    public partial class UserKYCDetails : System.Web.UI.Page
    {
        string investor_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserKYCDetailsDisplay();
        }

        private void UserKYCDetailsDisplay()
        {
            investor_id = Request.QueryString["Id"].ToString();
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.UserKYCDetails(investor_id);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    lbl_kyc_id.Text = row["kyc_id"].ToString();
                    lbl_user_type.Text = row["user_type"].ToString();
                    lbl_fullname.Text = row["salutation"].ToString() + " " + row["full_name"].ToString();
                    lbl_marital_status.Text = row["marital_status"].ToString();
                    lbl_email_address.Text = row["email_address"].ToString();
                    lbl_date_of_birth.Text = row["date_of_birth"].ToString();
                    lbl_phone_no.Text = row["phone_no"].ToString();
                    lbl_mailing_address.Text = row["mailing_address"].ToString();
                    lbl_city.Text = row["city"].ToString();
                    lbl_province.Text = row["province"].ToString();
                    lbl_postal_code.Text = row["postal_code"].ToString();
                    lbl_country.Text = row["country"].ToString();
                    lbl_residential_address.Text = row["residential_address"].ToString();
                    lbl_residential_city.Text = row["residential_city"].ToString();
                    lbl_residential_province.Text = row["residential_province"].ToString();
                    lbl_residential_postal_code.Text = row["residential_postal_code"].ToString();
                    lbl_kyc_timestamp.Text = row["kyc_timestamp"].ToString();
                }
                else
                {
                    kyc_table.Visible = false;
                    lbl_msg.ForeColor = System.Drawing.Color.Red;
                    lbl_msg.Text = "KYC not Completed.";
                }
            }
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserDashboard.aspx", false);
        }
    }
}