using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Web;

namespace Acreageway
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Addrole_Click(object sender, EventArgs e)
        {
            var roleManager = Context.GetOwinContext().Get<ApplicationRoleManager>();

            roleManager.Create(new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "Admin"
            });

        }

        protected void AddUserRole_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var result = manager.AddToRole("5151f34a-6b80-421d-836b-16a022f5848a", "Admin");

        }
    }
}