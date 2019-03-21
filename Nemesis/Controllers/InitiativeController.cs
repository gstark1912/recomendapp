using Microsoft.AspNetCore.Mvc;
using Nemesis.IServices;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;

namespace Nemesis.API.Controllers
{
    [Produces("application/json")]
    [Route("api/initiatives")]
    [Authorize]
    public class InitiativeController : Controller
    {
        private readonly IInitiativeService initiativeService;
        private readonly ITaskService taskService;

        public InitiativeController(IInitiativeService initiativeService, ITaskService taskService)
        {
            this.initiativeService = initiativeService;
            this.taskService = taskService;
        }

        //to do
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            return Ok(await initiativeService.GetByIdAsync(id));
        }

        [HttpGet]
        [Route("")]
        public async Task<IActionResult> GetByFilter([FromQuery]string userName)
        {
            return Ok(await initiativeService.GetByQueryAsync(userName));
        }

        [HttpGet]
        [Route("authenticated-user/initiatives")] //Este endpoint es provisorio hasta que se pueda obtener el usuario logueado en el front. En ese momento llamar al GetByFilter con el userName como parametro
        public async Task<IActionResult> GetByAuthenticatedUser()
        {
            return Ok(await initiativeService.GetByQueryAsync(User.Identity.Name));
        }

        

    }
}