using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Recomendapp.Business.Monitoring
{
  public class StatusReader : IStatusReader
  {
    public Task<Monitoring> GetStatus()
    {
      return Task.FromResult(new Monitoring()
      {
        Components = new Component[]
               {
                     new Component()
                     {
                          Details = "Some backend is ok",
                          Name = "Some backend",
                          Status = Status.ok,
                          Type = "API"
                     },
                     new Component()
                     {
                          Details = "Some database is not ok",
                          Name = "Some database",
                          Status = Status.error,
                          Type = "Database"
                     }
               },
        Status = Status.error
      });
    }
  }
}
