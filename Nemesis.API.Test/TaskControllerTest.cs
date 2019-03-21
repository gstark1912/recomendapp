using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Moq;
using Nemesis.API.Controllers;
using Nemesis.Dtos;
using Nemesis.IServices;
using Nemesis.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace Nemesis.API.Test
{
    public class TaskControllerTest
    {
        Mock<ITaskService> taskServiceMock;
        Mock<IInitiativeService> initiativeService;
        Mock<IAuthorizationService> authorizationService;

        public TaskControllerTest()
        {
            taskServiceMock = new Mock<ITaskService>();
           
            initiativeService = new Mock<IInitiativeService>();
            authorizationService = new Mock<IAuthorizationService>();
        }

        [Fact]
        public async System.Threading.Tasks.Task All_StatusCode200()
        {
            ////Arrange
            //var taskController = new TaskController(taskServiceMock.Object, joinTaskService.Object, initiativeService.Object, authorizationService.Object);
            //Page<TaskDetailDto> page = new Page<TaskDetailDto>(); 
            
            //List<TaskDetailDto> taskList = new List<TaskDetailDto>();
            //taskList.Add(new TaskDetailDto
            //{
            //    Id = 1,
            //    Title = "Tarea1"
            //});
            //taskList.Add(new TaskDetailDto
            //{
            //    Id = 2,
            //    Title = "Tarea2"
            //});
            //page.Items = taskList;
            //taskServiceMock.Setup(x => x.AllActiveAsync("Id",1,1)).ReturnsAsync(page);

            //var actionResult = await taskController.All("Id",1,1);

            //Assert.NotNull(actionResult);
            //Assert.Equal(typeof(OkObjectResult), actionResult.GetType()); //expect actionResult to be OkObjectResult
            //var okResult = actionResult as OkObjectResult;
            //Assert.Equal(200, okResult.StatusCode);
            //Assert.Equal(page, okResult.Value);
        }

        

        //[Fact]
        //public async System.Threading.Tasks.Task Get_BadRequest()
        //{
        //    //Arrange
        //    var taskController = new TaskController(taskServiceMock.Object, initiativeService.Object, authorizationService.Object);

        //    var actionResult = await taskController.Get(0);
        //    var badResult = actionResult as BadRequestResult;

        //    Assert.NotNull(actionResult);
        //    Assert.Equal(400, badResult.StatusCode);
        //}

        //[Fact]
        //public async System.Threading.Tasks.Task Get_NotFound()
        //{
        //    //Arrange
        //    var taskController = new TaskController(taskServiceMock.Object, initiativeService.Object, authorizationService.Object);

        //    var actionResult = await taskController.Get(1);
        //    var notFoundResult = actionResult as NotFoundResult;

        //    Assert.NotNull(actionResult);
        //    Assert.Equal(404, notFoundResult.StatusCode);
        //}

    }
}
