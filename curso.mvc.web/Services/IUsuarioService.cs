using curso.mvc.web.Models;
using curso.mvc.web.Models.Usuario;
using Refit;
using System.Threading.Tasks;

namespace curso.mvc.web.Services
{
    public interface IUsuarioService
    {
        [Post("/api/v1/usuario/registrar")]
        Task<RegistrarUsuarioViewModelInput> Registrar(RegistrarUsuarioViewModelInput input);

        [Post("/api/v1/usuario/logar")]
        Task<LoginViewModelOutput> Logar(LoginViewModelInput input);
    }
}
