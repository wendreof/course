using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace course.api
{
    /// <summary>
    /// Class Program 
    /// </summary>
    public class Program
    {
        /// <summary>
        /// Main Method 
        /// </summary>
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        /// <summary>
        /// CreateHostBuilder 
        /// </summary>
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
