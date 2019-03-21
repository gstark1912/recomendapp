using AutoMapper;
using Moq;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using Nemesis.DAL.Repositories;
using Nemesis.Dtos;
using Nemesis.IServices;
using Nemesis.Mapper;
using System;
using System.Collections.Generic;
using Xunit;
using System.Threading;
using System.Linq;
using System.Linq.Expressions;
using Nemesis.Integration.Interfaces;

namespace Nemesis.Services.Test
{

    public class InitiativeServiceTest
    {
        private readonly Mock<IInitiativeRepository> initiativeRepositoryMock;
        private readonly Mock<IHRSEmployeeRepository> employeeRepositoryMock;
        private IMapper mapper;
        private InitiativeService iniatiativeService;

        public InitiativeServiceTest()
        {
            this.initiativeRepositoryMock = new Mock<IInitiativeRepository>();
            this.employeeRepositoryMock = new Mock<IHRSEmployeeRepository>();
            mapper = TestUtils.SetupAutoMapper();
            iniatiativeService = new InitiativeService(this.initiativeRepositoryMock.Object, this.employeeRepositoryMock.Object, this.mapper);
            
        }
        

        [Fact]
        public void GetInitiativeById_ShouldReturnOneValue()
        {
            initiativeRepositoryMock.Setup(r => r.GetByIdAsync(1)).Returns(System.Threading.Tasks.Task.FromResult( new DAL.Entities.Initiative { Id = 1, Name = "Test1" }));
            var result = iniatiativeService.GetByIdAsync(1).Result;
            Assert.NotNull(result);

        }

        [Fact]
        public void GetInitiativeById_ShouldReturnNull()
        {
            var result = iniatiativeService.GetByIdAsync(2).Result;
            Assert.Null(result);
        }

        [Fact]
        public void All_ShouldReturn_TwoResult()
        {
            List<Initiative> initiativeList = new List<Initiative>
            {
                new Initiative {Id=1, Name="Test1"},
                new Initiative {Id=2, Name="Test2"}
            };
            initiativeRepositoryMock.Setup(r => r.GetAllAsync()).ReturnsAsync(initiativeList);
            IEnumerable<InitiativeDto> result = iniatiativeService.AllAsync().Result;
            Assert.NotNull(result);
            Assert.Equal(2, result.Count());
        }

        


    }
}
