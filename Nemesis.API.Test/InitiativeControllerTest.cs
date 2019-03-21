using Microsoft.AspNetCore.Mvc;
using Moq;
using Nemesis.API.Controllers;
using Nemesis.Dtos;
using Nemesis.IServices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace Nemesis.API.Test
{
    public class InitiativeControllerTest
    {
        private Mock<IInitiativeService> InitiativeServiceMock;
        private Mock<ITaskService> TaskServiceMock;
        private InitiativeController InitiativeController;

        public InitiativeControllerTest() {
            this.InitiativeServiceMock = new Mock<IInitiativeService>();
            this.TaskServiceMock = new Mock<ITaskService>();
            this.InitiativeController = new InitiativeController(InitiativeServiceMock.Object, TaskServiceMock.Object);
        }

        [Fact]
        public void GetAll_ShouldReturnList()
        {
            IList<InitiativeDto> initiativesList = new List<InitiativeDto>();
            initiativesList.Add(new InitiativeDto { Id = 1, Name = "Marketing", ShortName = "MKT" });
            initiativesList.Add(new InitiativeDto { Id = 2, Name = "HAT", ShortName = "HAT" });
            Task<IEnumerable<InitiativeDto>> initiativesTask = Task.Run(() => initiativesList as IEnumerable<InitiativeDto>);

            InitiativeServiceMock.Setup(x => x.GetByQueryAsync(null)).Returns(initiativesTask);
            
            IActionResult result = InitiativeController.GetByFilter(null).Result;

            Assert.Equal(typeof(OkObjectResult), result.GetType());

            OkObjectResult okResult = (OkObjectResult)result;
            var resultValues = (IList<InitiativeDto>)okResult.Value;
            Assert.Equal(resultValues, initiativesList);
        }

        [Fact]
        public void GetById_Existing_ShouldReturnObject()
        {
            InitiativeDto dto = new InitiativeDto () { Id = 1, Name = "HAT", ShortName = "HAT" };
            Task<InitiativeDto> initiativeTask = Task.Run(() => dto as InitiativeDto);

            InitiativeServiceMock.Setup(x => x.GetByIdAsync(1)).Returns(initiativeTask);

            IActionResult result = InitiativeController.GetById(1).Result;

            Assert.Equal(typeof(OkObjectResult), result.GetType());

            OkObjectResult okResult = (OkObjectResult)result;
            var resultValue = (InitiativeDto)okResult.Value;
            Assert.Equal(resultValue, dto);
        }

        [Fact]
        public void GetById_Unexisting_ShouldReturnNull()
        {
            InitiativeDto dto = new InitiativeDto() { Id = 1, Name = "HAT", ShortName = "HAT" };
            Task<InitiativeDto> initiativeTask = Task.Run(() => dto as InitiativeDto);

            InitiativeServiceMock.Setup(x => x.GetByIdAsync(1)).Returns(initiativeTask);

            IActionResult result = InitiativeController.GetById(2).Result;

            Assert.Equal(typeof(OkObjectResult), result.GetType());

            OkObjectResult okResult = (OkObjectResult)result;
            Assert.Null(okResult.Value);
        }

        
    }
}

