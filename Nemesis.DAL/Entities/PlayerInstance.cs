using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class PlayerInstance
    {
        public int PlayerId { get; set; }
        public Player Player { get; set; }
        public int InstanceId { get; set; }
        public Instance Instance { get; set; }
    }
}
