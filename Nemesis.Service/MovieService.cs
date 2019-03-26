using Autofac.Extras.DynamicProxy;
using AutoMapper;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using Nemesis.Dtos;
using Nemesis.Integration.Interfaces;
using Nemesis.IServices;
using Nemesis.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Nemesis.Services
{
    public class MovieService : IMovieService
    {
        private readonly IMovieRepository movieRepository;
        private readonly IMapper mapper;

        public MovieService(IMovieRepository _movieRepository, IHRSEmployeeRepository employeeRepository, IMapper mapper)
        {
            this.movieRepository = _movieRepository;
            this.mapper = mapper;
        }

        public async Task<IEnumerable<MovieDto>> GetByMovieName(string movieName)
        {
            Expression<Func<Movie, bool>> FilterByMovieName(string movie)
            {
                return x => x.Title.Contains(movie);
            }

            var expression = FilterByMovieName(movieName);
            var result = await this.movieRepository.QueryAsync(expression);
            return this.mapper.Map<List<MovieDto>>(result);
        }     
    }
}
