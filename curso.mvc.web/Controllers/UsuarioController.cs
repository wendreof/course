using curso.mvc.web.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;

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
            var clientHandler = new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            };

            var json = JsonConvert.SerializeObject(input);
            var content = new StringContent(json, Encoding.UTF8, mediaType: "application/json");
            var httpClient = new HttpClient(clientHandler)
            {
                BaseAddress = new Uri("https://localhost:5001/")
                
            };

            var httpPost = httpClient.PostAsync("api/v1/usuario/registrar", content).GetAwaiter().GetResult();

            if(httpPost.StatusCode == System.Net.HttpStatusCode.Created)
            {
                ModelState.AddModelError("", "Dados cadastrados com sucesso!");
            } else
            {
                ModelState.AddModelError("", "Erro ao cadastrar dados!");
            }


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
