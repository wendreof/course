using curso.mvc.web.Models;
using curso.mvc.web.Services;
using Microsoft.AspNetCore.Mvc;
using Refit;
using System;
using System.Threading.Tasks;

namespace curso.mvc.web.Controllers
{
    [Microsoft.AspNetCore.Authorization.Authorize]
    public class CursoController : Controller
    {
        private readonly ICursoService _service;
        public CursoController(ICursoService service)
        {
            _service = service;
        }
        public IActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CadastrarAsync(RegistrarCursoViewModelInput input)
        {
            try
            {
                var retorno = await _service.Registrar(input);

                ModelState.AddModelError("", $"Cadastro realizado com sucesso. Curso: {retorno.Nome}");
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

        [HttpGet]
        public async Task<IActionResult> Listar()
        {
            try
            {
                var retorno = await _service.Listar();
                return View(retorno);
            }
            catch (ApiException ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View(new ListarCursoViewModelOutput());
        }

    }
}
