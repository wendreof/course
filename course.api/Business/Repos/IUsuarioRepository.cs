using course.api.Business.Entities;

namespace course.api.Business.Repos
{
    public interface IUsuarioRepository
    {
        void Add(Usuario usuario);
        void Commit();
        Usuario ObterUsuario(string login);
    }
}
