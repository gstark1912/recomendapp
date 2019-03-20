using AutoMapper;

namespace Recomendapp.Api.Mapping
{
    public class StatusProfile : Profile
    {
    public StatusProfile()
    {
          CreateMap<Business.Monitoring.Monitoring, Api.Models.Monitoring>();
          CreateMap<Business.Monitoring.Component, Api.Models.Component>();
    }
  }
}
