using course.api.Infra;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace course.api.Configs
{
    /// <summary>
    /// class DbFactoryContext 
    /// </summary>
    public class DbFactoryContext : IDesignTimeDbContextFactory<CursoDbContext>
    {
        /// <summary>
        /// Method CreateDbContext 
        /// </summary>
        public CursoDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<CursoDbContext>();
            optionsBuilder.UseSqlite("Data Source=cursos.db");

            CursoDbContext cursoDbContext = new CursoDbContext(optionsBuilder.Options);
            return cursoDbContext;
        }
    }
}
