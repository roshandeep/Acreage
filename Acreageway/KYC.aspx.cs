using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acreageway.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace Acreageway
{
    public partial class KYC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender1.EndDate = DateTime.Now;
            if (!Page.IsPostBack)
            {
                LoadCountries();
            }
        }

        public void LoadPrevisousState()
        {
            if (ViewState["isChecked"] != null)
            {
                if (ViewState["isChecked"].ToString() == "False")
                {
                    residential_address1.Style["display"] = "";
                    residential_address2.Style["display"] = "";
                }
            }
        }

        private void LoadCountries()
        {
            ddl_country.DataSource = GetCountry();
            ddl_country.DataBind();
            ddl_country.Items.Insert(0, new ListItem("--SELECT--", "-1"));
        }

        public List<string> GetCountry()
        {
            List<String> _list = new List<String>();
            CultureInfo[] _cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures |
                        CultureTypes.SpecificCultures);
            foreach (CultureInfo _cultureInfo in _cultures)
            {
                if (_cultureInfo.IsNeutralCulture || _cultureInfo.LCID == 127)
                {
                    continue;
                }
                RegionInfo _regionInfo = new RegionInfo(_cultureInfo.Name);
                if (!_list.Contains(_regionInfo.EnglishName))
                {
                    _list.Add(_regionInfo.EnglishName);
                }
            }
            _list.Sort();
            return _list;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Models.KYC kyc_obj = new Models.KYC();

            kyc_obj.userid = User.Identity.GetUserId().ToString();
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var rolesList = manager.GetRoles(User.Identity.GetUserId());
            string user_type = "";
            foreach(string role in rolesList){
                user_type = user_type + role + " , ";
            }
            kyc_obj.user_type = user_type;
            kyc_obj.salutation = ddl_salutation.SelectedItem.Text;
            kyc_obj.full_name = txt_Fname.Text.Trim() + " " + txt_Lname.Text.Trim();
            kyc_obj.email_address = txt_email.Text.Trim();
            kyc_obj.date_of_birth = Convert.ToDateTime(txt_dob.Text);
            kyc_obj.marital_status = ddl_maritalStatus.SelectedItem.Text;
            kyc_obj.phone_no = txt_phoneNo.Text.Trim();
            kyc_obj.mailing_address = txt_address.Text.Trim();
            kyc_obj.mailing_city = txt_city.Text.Trim();
            kyc_obj.mailing_province = ddl_province.SelectedItem.Text;
            kyc_obj.mailing_country = ddl_country.SelectedItem.Text;
            kyc_obj.mailing_postal_code = txt_postalCode.Text.Trim();
            kyc_obj.address_similarity_flag = chkbx_address.Checked;
            ViewState["isChecked"] = chkbx_address.Checked;
            if (chkbx_address.Checked == true)
            {
                kyc_obj.residential_address = txt_address.Text.Trim();
                kyc_obj.residential_city = txt_city.Text.Trim();
                kyc_obj.residential_province = ddl_province.SelectedItem.Text;
                kyc_obj.residential_country = ddl_country.SelectedItem.Text;
                kyc_obj.residential_postal_code = txt_postalCode.Text.Trim();
            }
            else
            {
                kyc_obj.residential_address = txt_residentialaddress.Text.Trim();
                kyc_obj.residential_city = txt_resCity.Text.Trim();
                kyc_obj.residential_province = ddl_resProvince.SelectedItem.Text;
                kyc_obj.residential_country = ddl_country.SelectedItem.Text;
                kyc_obj.residential_postal_code = txt_resPostalCode.Text.Trim();
            }

            bool valid = ValidateData(kyc_obj);
            if (valid)
            {
                SaveAnswers(kyc_obj);
                lbl_msg.ForeColor = System.Drawing.Color.Green;
                lbl_msg.Text = "KYC Information saved";
                btn_Submit.Enabled = false;
                btn_return.Visible = true;
                btn_return.Enabled = true;
            }
            else
            {
                LoadPrevisousState();
                lbl_msg.ForeColor = System.Drawing.Color.Red;
                lbl_msg.Text = "Information Missing or Incorrect!";
            }
        }

        public bool ValidateData(Models.KYC kyc_obj)
        {
            if (kyc_obj.salutation == "--SELECT--")
            {
                return false;
            }
            if (kyc_obj.mailing_country != "Canada")
            {
                return false;
            }
            if (chkbx_address.Checked == false)
            {
                if (kyc_obj.residential_address == string.Empty)
                {
                    return false;
                }
                if (kyc_obj.residential_city == string.Empty)
                {
                    return false;
                }
                if (kyc_obj.residential_province == string.Empty)
                {
                    return false;
                }
                if (kyc_obj.residential_postal_code == string.Empty)
                {
                    return false;
                }
                if (kyc_obj.residential_address == string.Empty)
                {
                    return false;
                }
            }

            return true;
        }

        private void SaveAnswers(Models.KYC kyc_obj)
        {
            DAL dal = new DAL();
            dal.SaveKYCAnswers(kyc_obj);
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }
    }
}