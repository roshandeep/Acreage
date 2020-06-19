using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Acreageway.Models;

namespace Acreageway.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            Session["Role"] = UserType.SelectedValue;
            Session["UserName"] = Email.Text;
            Session["FirstName"] = FirstName.Text;
            Session["LastName"] = LastName.Text;
            Session["MailingAddress"] = MailingAddress.Text;
            Session["City"] = City.Text;
            Session["Province"] = Province.SelectedValue;
            Session["PhoneNumber"] = PhoneNumber.Text;
            Session["PostalCode"] = PostalCode.Text;
            Session["Password"] = Password.Text;
            Response.Redirect("~/SuitabilityTest1", true);

        }
    }
}