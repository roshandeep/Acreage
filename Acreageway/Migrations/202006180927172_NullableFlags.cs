namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class NullableFlags : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "KYC_Flag", c => c.Boolean(nullable: false));
            AddColumn("dbo.AspNetUsers", "SuitablityTestFlag", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "SuitablityTestFlag");
            DropColumn("dbo.AspNetUsers", "KYC_Flag");
        }
    }
}
