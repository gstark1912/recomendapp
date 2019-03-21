using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Nemesis.Utils
{
    public static class EnumerableExtensions
    {
        public static Page<TSource> ToPage<TSource>(this IEnumerable<TSource> source, PagingParams pagingParams)
        {
            int zeroBasedPageIndex = pagingParams.PageIndex - 1;
            int itemsToSkip = zeroBasedPageIndex * pagingParams.PageSize;

            return new Page<TSource>
            {
                Items = source.Skip(itemsToSkip).Take(pagingParams.PageSize).ToList(),
                PageSize = pagingParams.PageSize,
                PageIndex = pagingParams.PageIndex,
                TotalItems = source.Count()
            };
        }
    }
}
