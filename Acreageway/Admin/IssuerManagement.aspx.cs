using Microsoft.AspNet.Identity.Owin;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace Acreageway.Admin
{
    public partial class IssuerManagement : System.Web.UI.Page
    {
        string roleType = "Issuer";
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
                    ("SELECT u.Id, u.Email, u.PhoneNumber, r.* " +
                    "FROM [dbo].[AspNetUsers] AS u " +
                    "INNER JOIN [dbo].[AspNetUserRoles] AS r " +
                    "ON [Id]=[UserId] " +
                    "WHERE [RoleId]=" +
                    "'" + role.Id.ToString() + "'");
                cmd.Connection = conn;

                SqlDataReader rdr = cmd.ExecuteReader();
                dataTable.Columns.Add("ID");
                dataTable.Columns.Add("Role");
                dataTable.Columns.Add("Email");
                dataTable.Columns.Add("PhoneNumber");

                while (rdr.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["ID"] = rdr["Id"];
                    row["Role"] = roleType;
                    row["Email"] = rdr["Email"];
                    row["PhoneNumber"] = rdr["PhoneNumber"];
                    dataTable.Rows.Add(row);
                }

                if (dataTable.Rows.Count > 0)
                {
                    issuersGrid.DataSource = dataTable;
                    issuersGrid.DataBind();
                }
                else
                {
                    dataTable.NewRow();
                    issuersGrid.DataSource = dataTable;
                    issuersGrid.DataBind();
                    int columncount = issuersGrid.Columns.Count;
                    issuersGrid.Rows[0].Cells.Clear();
                    issuersGrid.Rows[0].Cells.Add(new TableCell());
                    issuersGrid.Rows[0].Cells[0].ColumnSpan = columncount;
                    issuersGrid.Rows[0].Cells[0].Text = "No Records Found";
                }
               
                conn.Close();
                ViewState["dirState"] = dataTable;
                ViewState["sortdr"] = "Asc";
            }
            catch(SqlException ex)
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
            GridViewRow row = issuersGrid.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[AspNetUsers] WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", issuersGrid.DataKeys[e.RowIndex].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            issuersGrid.EditIndex = e.NewEditIndex;
            Refresh_Data();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string userid = issuersGrid.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = issuersGrid.Rows[e.RowIndex];
            _ = (Label)row.FindControl("lblID");
            //TextBox txtname=(TextBox)gr.cell[].control[];  
            //TextBox textemail = (TextBox)row.Cells[0].Controls[0];
            //TextBox textphone = (TextBox)row.Cells[1].Controls[0];
            TextBox textemail = (TextBox)row.Cells[0].FindControl("txtEmail");
            TextBox textphone = (TextBox)row.Cells[1].FindControl("txtPhone");
            //TextBox textc = (TextBox)row.Cells[2].Controls[0];
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  
            issuersGrid.EditIndex = -1;
            conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
            SqlCommand cmd = new SqlCommand("UPDATE [dbo].[AspNetUsers] SET Email='" + textemail.Text + "',PhoneNumber='" + textphone.Text + "'WHERE Id='" + userid + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Refresh_Data();
            //GridView1.DataBind();  
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            issuersGrid.PageIndex = e.NewPageIndex;
            Refresh_Data();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            issuersGrid.EditIndex = -1;
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
                issuersGrid.DataSource = dtrslt;
                issuersGrid.DataBind();


            }

        }
    }
}