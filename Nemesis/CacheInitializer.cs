using Microsoft.Extensions.Hosting;
using Nemesis.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Serilog;
using Serilog.Events;
using Microsoft.Extensions.Configuration;

namespace Nemesis.API
{
    public class CacheInitializer : IHostedService, IDisposable
    {

        private readonly ILogger logger;
      
        private IConfiguration configuration;
        private Timer timer;

        public CacheInitializer(ILogger logger, IConfiguration configuration)
        {
            this.logger = logger;
            this.configuration = configuration;
        }



        public Task StartAsync(CancellationToken cancellationToken)
        {
            Log.Write(LogEventLevel.Information, "Initializing cache");
            timer = new Timer(InitializeCache, null, TimeSpan.Zero, TimeSpan.FromHours(8));
            return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            Log.Write(LogEventLevel.Information, "Stopping cache initializer");
            timer?.Change(Timeout.Infinite, 0);
            return Task.CompletedTask;
        }

        public void Dispose()
        {
            timer?.Dispose();
        }

        private void InitializeCache(object state)
        {
            if (configuration["Cache:Enabled"]==bool.TrueString)
            {
                Log.Write(LogEventLevel.Information, "Cache updating");
                //employeeService.InitializeCache();
            }
            else
            {
                Log.Write(LogEventLevel.Information, "Cache not enabled");
            }


        }
    }
}
