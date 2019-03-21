using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Moq;
using Nemesis.Integration.Configuration;
using Nemesis.Integration.Entities;
using Nemesis.Integration.Interfaces;
using Nemesis.Integration.Repositories;
using System;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace Nemesis.Integration.Test
{
    public class HRSEmployeeRepositoryTest
    {
        private readonly IHRSEmployeeRepository _repository;
        private readonly Mock<IConfiguration> _configuration;
        private readonly Mock<IDistributedCache> _distributedCache;

        public HRSEmployeeRepositoryTest()
        {
            var config = new ConfigurationBuilder()
            .AddJsonFile("integration.json")
            .Build();

            var options = new IntegrationOptions() {
                HRS = config["Integration:HRS"],
                CAS = config["Integration:CAS"],
            };

            _configuration = new Mock<IConfiguration>();
            _distributedCache = new Mock<IDistributedCache>();
            _configuration.Setup(configuration => configuration["Cache:Enabled"]).Returns("False");
            _repository = new HRSEmployeeRepository(Options.Create<IntegrationOptions>(options),_configuration.Object, _distributedCache.Object);
            
        }

        [Theory]
        [InlineData("bsantos")]
        [InlineData("mspasiuk")]
        public async Task GetPositive(string username)
        {
            var entity = await _repository.GetAsync(username);
            Assert.NotNull(entity);
        }

        [Theory]
        [InlineData("yinventado")]
        public async Task GetNegative(string username)
        {
            var result = await _repository.GetAsync(username);
            Assert.Null(result);
        }

        [Theory]
        [InlineData("")]
        public  void GetNull(string username)
        {
            Assert.ThrowsAsync<ArgumentNullException>(() => _repository.GetAsync(username));
        }
    }
}
