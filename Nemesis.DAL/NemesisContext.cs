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

        public DbSet<Division> Division { get; set; }
        public DbSet<Genre> Genre { get; set; }
        public DbSet<Instance> Instance { get; set; }
        public DbSet<Match> Match { get; set; }
        public DbSet<Movie> Movie { get; set; }
        public DbSet<Player> Player { get; set; }
        public DbSet<PlayerInstance> PlayerInstance { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<Tournament> Tournament { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Movie>()
                .ToTable("Movies")
                .HasKey(pi => new { pi.MovieId });

            builder.Entity<PlayerInstance>()
                .HasKey(pi => new { pi.PlayerId, pi.InstanceId });

            builder.Entity<PlayerInstance>()
                .HasOne(pi => pi.Player)
                .WithMany(b => b.PlayerInstances)
                .HasForeignKey(pi => pi.PlayerId);

            builder.Entity<PlayerInstance>()
                .HasOne(pi => pi.Instance)
                .WithMany(c => c.PlayerInstances)
                .HasForeignKey(pi => pi.InstanceId);            
        }

        public virtual void Commit()
        {
            base.SaveChanges();
        }
    }
}
