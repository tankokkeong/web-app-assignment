using Microsoft.Owin;
using Owin;
[assembly: OwinStartup(typeof(web_app_assignment.Startup))]
namespace web_app_assignment
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // Any connection or hub wire up and configuration should go here
            app.MapSignalR();
        }
    }
}