using course.api.Business.Entities;
using course.api.Business.Repos;
using System.Linq;

namespace course.api.Infra.Data.Repos
{
    /// <summary>
    /// Model UsuarioRepository
    /// </summary>
    public class UsuarioRepository : IUsuarioRepository
    {
        private readonly CursoDbContext _cursoDbContext;

        /// <summary>
        /// Constructor
        /// </summary>
        public UsuarioRepository(CursoDbContext cursoDbContext)
        {
            _cursoDbContext = cursoDbContext;
        }

        /// <summary>
        /// Adds new usuario
        /// </summary>
        public void Add(Usuario usuario)
        {
            _cursoDbContext.Usuario.Add(usuario);
        }

        /// <summary>
        /// Commit changes to DB
        /// </summary>
        public void Commit()
        {
            _cursoDbContext.SaveChanges();
        }

        /// <summary>
        /// Returns Usuario
        /// </summary>
        public Usuario ObterUsuario(string login)
        {
            return _cursoDbContext.Usuario.FirstOrDefault(u => u.Login == login);
        }
    }
}
