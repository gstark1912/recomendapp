using Microsoft.EntityFrameworkCore;
using Nemesis.DAL.Common;
using Nemesis.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Nemesis.DAL
{
    public abstract class RepositoryBase<T> where T : class
    {
        #region Properties

        protected NemesisContext dataContext;
        protected readonly DbSet<T> dbSet;

        private IDbFactory DbFactory { get; set; }
        private NemesisContext DbContext
        {
            get { return dataContext ?? (dataContext = DbFactory.Init()); }
        }

        #endregion

        protected RepositoryBase(IDbFactory dbFactory)
        {
            DbFactory = dbFactory;
            dbSet = DbContext.Set<T>();
        }

        #region Implementation

        public virtual IQueryable<T> LoadEntity(DbSet<T> set)
        {
            return set;
        }

        public virtual async Task AddAsync(T entity)
        {
            await dbSet.AddAsync(entity);
        }

        public virtual async Task UpdateAsync(T entity)
        {
            dbSet.Attach(entity);
        }

        public virtual async Task DeleteAsync(T entity)
        {
            dbSet.Remove(entity);
        }

        public virtual async Task DeleteAsync(Expression<Func<T, bool>> where)
        {
            IEnumerable<T> objects = dbSet.Where<T>(where).AsEnumerable();
            foreach (T obj in objects)
            {
                dbSet.Remove(obj);
            }
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            this.LoadEntity(dbSet);
            return await dbSet.FindAsync(id);
        }

        public virtual async Task<IList<T>> GetAllAsync()
        {
            return await this.LoadEntity(dbSet).ToListAsync();
        }

        //public virtual async Task<IQueryable<T>> QueryAsync(Expression<Func<T, bool>> where)
        //{
        //   // Expression<Func<Task, x => x.Id == 1 >>
        //    return this.LoadEntity(dbSet).Where(where).ToPage;
        //}

        public virtual async Task<IList<T>> QueryAsync(Expression<Func<T, bool>> where)
        {
            return await this.LoadEntity(dbSet).Where(where).ToListAsync();
        }

        public virtual async Task SaveChangesAsync()
        {
            await DbContext.SaveChangesAsync();
        }

        public Page<T> GetPage(PagingParams pagingParams, IQueryable<T> entities)
        {
            entities = entities.OrderBy(x => x.GetType().GetProperty(pagingParams.SortOrderProperties.Property ?? "Id" ).GetValue(x, null));

            return entities.ToPage(pagingParams);
        }
        #endregion
    }
}
