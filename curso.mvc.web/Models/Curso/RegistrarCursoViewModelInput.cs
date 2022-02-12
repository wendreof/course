using System.ComponentModel.DataAnnotations;

namespace curso.mvc.web.Models
{
    public class RegistrarCursoViewModelInput
    {
        [Required(ErrorMessage = "O login é obrigatório")]
        public string Login { get; set; }


        [Required(ErrorMessage = "A descrição é obrigatória")]
        public string Descricao { get; set; }
    }
}
