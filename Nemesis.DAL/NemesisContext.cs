using Microsoft.EntityFrameworkCore;
using Nemesis.DAL.Entities;

namespace Nemesis.DAL
{
    public class NemesisContext : DbContext
    {

        public NemesisContext()
        {

        }

        public NemesisContext(DbContextOptions<NemesisContext> options)
            : base(options)
        { }

        public DbSet<Initiative> Initiatives { get; set; }
        public DbSet<Task> Tasks { get; set; }
       


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Task>()
                .HasOne(tc => tc.Initiative)
                .WithMany(tc => tc.Tasks)
                .HasForeignKey(tc => tc.InitiativeId);
  
        }

        public virtual void Commit()
        {
            base.SaveChanges();
        }
    }
}
