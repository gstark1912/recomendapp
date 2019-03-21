using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Nemesis.DAL.Entities
{
    public class Task
    {
        public int Id { get; set; }

        [Column(TypeName = "varchar(200)")]
        public string Title { get; set; }

        public string Description { get; set; }

        public string Manager { get; set; }

        public DateTime Start { get; set; }

        public DateTime? End { get; set; }

        public int InitiativeId { get; set; }

        public int StatusId { get; set; }

        public virtual Initiative Initiative { get; set; }

    }
}

