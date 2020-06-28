namespace Acreageway.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Accredited : DbMigration
    {
        public override void Up()
        {
            //DropColumn("dbo.AspNetUsers", "Accredited");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "Accredited", c => c.Boolean());
        }
    }
}
