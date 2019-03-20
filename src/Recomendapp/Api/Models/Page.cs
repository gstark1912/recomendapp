using System.Collections.Generic;

namespace Recomendapp.Api.Models
{
	public class Page<TModel>
	{
		public IEnumerable<TModel> Data { get; set; }
		public long TotalCount { get; set; }
	}
}