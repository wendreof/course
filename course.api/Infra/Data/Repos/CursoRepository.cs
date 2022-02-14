using course.api.Business.Entities;
using course.api.Business.Repos;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace course.api.Infra.Data.Repos
{
    /// <summary>
    /// Interface CursoRepository
    /// </summary>
    public class CursoRepository : ICursoRepository
    {
        private readonly CursoDbContext _cursoDbContext;

        /// <summary>
        /// Constructor
        /// </summary>
        public CursoRepository(CursoDbContext cursoDbContext)
        {
            _cursoDbContext = cursoDbContext;
        }

        /// <summary>
        /// Adds new curso
        /// </summary>
        public void Add(Curso curso)
        {
            _cursoDbContext.Curso.Add(curso);
        }

        /// <summary>
        /// Commit DB changes
        /// </summary>
        public void Commit()
        {
            _cursoDbContext.SaveChanges();
        }

        /// <summary>
        /// Returns list of curso
        /// </summary>
        public IList<Curso> Get(int codigoUsuario)
        {
            return _cursoDbContext.Curso.Include(i => i.Usuario).Where(w => w.CodigoUsuario == codigoUsuario).ToList();
        }
    }
}
