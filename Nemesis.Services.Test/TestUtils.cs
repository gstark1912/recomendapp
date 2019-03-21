using AutoMapper;
using Microsoft.Extensions.Configuration;
using Nemesis.Mapper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Nemesis.Services.Test
{
    public class TestUtils
    {
        public static IMapper SetupAutoMapper()
        {
            var mappingProfile = new ProjectMappingProfile();

            var config = new MapperConfiguration(cfe =>
            {
                cfe.AddProfiles("Nemesis.Mapper");
                cfe.CreateMissingTypeMaps = true;
            });
            return new AutoMapper.Mapper(config);
        }

        public static IConfiguration SetupConfiguration()
        {
            return new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .AddJsonFile($"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Production"}.json", optional: true)
            .Build();
        }
    }
}
