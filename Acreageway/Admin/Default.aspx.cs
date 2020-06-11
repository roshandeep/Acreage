using System;

namespace Acreageway.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = $"Is Admin? {User.IsInRole("Administrators")}";
        }
    }
}