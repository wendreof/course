using curso.mvc.web.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace curso.mvc.web.Controllers
{
    public class CursoController : Controller
    {
        public IActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Cadastrar(RegistrarCursoViewModelInput input)
        {
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
