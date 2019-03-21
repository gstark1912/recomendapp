using Nemesis.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nemesis.IServices
{
    public interface IInitiativeService
    {
        Task<InitiativeDto> GetByIdAsync(int id);

        Task<IEnumerable<InitiativeDto>> AllAsync();

        Task<IEnumerable<InitiativeDto>> GetByQueryAsync(string userName);
    }
}
