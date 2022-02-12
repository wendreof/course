using curso.mvc.web.Models;
using curso.mvc.web.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Refit;
using System;
using System.Net.Http;
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
    }
}
