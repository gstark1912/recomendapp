using System.Collections.Generic;

namespace Nemesis.Dtos
{
    public class MovieDto
    {
        public int MovieId { get; set; }
        public string Title { get; set; }
        public string Plot { get; set; }
        public string Genre { get; set; }
        public string Year { get; set; }
        public string Duration { get; set; }
        public string Director { get; set; }
        public string Poster { get; set; }
        public string Country { get; set; }
        public string Language { get; set; }
        public string ImdbRating { get; set; }
    }
}
