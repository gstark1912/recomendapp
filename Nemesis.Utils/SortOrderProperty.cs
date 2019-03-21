using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Nemesis.Utils
{
    public class SortOrderProperty
    {
        /*
        /// <summary>
        /// Order of the page. Descending or ascending
        /// </summary>
        public SortOrder Order { get; private set; }*/

        /// <summary>
        /// Property to order
        /// </summary>
        public string Property { get; private set; }

        public SortOrderProperty(/*SortOrder order,*/ string property)
        {
            /*this.Order = order;*/
            this.Property = property;
        }
    }
}
