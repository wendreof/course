using curso.mvc.web.Models;
using Microsoft.AspNetCore.Mvc;

namespace curso.mvc.web.Controllers
{
    public class UsuarioController : Controller
    {
        public IActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Cadastrar(RegistrarUsuarioViewModelInput input)
        {
            return View();
        }

        public IActionResult Logar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Logar(LoginViewModelInput input)
        {
            return View();
        }
    }
}
