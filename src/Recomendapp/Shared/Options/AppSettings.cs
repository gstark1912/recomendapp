using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Recomendapp.Options
{
  public class AppSettings
  {
    public string AppName { get; set; }
    public string ApplicationId { get; set; }
    public string DataDirectory { get; set; }
    public string TempDirectory { get; set; }

    public static void RegisterConfiguration(IServiceCollection services, IConfigurationSection section)
    {
      services.Configure<AppSettings>(settings =>
      {
        settings.LoadFromConfigSection(section);
        settings.OverrideFromEnvironmentVariables();
      });
    }

    private void LoadFromConfigSection(IConfigurationSection section)
    {
      section.Bind(this);
    }

    private void OverrideFromEnvironmentVariables()
    {
      var env = Environment.GetEnvironmentVariables();
      AppName = env.Contains("APPSETTINGS_APPNAME") ? env["APPSETTINGS_APPNAME"].ToString() : AppName;
      ApplicationId = env.Contains("APPSETTINGS_APPLICATIONID") ? env["APPSETTINGS_APPLICATIONID"].ToString() : ApplicationId;
      DataDirectory = env.Contains("APPSETTINGS_DATADIRECTORY") ? env["APPSETTINGS_DATADIRECTORY"].ToString() : DataDirectory;
      TempDirectory = env.Contains("APPSETTINGS_TEMPDIRECTORY") ? env["APPSETTINGS_TEMPDIRECTORY"].ToString() : TempDirectory;
    }
  }
}
