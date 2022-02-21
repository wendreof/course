using course.api.Business.Entities;
using course.api.Infra.Data.Mappings;
using Microsoft.EntityFrameworkCore;

namespace course.api.Infra
{
    /// <summary>
    /// CursoDbContext - DB Configuration
    /// </summary>
    public class CursoDbContext : DbContext
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public CursoDbContext(DbContextOptions<CursoDbContext> options) : base(options)
        {
            Database.Migrate();
        }

        /// <summary>
        /// OnModelCreating
        /// </summary>
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CursoMapping());
            modelBuilder.ApplyConfiguration(new UsuarioMapping());
            base.OnModelCreating(modelBuilder);
        }

        /// <summary>
        /// Prop Usuario
        /// </summary>
        public DbSet<Usuario> Usuario { get; set; }

        /// <summary>
        /// Prop Curso
        /// </summary>
        public DbSet<Curso> Curso { get; set; }
    }
}
