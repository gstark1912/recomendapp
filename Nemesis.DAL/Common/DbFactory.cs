using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Common
{
    public class DbFactory : Disposable, IDbFactory
    {
        IServiceProvider serviceProvider;
        NemesisContext dbContext;
        IConfiguration configuration;


        /// <summary>
        /// Polemico el NemesisContext. Ver https://docs.microsoft.com/en-us/ef/core/miscellaneous/configuring-dbcontext#using-dbcontext-with-dependency-injection
        /// </summary>
        /// <param name="serviceProvider"></param>
        /// <param name="configuration"></param>
        /// <param name="dbContext"></param>
        public DbFactory(IServiceProvider serviceProvider, IConfiguration configuration, NemesisContext dbContext)
        {
            this.serviceProvider = serviceProvider;
            this.configuration = configuration;
            this.dbContext = dbContext;
        }

        public NemesisContext Init()
        {
            return dbContext;
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}
