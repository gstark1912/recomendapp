using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Player
    {
        public int PlayerId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }

        public ICollection<PlayerInstance> PlayerInstances { get; set; }        
    }
}
