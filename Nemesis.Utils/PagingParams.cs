using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Nemesis.Utils
{
    public class PagingParams
    {
        public PagingParams(int pageIndex, int pageSize)
        {
            this.PageIndex = pageIndex;
            this.PageSize = pageSize;
        }

        public PagingParams(int pageIndex, int pageSize, string filter)
            : this(pageIndex, pageSize)
        {
            this.PageFilter = filter;
        }

        public PagingParams(int pageIndex, int pageSize, int siteId)
            : this(pageIndex, pageSize)
        {
            this.SiteId = siteId;
        }

        public PagingParams(int pageIndex, int pageSize, string filter, int siteId)
            : this(pageIndex, pageSize, filter)
        {
            this.SiteId = siteId;
        }

        //protected PagingParams()
        //{
        //    this.SortOrderProperties = new SortOrderProperty();
        //}

        /// <summary>
        /// Page number to get.
        /// </summary>
        public int PageIndex { get; private set; }

        /// <summary>
        /// Quantity of elements by page.
        /// </summary>
        public int PageSize { get; private set; }

        /// <summary>
        /// Parameters to filter.
        /// </summary>
        public string PageFilter { get; private set; }

        public SortOrderProperty SortOrderProperties { get; set; }

        /// <summary>
        /// Gets a value indicating to which site it belonging
        /// </summary>
        public int? SiteId { get; private set; }

        //public PagingParams WithOrder(string property, SortOrder order)
        //{
        //    this.SortOrderProperties.Add(new SortOrderProperty(order, property));

        //    return this;
        //}

        public PagingParams WithFilter(string filter)
        {
            PageFilter = filter;

            return this;
        }
    }
}
