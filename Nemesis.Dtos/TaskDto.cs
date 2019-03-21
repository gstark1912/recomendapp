using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.Dtos
{
    public class TaskDto
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string Start { get; set; }

        public string End { get; set; }

        public InitiativeDto Initiative { get; set; }

        public int Status { get; set; }

       
    }
}
