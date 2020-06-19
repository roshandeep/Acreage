namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ActuallyNullable : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AspNetUsers", "KYC_Flag", c => c.Boolean());
            AlterColumn("dbo.AspNetUsers", "SuitablityTestFlag", c => c.Int());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AspNetUsers", "SuitablityTestFlag", c => c.Int(nullable: false));
            AlterColumn("dbo.AspNetUsers", "KYC_Flag", c => c.Boolean(nullable: false));
        }
    }
}
