using curso.mvc.web.Models;
using Refit;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace curso.mvc.web.Services
{
    public interface ICursoService
    {
        [Post("/api/v1/cursos")]
        [Headers("Authorization: Bearer")]
        Task<RegistrarCursoViewModelOutput> Registrar(RegistrarCursoViewModelInput input);

        [Get("/api/v1/cursos")]
        [Headers("Authorization: Bearer")]
        Task<IList<ListarCursoViewModelOutput>> Listar();
    }
}
