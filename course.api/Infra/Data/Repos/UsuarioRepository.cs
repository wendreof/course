using course.api.Business.Entities;
using course.api.Business.Repos;

namespace course.api.Infra.Data.Repos
{
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly CursoDbContext _cursoDbContext;

        public UsuarioRepository(CursoDbContext cursoDbContext)
        {
            this._cursoDbContext = cursoDbContext;
        }

        public void Add(Usuario usuario)
        {
            _cursoDbContext.Usuario.Add(usuario);
        }

        public void Commit()
        {
            _cursoDbContext.SaveChanges();
        }
    }
}
