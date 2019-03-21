using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authentication.Cookies;

namespace Nemesis.API.Controllers
{
    [Route("api/Account")]
    public class AccountController : Controller
    {

        private readonly IConfiguration configuration;

        public AccountController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        /// <summary>
        /// Immediately invokes a CAS challenge.  The Cookie middleware uses this page as
        /// the login page that it will send users to if they are not signed in.
        /// </summary>
        [AllowAnonymous]
        [HttpGet]
        [Route("login")]
        public async Task Login(string returnUrl)
        {
            await HttpContext.ChallengeAsync("CAS", new AuthenticationProperties { RedirectUri = returnUrl });
        }

        [HttpGet("logout")]
        //public async Task<IActionResult> Logout(string returnUrl)
        public async Task Logout(string returnUrl)
        {
            //await HttpContext.SignOutAsync();
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.Response.Redirect(returnUrl);
        }

        [HttpGet]
        [Route("IsAuthenticated")]
        public bool IsAuthenticated()
        {
            return User.Identity.IsAuthenticated;
        }
    }
}