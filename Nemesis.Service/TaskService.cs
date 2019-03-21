using Nemesis.IServices;
using System.Collections.Generic;
using Nemesis.Dtos;
using Nemesis.DAL.Interfaces;
using AutoMapper;
using Nemesis.Integration.Interfaces;
using Nemesis.DAL.Entities;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Nemesis.Utils;
using Autofac.Extras.DynamicProxy;
using Nemesis.DAL.Common;
using Transactions;

namespace Nemesis.Services
{
    [Intercept(typeof(LoggerInterceptor))]
    [Intercept(typeof(TransactionalInterceptor))]
    public class TaskService : ITaskService
    {
        private readonly ITaskRepository taskRepository;
       
        private readonly IHRSEmployeeRepository employeeRepository;
    
        private readonly IMapper mapper;
        private readonly IConfiguration configuration;
        private readonly IUnitOfWork unitOfWork;
      
        
        public TaskService(
            IUnitOfWork unitOfWork,
            ITaskRepository taskRepository,
          
            IHRSEmployeeRepository employeeRepository,
           
            IConfiguration configuration,
            IMapper mapper)
        {
            this.taskRepository = taskRepository;
            this.employeeRepository = employeeRepository;
          
            this.configuration = configuration;
          
            this.mapper = mapper;
            this.unitOfWork = unitOfWork;
        }

   
    }
}
