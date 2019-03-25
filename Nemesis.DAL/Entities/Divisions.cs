using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Division
    {
        public int DivisionId { get; set; }
        public string Name { get; set; }
        public int Promotions { get; set; }
        public int Relegations { get; set; }

        public Tournament Tournament { get; set; }
        public ICollection<Instance> Instances { get; set; }
    }
}
