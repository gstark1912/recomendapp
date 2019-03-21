using Nemesis.Integration.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nemesis.Integration.Interfaces
{
    public interface IHRSEmployeeRepository
    {
        Task<IEnumerable<Employee>> GetAllAsync();

        Task<Employee> GetAsync(string username);

        Task<IList<Employee>> GetManyAsync(IList<string> usernames);
    }
}
