using Nemesis.DAL.Common;
using Nemesis.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Nemesis.DAL.Interfaces
{
    public interface ITaskRepository: IRepository<Entities.Task>
    {
        
    }
}
