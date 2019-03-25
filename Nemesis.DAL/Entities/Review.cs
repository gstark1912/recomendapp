using System;
using System.Collections.Generic;
using System.Text;

namespace Nemesis.DAL.Entities
{
    public class Review
    {
        public int ReviewId { get; set; }
        public int Score { get; set; }
        public string Text { get; set; }

        public Movie Movie { get; set; }
        public Player Reviewer { get; set; }
        public Player RecommendedBy { get; set; }

    }
}
