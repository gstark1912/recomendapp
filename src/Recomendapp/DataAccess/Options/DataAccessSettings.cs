using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Recomendapp.DataAccess.Options
{
  public class DataAccessSettings
  {
    public string Host { get; set; }
    public string Port { get; set; }
    public string DbName { get; set; }
    public string User { get; set; }
    public string Password { get; set; }

    public static void RegisterConfiguration(IServiceCollection services, IConfigurationSection section)
    {
      services.Configure<DataAccessSettings>(settings =>
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
      Host = env.Contains("DB_MSSQL_CONNECTION_HOST") ? env["DB_MSSQL_CONNECTION_HOST"].ToString() : Host;
      Port = env.Contains("DB_MSSQL_CONNECTION_PORT") ? env["DB_MSSQL_CONNECTION_PORT"].ToString() : Port;
      DbName = env.Contains("DB_MSSQL_CONNECTION_NAME") ? env["DB_MSSQL_CONNECTION_NAME"].ToString() : DbName;
      User = env.Contains("DB_MSSQL_AUTH_USER") ? env["DB_MSSQL_AUTH_USER"].ToString() : User;
      Password = env.Contains("DB_MSSQL_AUTH_PASSWORD") ? env["DB_MSSQL_AUTH_PASSWORD"].ToString() : Password;
    }
  }
}
