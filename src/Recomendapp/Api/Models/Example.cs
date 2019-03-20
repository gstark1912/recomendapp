using System;
using System.ComponentModel.DataAnnotations;

namespace Recomendapp.Api.Models
{
    public class Example : ModelBase
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "{0} is required.")]
        public string Name { get; set; }
    }
}