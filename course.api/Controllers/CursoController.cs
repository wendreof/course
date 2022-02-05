using course.api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace course.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursoController : ControllerBase
    {
        [HttpPost]
        [Route("")]

        public async  Task<IActionResult> Post(CursoViewModelInput cursoViewModelInput)
        {
            return Created("",cursoViewModelInput);
        }
    }
}
