using Nemesis.DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Nemesis.DAL.Common
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IDbFactory dbFactory;
        private NemesisContext dbContext;

        private readonly ITaskRepository taskRepository;
        private readonly IInitiativeRepository initiativeRepository;

        public UnitOfWork(IDbFactory dbFactory, ITaskRepository taskRepository, IInitiativeRepository initiativeRepository)
        {
            this.dbFactory = dbFactory;
            this.taskRepository = taskRepository;
            this.initiativeRepository = initiativeRepository;
        }

        public NemesisContext DbContext
        {
            get { return dbContext ?? (dbContext = dbFactory.Init()); }
        }

        public void Commit()
        {
            DbContext.Commit();
        }
    }
}
