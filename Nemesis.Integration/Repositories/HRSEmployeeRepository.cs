using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Nemesis.Integration.Configuration;
using Nemesis.Integration.Entities;
using Nemesis.Integration.Interfaces;
using Nemesis.Integration.Mappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Nemesis.Integration.Repositories
{
    public class HRSEmployeeRepository : IHRSEmployeeRepository
    {
       
        private readonly IDistributedCache distributedCache;
        private readonly IntegrationOptions integrationConfiguration;
        private readonly IConfiguration configuration;
        private readonly DistributedCacheEntryOptions options;

        private const string cacheKey = "user";
        private const string allEmployessKey = "allEmployees";
        private readonly bool CacheEnabled;

        public HRSEmployeeRepository(IOptions<IntegrationOptions> integrationConfiguration, IConfiguration configuration, IDistributedCache distributedCache)
        {
            this.distributedCache = distributedCache;
            if (integrationConfiguration == null)
            {
                throw new ArgumentNullException(nameof(integrationConfiguration));
            }
            this.integrationConfiguration = integrationConfiguration.Value;
            CacheEnabled = bool.Parse(configuration["Cache:Enabled"]);
            options = new DistributedCacheEntryOptions();
            options.AbsoluteExpirationRelativeToNow = TimeSpan.FromDays(1);
        }

        public async Task<IList<Employee>> GetManyAsync(IList<string> usernames)
        {
            var tasks = usernames.Select(this.GetAsync);
            return await Task.WhenAll(tasks);
        }

        public async Task<Employee> GetAsync(string username)
        {
            if (String.IsNullOrEmpty(username))
            {
                throw new ArgumentNullException(nameof(username));
            }
/*

            var requestString = $"{this.configuration.HRS}/?username={username}";
            var request = await this.DoHttpRequest(requestString);
            return String.IsNullOrEmpty(request) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(request).FirstOrDefault();
        }

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            var requestString = $"{this.configuration.Staffing}";
            var request = await this.DoHttpRequest(requestString);
            return String.IsNullOrEmpty(request) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(request);
        }

        private async Task<string> DoHttpRequest(string uri)
        {
            var httpClient = new HttpClient();
            var response = await httpClient.GetAsync(uri);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsStringAsync();
        }
*/
            var requestString = $"?username={username}";
            var key = $"{cacheKey}:{username}";
            if (CacheEnabled)
            {
                
                var employee = distributedCache.Get(key);
                if (employee!=null)
                {
                    return JsonMapper.EntityFromJson<IEnumerable<Employee>>(Encoding.UTF8.GetString(employee)).FirstOrDefault();
                }
                else
                {
                    var requestToCache = await this.DoHttpRequest(requestString);
                    if (!String.IsNullOrEmpty(requestToCache))
                    {
                        distributedCache.Set(key, Encoding.UTF8.GetBytes(requestToCache), options);
                    }
                    return String.IsNullOrEmpty(requestToCache) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(requestToCache).FirstOrDefault();
                }
            }

            var request = await this.DoHttpRequest(requestString);            
            return String.IsNullOrEmpty(request) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(request).FirstOrDefault();
        }

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            var requestString = $"all";

            if (CacheEnabled)
            {
                var allEmployess = distributedCache.Get(allEmployessKey);
                if (allEmployess!=null)
                {
                    return JsonMapper.EntityFromJson<IEnumerable<Employee>>(Encoding.UTF8.GetString(allEmployess));
                }
                else
                {
                    var requestToCache = await this.DoHttpRequest(requestString);
                    if (!string.IsNullOrEmpty(requestToCache))
                    {
                        distributedCache.Set(allEmployessKey, Encoding.UTF8.GetBytes(requestToCache), options);
                    }
                    return String.IsNullOrEmpty(requestToCache) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(requestToCache);
                }
            }


            var request = await this.DoHttpRequest(requestString);
                        
            return String.IsNullOrEmpty(request) ? null : JsonMapper.EntityFromJson<IEnumerable<Employee>>(request);
        }
    

    private async Task<string> DoHttpRequest(string uri)
        {
            var fullUri = $"{this.integrationConfiguration.HRS}/{uri}";
            var httpClient = new HttpClient();
            var response = await httpClient.GetAsync(fullUri);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsStringAsync();
        }
    }
}
