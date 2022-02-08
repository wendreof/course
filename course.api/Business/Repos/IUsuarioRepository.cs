using course.api.Business.Entities;

namespace course.api.Business.Repos
{
    public interface IUsuarioRepository
    {
        void Add(Usuario usuario);
        void Commit()
        {
            //var optionsBuilder = new DbContextOptionsBuilder<CursoDbContext>();
            //optionsBuilder.UseSqlite("Data Source=cursos.db");

            //CursoDbContext cursoDbContext = new CursoDbContext(optionsBuilder.Options);

            //var pendingMigrations = cursoDbContext.Database.GetPendingMigrations();

            //if (pendingMigrations.Count() > 0)
            //{
            //    cursoDbContext.Database.MigrateAsync();
            //}
        
        }
    }
}
