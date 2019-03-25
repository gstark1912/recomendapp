using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Match
    {
        public int MatchId { get; set; }
        
        public Review Review1 { get; set; }
        public Review Review2 { get; set; }
        public Genre Genre { get; set; }
        public DateTime DateTimeStart { get; set; }
        public DateTime DateTimeEnd { get; set; }
    }
}
