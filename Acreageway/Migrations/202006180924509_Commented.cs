namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Commented : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.AspNetUsers", "KYC_Flag");
            DropColumn("dbo.AspNetUsers", "SuitablityTestFlag");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "SuitablityTestFlag", c => c.Int(nullable: false));
            AddColumn("dbo.AspNetUsers", "KYC_Flag", c => c.Boolean(nullable: false));
        }
    }
}
