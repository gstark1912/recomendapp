using AutoMapper;
using Nemesis.DAL.Entities;
using Nemesis.Dtos;
using Nemesis.Integration.Entities;
using System;
using System.Linq;

namespace Nemesis.Mapper
{
    public class ProjectMappingProfile : Profile
    {
        public ProjectMappingProfile()
        {
           


            CreateMap<TaskDto, Task>();

            
            CreateMap<Initiative, InitiativeDto>();

         
        }
    }
}
