using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace Nemesis.Integration.Mappers
{
    internal class JsonMapper
    {
        internal static T EntityFromJson<T>(string json)
        {
            var serSettings = new JsonSerializerSettings();
            serSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            var entity = JsonConvert.DeserializeObject<T>(json, serSettings);
            return entity;
        }

        internal static string EntityToJson<T>(T entity)
        {
            var serSettings = new JsonSerializerSettings();
            serSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            var entities = JsonConvert.SerializeObject(entity, serSettings);
            return entities;
        }
    }
}
