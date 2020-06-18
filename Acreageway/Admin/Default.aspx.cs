using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.ComponentModel;
using System.Web;

namespace Acreageway.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = $"Is Admin? {User.IsInRole("Administrators")}";
            lblAddRoleException.Visible = false;
            lblGetRolesException.Visible = false;
            lblRemoveRoleException.Visible = false;
            RolesListBox.Items.Clear();
        }
        protected void btnAddUserRole_Click(object sender, EventArgs e)
        {
            try
            {
                var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();

                var selectedUser = userManager.FindByEmail(UserEmail.Text).Id;

                try
                {
                    switch (Convert.ToInt32(UserRolesList.SelectedValue))
                    {
                        case 1: //Investor
                            userManager.AddToRole(selectedUser, "Investor");
                            break;
                        case 2: //Issuer
                            userManager.AddToRole(selectedUser, "Issuer");
                            break;
                        case 3: //Admin
                            userManager.AddToRole(selectedUser, "Admin");
                            break;
                        default:
                            //should be unreachable.
                            throw (new InvalidEnumArgumentException("No user type value was selected in drop down list."));
                    }

                    TxtGetRoles.Text = "";
                    UserEmail.Text = "";
                    removeUser.Text = "";
                }
                catch (InvalidEnumArgumentException ex)
                {
                    Console.WriteLine(ex.Message);
                    Console.WriteLine(ex.ParamName);
                    Console.WriteLine(ex.StackTrace);
                    Console.WriteLine(ex.Source);
                    lblAddRoleException.Visible = true;
                }
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Source);
                lblAddRoleException.Visible = true;
            }


        }

        protected void btnRemoveRole_Click1(object sender, EventArgs e)
        {
            try
            {
                var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();
                var selectedUser = userManager.FindByEmail(removeUser.Text).Id;
                var selectedRole = Convert.ToInt32(RemoveRolesList.SelectedValue);

                try
                {
                    switch (selectedRole)
                    {
                        case 1: //Investor
                            userManager.RemoveFromRole(selectedUser, "Investor");
                            break;
                        case 2: //Issuer
                            userManager.RemoveFromRole(selectedUser, "Issuer");
                            break;
                        case 3: //Admin
                            userManager.RemoveFromRole(selectedUser, "Admin");
                            break;
                        default:
                            //should be unreachable.
                            throw (new InvalidEnumArgumentException("No user type value was selected in drop down list."));

                    }

                    TxtGetRoles.Text = "";
                    UserEmail.Text = "";
                    removeUser.Text = "";
                }

                catch (InvalidEnumArgumentException ex)
                {
                    Console.WriteLine(ex.Message);
                    Console.WriteLine(ex.ParamName);
                    Console.WriteLine(ex.StackTrace);
                    Console.WriteLine(ex.Source);
                }
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Source);
                lblRemoveRoleException.Visible = true;
            }


        }

        protected void btnGetRoles_Click(object sender, EventArgs e)
        {
            try
            {
                RolesListBox.Visible = true;
                var userManager = Context.GetOwinContext().Get<ApplicationUserManager>();

                var selectedUser = userManager.FindByEmail(TxtGetRoles.Text).Id;

                var RolesList = userManager.GetRoles(selectedUser);

                RolesListBox.Items.Add(TxtGetRoles.Text);
                RolesListBox.Items.Add("has the following roles:");

                foreach (var item in RolesList)
                {
                    RolesListBox.Items.Add(item.ToString());
                    RolesListBox.DataBind();
                }

                TxtGetRoles.Text = "";
                UserEmail.Text = "";
                removeUser.Text = "";
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Source);
                lblGetRolesException.Visible = true;
            }


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/InvestorManagement.aspx", false);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/IssuerManagement.aspx", false);
        }
    }
}