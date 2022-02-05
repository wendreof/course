using course.api.Models.Usuarios;
using Microsoft.AspNetCore.Mvc;

namespace course.api.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        [HttpPost]
        [Route("logar")]
        public IActionResult Logar(LoginViewModel loginViewModel)
        {
            return Ok(loginViewModel);
        }

        [HttpPost]
        [Route("registrar")]
        public IActionResult Registrar(RegistroViewModel registroViewModel)
        {
            return Created("", registroViewModel);
        }
    }
}
