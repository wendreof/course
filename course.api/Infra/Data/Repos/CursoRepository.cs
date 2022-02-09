using course.api.Business.Entities;
using course.api.Business.Repos;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace course.api.Infra.Data.Repos
{
    public class CursoRepository : ICursoRepository
    {
        private readonly CursoDbContext _cursoDbContext;

        public CursoRepository(CursoDbContext cursoDbContext)
        {
            _cursoDbContext = cursoDbContext;
        }

        public void Add(Curso curso)
        {
            _cursoDbContext.Curso.Add(curso);
        }

        public void Commit()
        {
            _cursoDbContext.SaveChanges();
        }

        public IList<Curso> Get(int codigoUsuario)
        {
            return _cursoDbContext.Curso.Include(i => i.Usuario).Where(w => w.CodigoUsuario == codigoUsuario).ToList();
        }
    }
}
