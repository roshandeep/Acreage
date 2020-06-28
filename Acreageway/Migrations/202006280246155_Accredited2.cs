namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Accredited2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Accredited", c => c.Boolean());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "Accredited");
        }
    }
}
