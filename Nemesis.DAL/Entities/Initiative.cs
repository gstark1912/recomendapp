using System.Collections.Generic;

namespace Nemesis.DAL.Entities
{
    public class Initiative
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string ShortName { get; set; }
        
        public virtual ICollection<Task> Tasks { get; set; }

    }
}
