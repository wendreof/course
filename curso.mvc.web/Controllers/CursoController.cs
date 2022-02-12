using curso.mvc.web.Models;
using curso.mvc.web.Services;
using Microsoft.AspNetCore.Mvc;
using Refit;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace curso.mvc.web.Controllers
{
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

        public IActionResult Listar()
        {
            var curso = new List<ListarCursoViewModelOutput>
            {
                new ListarCursoViewModelOutput()
                {
                    Nome = "curso1",
                    Descricao = "descricao1",
                    Login = "teste"
                },

                new ListarCursoViewModelOutput()
                {
                    Nome = "curso2",
                    Descricao = "descricao2",
                    Login = "teste2"
                }
            };
            return View(curso);
        }

    }
}
