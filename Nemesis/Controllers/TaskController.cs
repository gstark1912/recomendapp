using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nemesis.IServices;
using Microsoft.AspNetCore.Authorization;
using Nemesis.Dtos;
using Microsoft.AspNetCore.Http;
using Nemesis.Security;

namespace Nemesis.API.Controllers
{
    [Route("api/tasks")]
    [Authorize]
    public class TaskController : Controller
    {
        private readonly ITaskService taskService;
      
        private readonly IInitiativeService initiativeService;
        private readonly IAuthorizationService authorizationService;

        public TaskController(ITaskService taskService, IInitiativeService initiativeService, IAuthorizationService authorizationService)
        {
            this.taskService = taskService;
            
            this.authorizationService = authorizationService;
            this.initiativeService = initiativeService;
        }

        //// to do
        //[HttpGet("")]
        //public async Task<IActionResult> All(string sortOrderProperty, int pageIndex, int pageSize)
        //{
        //    //var result = await taskService.AllActiveAsync(sortOrderProperty, pageIndex, pageSize);
        //    //return Ok(result);
        //}

        //[HttpGet("{id}", Name = "GetTask")]
        //public async Task<IActionResult> Get(int id)
        //{
        //   // if (id == 0)
        //   // {
        //   //     return BadRequest();
        //   // }

        //   //// var result = await taskService.GetByIdAsync(id);

        //   // if (result == null)
        //   // {
        //   //     return NotFound();
        //   // }

        //   // return Ok(result);
        //}

    }
}
