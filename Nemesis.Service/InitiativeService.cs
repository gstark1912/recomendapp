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
    [Intercept(typeof(LoggerInterceptor))]
    public class InitiativeService : IInitiativeService
    {
        private readonly IInitiativeRepository initiativeRepository;
        private readonly IMapper mapper;
        private readonly IHRSEmployeeRepository employeeRepository;

        public InitiativeService(IInitiativeRepository initiativeRepository, IHRSEmployeeRepository employeeRepository, IMapper mapper)
        {
            this.employeeRepository = employeeRepository;
            this.initiativeRepository = initiativeRepository;
            this.mapper = mapper;
        }

        public async Task<IEnumerable<InitiativeDto>> AllAsync()
        {
            var result = await this.initiativeRepository.GetAllAsync();
            return this.mapper.Map<IList<InitiativeDto>>(result);
        }

        public async Task<InitiativeDto> GetByIdAsync(int id)
        {
            var result = await this.initiativeRepository.GetByIdAsync(id);
            return this.mapper.Map<InitiativeDto>(result);
        }

        public async Task<IEnumerable<InitiativeDto>> GetByQueryAsync(string userName)
        {
            throw new NotImplementedException();
        }

      

        


    }
}
