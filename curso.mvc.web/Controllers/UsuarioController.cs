using curso.mvc.web.Models;
using curso.mvc.web.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Refit;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace curso.mvc.web.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly IUsuarioService _service;
        public UsuarioController(IUsuarioService service)
        {
            _service = service;
        }

        public IActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Cadastrar(RegistrarUsuarioViewModelInput input)
        {
            try
            {
               var retorno = await  _service.Registrar(input);

                ModelState.AddModelError("", $"Cadastro realizado com sucesso para: {retorno.Login}");
            }
            catch (ApiException ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            catch (Exception ex )
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View();
        }

        public IActionResult Logar()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LogarAsync(LoginViewModelInput input)
        {
            try
            {
                var retorno = await _service.Logar(input);

                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, retorno.Usuario.Codigo.ToString()),
                    new Claim(ClaimTypes.Name, retorno.Usuario.Login),
                    new Claim(ClaimTypes.Email, retorno.Usuario.Email),
                    new Claim("token", retorno.Token),

                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                var authProperties = new AuthenticationProperties
                {
                    ExpiresUtc = new DateTimeOffset(DateTime.Now.AddDays(1))
                };

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity), authProperties);

                ModelState.AddModelError("", $"Usuário autenticado com sucesso. Token: {retorno.Token}");
            }
            catch (ApiException ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View();
        }

        public IActionResult Logout()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Logout2()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction($"{nameof(Logar)}");
        }
    }
}
