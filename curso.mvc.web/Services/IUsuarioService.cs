using curso.mvc.web.Models;
using Refit;
using System.Threading.Tasks;

namespace curso.mvc.web.Services
{
    public interface IUsuarioService
    {
        [Post("/api/v1/usuario/registrar")]
        Task<RegistrarCursoViewModelInput> Registrar(RegistrarUsuarioViewModelInput input);

        [Post("/api/v1/usuario/logar")]
        Task<RegistrarCursoViewModelInput> Logar(LoginViewModelInput input);
    }
}
