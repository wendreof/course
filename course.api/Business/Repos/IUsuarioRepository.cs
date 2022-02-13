using course.api.Business.Entities;

namespace course.api.Business.Repos
{
    /// <summary>
    /// Interface IUsuarioRepository
    /// </summary>
    public interface IUsuarioRepository
    {
        /// <summary>
        /// Add new usuario
        /// </summary>
        void Add(Usuario usuario);

        /// <summary>
        /// Commit changes to DB
        /// </summary>
        void Commit();

        /// <summary>
        /// Returns usuario
        /// </summary>
        Usuario ObterUsuario(string login);
    }
}
