using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Acreageway.Startup))]
namespace Acreageway
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
