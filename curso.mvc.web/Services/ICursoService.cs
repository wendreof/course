using curso.mvc.web.Models;
using Refit;
using System.Threading.Tasks;

namespace curso.mvc.web.Services
{
    public interface ICursoService
    {
        [Post("/api/v1/usuario/registrar")]
        Task<RegistrarCursoViewModelInput> Registrar(RegistrarCursoViewModelInput input);

        [Get("/api/v1/usuario/logar")]
        Task<ListarCursoViewModelOutput> Logar(ListarCursoViewModelOutput output);
    }
}
