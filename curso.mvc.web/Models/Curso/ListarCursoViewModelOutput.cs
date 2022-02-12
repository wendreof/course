using System.ComponentModel.DataAnnotations;

namespace curso.mvc.web.Models
{
    public class ListarCursoViewModelOutput
    {
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public string Login { get; set; }
    }
}
