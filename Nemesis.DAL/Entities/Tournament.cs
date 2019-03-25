using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Tournament
    {
        public int TournamentId { get; set; }
        public string Name { get; set; }

        public ICollection<Division> Divisions { get; set; }
    }
}
