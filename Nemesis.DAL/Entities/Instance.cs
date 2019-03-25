using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Instance
    {
        public int InstanceId { get; set; }
        public string Name { get; set; }

        public Division Division { get; set; }
        public ICollection<Match> Matches { get; set; }
        public ICollection<PlayerInstance> PlayerInstances { get; set; }
    }
}
