﻿using Acreageway.Models;
using Microsoft.AspNet.Identity;
using System;
using System.IO;
using System.Web;

namespace Acreageway
{
    public partial class CreateOpportunity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender1.StartDate = DateTime.Now;
            CalendarExtender1.EndDate = DateTime.Now.AddDays(50);
            CalendarExtender2.StartDate = DateTime.Now;
            CalendarExtender2.EndDate = DateTime.Now.AddYears(2);
        }

        protected void btn_Create_Click(object sender, EventArgs e)
        {
            SaveOpportunity();
            btn_Create.Enabled = false;
        }

        public void SaveOpportunity()
        {
            Opportunity obj = new Opportunity();

            HttpPostedFile postedFile = fu_logo.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_logo.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".jpeg" || fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                obj.opportunity_imgName = filename;
                obj.opportunity_contentType = contentType;
                obj.image_data = bytes;
            }


            Guid opp_id = Guid.NewGuid();
            obj.opportunity_id = opp_id.ToString();
            obj.created_by = User.Identity.GetUserId().ToString();
            obj.opportunity_name = txt_oppotunity_name.Text.Trim();
            obj.offering_type = ddl_offeringType.SelectedItem.Text;
            obj.type_of_security = ddl_type_of_security.SelectedItem.Text;
            obj.category = ddl_category.SelectedItem.Text;
            obj.short_desc = txt_short_desc.Text.Trim();
            obj.long_desc = txt_long_desc.Text.Trim();
            obj.created_timestamp = Convert.ToDateTime(txt_startdate.Text.Trim());
            obj.expiry_timestamp = Convert.ToDateTime(txt_enddate.Text.Trim());
            obj.opportunity_status = "Entered";
            obj.price_per_security = Convert.ToDouble(txt_price_per_security.Text);
            obj.total_amt = Convert.ToDouble(txt_totalamount.Text);
            obj.is_active = true;
            obj.amt_left = Convert.ToDouble(txt_totalamount.Text);
            obj.minimum_investment_per_investor = Convert.ToDouble(txt_minimum_investment_per_investor.Text);
            obj.total_investors = Convert.ToDouble(txt_total_investors.Text);
            DAL dal = new DAL();
            dal.CreateOpportunity(obj);

            lbl_msg.ForeColor = System.Drawing.Color.Green;
            lbl_msg.Text = "Opportunity Created. Will Be Approved by the Admin.";
            
        }

        protected void btn_logo_Click1(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_logo.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_logo.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".jpeg" || fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                Application["filename"] = filename;
                Application["contentType"] = contentType;
                Application["bytes"] = bytes;
            }
        }

        protected void btn_Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OpportunityList.aspx", false);
        }
    }
}