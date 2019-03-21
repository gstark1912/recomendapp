using Nemesis.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Nemesis.DAL.Common
{
    public interface IRepository<T> where T : class
    {
        Task AddAsync(T entity);
        Task UpdateAsync(T entity);
        
        Task DeleteAsync(T entity);
        Task DeleteAsync(Expression<Func<T, bool>> where);

        Task<T> GetByIdAsync(int id);

        Task<IList<T>> GetAllAsync();

        Task<IList<T>> QueryAsync(Expression<Func<T, bool>> where);

        Task SaveChangesAsync();

        Page<T> GetPage(PagingParams pagingParams, IQueryable<T> entities);
    }
}
