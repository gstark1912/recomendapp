using AutoMapper;
using System;
using Xunit;

namespace Nemesis.Mapper.Test
{
    public class MappingTest
    {
        [Fact]
        public void TestProjectMapping()
        {
            var mappingProfile = new ProjectMappingProfile();

            var config = new MapperConfiguration(cfe =>
            {
                cfe.AddProfiles("Nemesis.Mapper");
                cfe.CreateMissingTypeMaps = true;
            });
            var mapper = new AutoMapper.Mapper(config);

            (mapper as IMapper).ConfigurationProvider.AssertConfigurationIsValid();
        }

    }
}
