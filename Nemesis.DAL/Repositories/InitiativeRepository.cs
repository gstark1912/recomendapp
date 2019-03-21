using Nemesis.DAL.Common;
using Nemesis.DAL.Entities;
using Nemesis.DAL.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Nemesis.DAL.Repositories
{
    public class InitiativeRepository : RepositoryBase<Initiative>, IInitiativeRepository
    {
        public InitiativeRepository(IDbFactory dbFactory) 
            :base(dbFactory)
        {
        }

        
    }

}
