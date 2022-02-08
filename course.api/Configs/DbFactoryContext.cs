using course.api.Infra;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace course.api.Configs
{
    public class DbFactoryContext : IDesignTimeDbContextFactory<CursoDbContext>
    {
        public CursoDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<CursoDbContext>();
            optionsBuilder.UseSqlite("Data Source=cursos.db");

            CursoDbContext cursoDbContext = new CursoDbContext(optionsBuilder.Options);
            return cursoDbContext;
        }
    }
}
