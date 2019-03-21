using Microsoft.AspNetCore.Authentication;
using Nemesis.Integration.Interfaces;
using Nemesis.Integration.Repositories;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Nemesis.Security
{
    /// <summary>
    /// Experimento
    /// </summary>
    public class ClaimsTransformer : IClaimsTransformation
    {

        private readonly IHRSEmployeeRepository employeeRepository;

        public ClaimsTransformer(HRSEmployeeRepository employeeRepository)
        {
            this.employeeRepository = employeeRepository;
        }

        public Task<ClaimsPrincipal> TransformAsync(ClaimsPrincipal principal)
        {

            var employee = employeeRepository.GetAsync(principal.Identity.Name).Result;
            IList<Claim> userClaims = new List<Claim>();
            userClaims.Add(new Claim("transformedOn", DateTime.Now.ToString()));

            ((ClaimsIdentity)principal.Identity).AddClaims(userClaims);



            return Task.FromResult(principal);
        }
    }
}
