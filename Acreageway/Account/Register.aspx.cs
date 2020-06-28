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
            Session["Id"] = Guid.NewGuid().ToString();
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

            if(UserType.SelectedValue.Equals("1"))//1 is Investor, 2 is Issuer
            {
                Response.Redirect("~/PreSuitabilityTest", true);
            }
            else
            if(UserType.SelectedValue.Equals("2"))//1 is Investor, 2 is Issuer
            {
                CreateIssuer();
                Response.Redirect("~/Default.aspx", true);
            }

        }

        protected void CreateIssuer()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser()
            {
                Id = Session["Id"].ToString(),
                UserName = Session["UserName"].ToString(),
                Email = Session["UserName"].ToString(),
                FirstName = Session["FirstName"].ToString(),
                LastName = Session["LastName"].ToString(),
                MailingAddress = Session["MailingAddress"].ToString(),
                City = Session["City"].ToString(),
                Province = Session["Province"].ToString(),
                PhoneNumber = Session["PhoneNumber"].ToString(),
                PostalCode = Session["PostalCode"].ToString()
            };
            IdentityResult result = manager.Create(user, Session["Password"].ToString());
            if (result.Succeeded)
            {
                if (Session["Role"].ToString() != null && Session["Role"].ToString() == "2") //1 is Investor, 2 is Issuer
                {
                    manager.AddToRole(user.Id, "Issuer");
                }
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                //ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}