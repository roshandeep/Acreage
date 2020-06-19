using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace Acreageway.Admin
{
    public partial class InvestorManagement : System.Web.UI.Page
    {
        string roleType = "Investor";
        readonly SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
            if (!Page.IsPostBack)
            {
                Refresh_Data();
            }
        }

        private void Refresh_Data()
        {

            var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var role = roleManager.FindByNameAsync(roleType).Result;
            //THIS CODE WORKS, BUT DISPLAYS EVERYTHING ABOUT A USER INCLUDING HASHED PASSWORD.
            /**************************************************************************************************************************************************/
            //var admins = userManager.Users.Where(x => x.Roles.Any(role => role.RoleId == adminRole.Id.ToString())).ToList().OrderBy(d => d.Email);
            //var adminList = admins.ToList();
            //issuersGrid.DataSource = adminList;
            //issuersGrid.DataBind();
            /****************************************************************************************************************************************************/
            try
            {
                DataTable dataTable = new DataTable();
                conn.Open();
                SqlCommand cmd = new SqlCommand
                    ("SELECT u.Id, u.Email, u.PhoneNumber, u.FirstName, u.LastName, u.MailingAddress, u.Province, u.City, u.PostalCode, r.* " +
                    "FROM [dbo].[AspNetUsers] AS u " +
                    "INNER JOIN [dbo].[AspNetUserRoles] AS r " +
                    "ON [Id]=[UserId] " +
                    "WHERE [RoleId]=" +
                    "'" + role.Id.ToString() + "'");
                cmd.Connection = conn;

                SqlDataReader rdr = cmd.ExecuteReader();
                dataTable.Columns.Add("ID");
                dataTable.Columns.Add("Role");
                dataTable.Columns.Add("FirstName");
                dataTable.Columns.Add("LastName");
                dataTable.Columns.Add("Email");
                dataTable.Columns.Add("MailingAddress");
                dataTable.Columns.Add("Province");
                dataTable.Columns.Add("City");
                dataTable.Columns.Add("PostalCode");
                dataTable.Columns.Add("PhoneNumber");

                while (rdr.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["ID"] = rdr["Id"];
                    row["Role"] = roleType;
                    row["FirstName"] = rdr["FirstName"];
                    row["LastName"] = rdr["LastName"];
                    row["Email"] = rdr["Email"];
                    row["MailingAddress"] = rdr["MailingAddress"];
                    row["Province"] = rdr["Province"];
                    row["City"] = rdr["City"];
                    row["PostalCode"] = rdr["PostalCode"];
                    row["PhoneNumber"] = rdr["PhoneNumber"];
                    dataTable.Rows.Add(row);
                }

                if (dataTable.Rows.Count > 0)
                {
                    investorsGrid.DataSource = dataTable;
                    investorsGrid.DataBind();
                }
                else
                {
                    DataRow newrow = dataTable.NewRow();
                    dataTable.Rows.Add(newrow);
                    investorsGrid.DataSource = dataTable;
                    investorsGrid.DataBind();
                    int columncount = investorsGrid.Columns.Count;
                    if(columncount == 0)
                    {
                        BoundField newColumnName = new BoundField();

                        newColumnName.DataField = "New DATAfield Name";
                        newColumnName.HeaderText = "Investors";
                        investorsGrid.Columns.Add(newColumnName);
                        columncount += 1;
                    }
                    investorsGrid.Rows[0].Cells.Clear();
                    investorsGrid.Rows[0].Cells.Add(new TableCell());
                    investorsGrid.Rows[0].Cells[0].ColumnSpan = columncount + 2;
                    investorsGrid.Rows[0].Cells[0].Text = "No Records Found";
                }

                conn.Close();
                ViewState["dirState"] = dataTable;
                ViewState["sortdr"] = "Asc";
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Source);

                lblError.Text = "An error occurred when calling database. Please alert site admin to this issue.";
                lblError.Visible = true;
            }



        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = investorsGrid.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[AspNetUsers] WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", investorsGrid.DataKeys[e.RowIndex].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            investorsGrid.EditIndex = e.NewEditIndex;
            Refresh_Data();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //if (!String.IsNullOrEmpty(e.OldValues["role"].ToString()))
            //{

            //}
            //string oldRole = e.OldValues["Role"].ToString();
            //string newRole = e.NewValues["Role"].ToString();
            string userid = investorsGrid.DataKeys[e.RowIndex].Value.ToString();

            //if (oldRole != newRole)
            //{
            //    var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            //    var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //    if (roleManager.RoleExistsAsync(newRole).Result)
            //    {
            //        userManager.AddToRole(userid, newRole);
            //    }
            //    else
            //    {
            //        ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + "Error: " + newRole + " is not a known role." + "');", true);
            //    }

            //}

            GridViewRow row = investorsGrid.Rows[e.RowIndex];
            _ = (Label)row.FindControl("lblID");
            //TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textemail = (TextBox)row.Cells[0].Controls[0];
            //TextBox textphone = (TextBox)row.Cells[1].Controls[0];
            TextBox textemail = (TextBox)row.Cells[0].FindControl("txtEmail");
            TextBox textphone = (TextBox)row.Cells[1].FindControl("txtPhone");
            TextBox textfirstname = (TextBox)row.FindControl("txtFirstName");
            TextBox textlastname = (TextBox)row.FindControl("txtLastName");
            TextBox textmailingaddress = (TextBox)row.FindControl("txtMailingAddress");
            TextBox textprovince = (TextBox)row.FindControl("txtProvince");
            TextBox textcity = (TextBox)row.FindControl("txtCity");
            TextBox textpostalcode = (TextBox)row.FindControl("txtPostalCode");
            //TextBox textc = (TextBox)row.Cells[2].Controls[0];
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  
            investorsGrid.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            SqlCommand cmd = new SqlCommand("UPDATE [dbo].[AspNetUsers] SET Email='" + textemail.Text + "',PhoneNumber='" + textphone.Text 
                + "',FirstName='" + textfirstname.Text + "',LastName='" + textlastname.Text + "',MailingAddress='" + textmailingaddress.Text
                + "',Province='" + textprovince.Text + "',City='" + textcity.Text + "',PostalCode='" + textpostalcode.Text + "'WHERE Id='" + userid + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
            //GridView1.DataBind();  
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            investorsGrid.PageIndex = e.NewPageIndex;
            Refresh_Data();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            investorsGrid.EditIndex = -1;
            Refresh_Data();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                investorsGrid.DataSource = dtrslt;
                investorsGrid.DataBind();


            }

        }
    }
}