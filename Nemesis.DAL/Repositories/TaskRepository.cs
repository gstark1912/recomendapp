using Microsoft.EntityFrameworkCore;
using Nemesis.DAL.Common;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Nemesis.DAL.Repositories
{
    public class TaskRepository : RepositoryBase<Entities.Task>, ITaskRepository
    {
        public TaskRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }

      

        public override IQueryable<Entities.Task> LoadEntity(DbSet<Entities.Task> set)
        {
            set.Include(t => t.Initiative).Load();
           
            return set;
        }
    }
}
