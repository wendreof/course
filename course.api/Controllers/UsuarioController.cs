
using course.api.Filters;
using course.api.Models;
using course.api.Models.Usuarios;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

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
        [ValidacaoModelStateCustomizado]
        public IActionResult Logar(LoginViewModel loginViewModel)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(new ValidaCamposViewModelOutput(ModelState.SelectMany(sm => sm.Value.Errors).Select(s => s.ErrorMessage)));
            //}
            var usuarioViewModelOutput = new UsuarioViewModelOutput()
            {
                Codigo = 1,
                Login = "abc",
                Email = "abc@kakaka.com.br"
            };

            var secret = Encoding.ASCII.GetBytes("V2VuZHJlbyBMdWNpYW5vIEZlcm5hbmRlcyBAMTk5MyAtIEJhY2tFbmQgU29mdHdhcmUgRGV2ZWxvcGVyIA==");
            var symmetricSecurityKey = new SymmetricSecurityKey(secret);
            var securityTokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier, usuarioViewModelOutput.Codigo.ToString()),
                    new Claim(ClaimTypes.Name, usuarioViewModelOutput.Login.ToString()),
                    new Claim(ClaimTypes.Email, usuarioViewModelOutput.Email.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(1),
                SigningCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256Signature)
            };

            var jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            var tokenGenerated = jwtSecurityTokenHandler.CreateToken(securityTokenDescriptor);
            var token = jwtSecurityTokenHandler.WriteToken(tokenGenerated);

            return Ok(new
            {
                Token = token,
                Usuario = usuarioViewModelOutput
            });
        }

        /// <summary>
        /// Esse endpoint permite autenticar o usuário
        /// </summary>
        /// <param name="registroViewModel">View model do login</param>
        /// <returns>Retorna dados do usuário e token em caso de sucesso</returns> 
        [HttpPost]
        [Route("registrar")]
        [ValidacaoModelStateCustomizado]
        public IActionResult Registrar(RegistroViewModel registroViewModel)
        {
            return Created("", registroViewModel);
        }
    }
}
