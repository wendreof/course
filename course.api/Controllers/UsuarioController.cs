
using course.api.Business.Entities;
using course.api.Business.Repos;
using course.api.Configs;
using course.api.Filters;
using course.api.Models;
using course.api.Models.Usuarios;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System.Threading.Tasks;

namespace course.api.Controllers
{
    /// <summary>
    /// Class UsuarioController
    /// </summary>
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly IAuthenticationService _auth;

        /// <summary>
        /// Constructor
        /// </summary>
        public UsuarioController(IUsuarioRepository usuarioRepository,
            IAuthenticationService auth)
        {
            _usuarioRepository = usuarioRepository;
            _auth = auth;
        }

        /// <summary>
        /// Esse endpoint permite autenticar o usuário
        /// </summary>
        /// <param name="loginViewModelInput">View model do login</param>
        /// <returns>Retorna dados do usuário e token em caso de sucesso</returns> 
        [SwaggerResponse(statusCode: 200, description: "Sucesso ao autenticar", Type = typeof(LoginViewModelInput))]
        [SwaggerResponse(statusCode: 400, description: "Campos obrigatórios faltando/incorretos", Type = typeof(ValidaCamposViewModelOutput))]
        [SwaggerResponse(statusCode: 500, description: "Erro interno", Type = typeof(ErroGenericoViewModel))]
        [HttpPost]
        [Route("logar")]
        [ValidacaoModelStateCustomizado]
        public async Task<IActionResult> Logar(LoginViewModelInput loginViewModelInput)
        {
            Usuario usuario = await _usuarioRepository.ObterUsuario(loginViewModelInput.Login);

            if (usuario == null)
            {
                return BadRequest("Usuário/Senha inválidos.");
            }

            var usuarioViewModelOutput = new UsuarioViewModelOutput()
            {
                Codigo = usuario.Codigo,
                Login = loginViewModelInput.Login,
                Email = usuario.Email
            };

            var token = _auth.GerarToken(usuarioViewModelOutput);

            return Ok(new
            {
                Token = token,
                Usuario = usuarioViewModelOutput
            });
        }

        /// <summary>
        /// Esse endpoint permite autenticar o usuário
        /// </summary>
        /// <param name="registroViewModelInput">View model do login</param>
        /// <returns>Retorna dados do usuário e token em caso de sucesso</returns> 
        [HttpPost]
        [Route("registrar")]
        [ValidacaoModelStateCustomizado]
        public async Task<IActionResult> Registrar(RegistroViewModelInput registroViewModelInput)
        {
            var usuarioExiste = await _usuarioRepository.ObterUsuario(registroViewModelInput.Login);

            if (usuarioExiste != null)
            {
                return BadRequest("Usuário já cadastrado!");
            }

            var usuario = new Usuario
            {
                Login = registroViewModelInput.Login,
                Senha = registroViewModelInput.Senha,
                Email = registroViewModelInput.Email
            };
            _usuarioRepository.Add(usuario);
            _usuarioRepository.Commit();

            return Created("", registroViewModelInput);
        }
    }
}
