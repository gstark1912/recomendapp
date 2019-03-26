using Nemesis.DAL.Common;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Repositories
{
    public class MovieRepository : RepositoryBase<Movie>, IMovieRepository
    {
        public MovieRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
    }
}
