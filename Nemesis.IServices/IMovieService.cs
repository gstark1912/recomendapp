using Nemesis.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Nemesis.IServices
{
    public interface IMovieService
    {
        Task<IEnumerable<MovieDto>> GetByMovieName(string movieName);
    }
}
