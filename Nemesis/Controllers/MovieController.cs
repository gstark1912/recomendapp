using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nemesis.IServices;

namespace Nemesis.API.Controllers
{
    public class MovieController : Controller
    {

        private readonly IMovieService _movieService;

        public MovieController(IMovieService movieService)
        {
            this._movieService = movieService;
        } 
        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        [Route("")]
        public async Task<IActionResult> GetByFilter([FromQuery]string movieName)
        {
            return Ok(await _movieService.GetByMovieName(movieName));
        }
    }
}