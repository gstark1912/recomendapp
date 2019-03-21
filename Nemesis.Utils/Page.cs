using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.Utils
{
    public class Page<T>
    {
        public IList<T> Items { get; set; } = new List<T>();

        public int PageSize { get; set; }

        public int PageIndex { get; set; }

        public int TotalItems { get; set; }

        public int TotalPages
        {
            get
            {
                if (this.TotalItems.Equals(0))
                {
                    return 1;
                }

                int pages = (this.TotalItems / this.PageSize) + 1;

                if (this.TotalItems % this.PageSize == 0)
                {
                    return pages - 1;
                }
                else
                {
                    return pages;
                }
            }
        }

    }
}
