namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FirstName1 : DbMigration
    {
        public override void Up()
        {
            //AddColumn("dbo.AspNetUsers", "FirstName", c => c.String());
            //AddColumn("dbo.AspNetUsers", "LastName", c => c.String());
            //AddColumn("dbo.AspNetUsers", "MailingAddress", c => c.String());
            //AddColumn("dbo.AspNetUsers", "City", c => c.String());
            //AddColumn("dbo.AspNetUsers", "Province", c => c.String());
            //AddColumn("dbo.AspNetUsers", "PostalCode", c => c.String());
            //AddColumn("dbo.AspNetUsers", "KYC_Flag", c => c.Boolean(nullable: true));
            //AddColumn("dbo.AspNetUsers", "SuitablityTestFlag", c => c.Int(nullable: true));
        }

        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "SuitablityTestFlag");
            DropColumn("dbo.AspNetUsers", "KYC_Flag");
            DropColumn("dbo.AspNetUsers", "PostalCode");
            DropColumn("dbo.AspNetUsers", "Province");
            DropColumn("dbo.AspNetUsers", "City");
            DropColumn("dbo.AspNetUsers", "MailingAddress");
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "FirstName");
        }
    }
}
