using curso.mvc.web.Models;
using System.Threading.Tasks;

namespace curso.mvc.web.Services
{
    public interface IUsuarioService
    {
        RegistrarCursoViewModelInput Registrar(RegistrarCursoViewModelInput input);
    }
}
