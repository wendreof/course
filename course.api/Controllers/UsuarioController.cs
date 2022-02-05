
using course.api.Models;
using course.api.Models.Usuarios;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace course.api.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        /// <summary>
        /// Esse endpoint permite autenticar o usuário
        /// </summary>
        /// <param name="loginViewModel">View model do login</param>
        /// <returns>Retorna dados do usuário e token em caso de sucesso</returns> 
        [SwaggerResponse(statusCode: 200, description: "Sucesso ao autenticar", Type = typeof(LoginViewModel))]
        [SwaggerResponse(statusCode: 400, description: "Campos obrigatórios faltando/incorretos", Type = typeof(ValidaCamposViewModelOutput))]
        [SwaggerResponse(statusCode: 500, description: "Erro interno", Type = typeof(ErroGenericoViewModel))]
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
