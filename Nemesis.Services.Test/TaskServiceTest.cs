using AutoMapper;
using Microsoft.Extensions.Configuration;
using Moq;
using Nemesis.DAL.Common;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using Nemesis.Dtos;
using Nemesis.Integration.Entities;
using Nemesis.Integration.Interfaces;
using Nemesis.Utils;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Xunit;


namespace Nemesis.Services.Test
{
    public class TaskServiceTest
    {
        private readonly Mock<ITaskRepository> taskRepositoryMock;
        private IMapper mapper;
        private TaskService taskService;
        private IConfiguration configuration;
        

        
        //public TaskServiceTest() {
        //    this.mapper = TestUtils.SetupAutoMapper();
        //    this.configuration = TestUtils.SetupConfiguration();
         
        //    this.hrsEmployeeRepositoryMock = new Mock<IHRSEmployeeRepository>();

        //    this.unitOfWorkMock = new Mock<IUnitOfWork>();


        //    this.taskService = new TaskService(unitOfWorkMock.Object, 
        //        taskRepositoryMock.Object, 
        //        capacityRepositoryMock.Object, 
        //        capacitiesOfficesRepositoryMock.Object, 
        //        capacitiesSenioritiesRepositoryMock.Object, 
        //        officeRepositoryMock.Object, 
        //        areaRepositoryMock.Object, 
        //        hrsEmployeeRepositoryMock.Object, 
        //        taskMemberRepositoryMock.Object,
        //        configuration, 
        //        mapper);
        //}

        //[Fact]
        //public void All_ShouldReturn_AllResults()
        //{
        //    List<Task> taskList = new List<Task>() {
        //        new Task() {
        //            Description = "test",
        //            InitiativeId = 1,
        //            Manager = "mzanger",
        //            Start = DateTime.Now,
        //            StatusId = 3,
        //            Title = "Redacción de artículos técnicos",
        //            Capacities = new List<Capacity>()
        //        },
        //        new Task() {
        //            Description = "test",
        //            InitiativeId = 3,
        //            Manager = "mzanger",
        //            Start = DateTime.Now,
        //            StatusId = 3,
        //            Title = "Colaborar en el desarrollo de aplicaciones vigentes",
        //            Capacities = new List<Capacity>()
        //        }
        //    };
        //    PagingParams pagingParams = new PagingParams(1, 4);
        //    pagingParams.SortOrderProperties = new SortOrderProperty("Id");

        //    Page<Task> page = new Page<Task>();
        //    page.Items = taskList;
            
        //    Employee employee = new Employee() { UserName = "mzanger", FirstName="Marco", LastName="Zanger"};
        //    hrsEmployeeRepositoryMock.Setup(r => r.GetAsync("mzanger")).ReturnsAsync(employee);

        //    List<Task> resultAllAsync = new List<Task>();

        //    taskRepositoryMock.Setup(r => r.GetAllAsync()).ReturnsAsync(taskList);
        //    taskRepositoryMock.Setup(r => r.GetPage(It.IsAny<PagingParams>(), It.IsAny<IQueryable<Task>>())).Returns(page);
            
        //    Page<TaskDetailDto> result = taskService.AllActiveAsync("Id",1,4).Result;
        //    Assert.NotNull(result);
        //    Assert.Equal(2, result.Items.Count);
        //}

       
    }
}
