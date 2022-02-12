using System.ComponentModel.DataAnnotations;

namespace curso.mvc.web.Models
{
    public class RegistrarUsuarioViewModelInput
    {
        [Required(ErrorMessage = "O login é obrigatório")]
        public string Login { get; set; }

        [Required(ErrorMessage = "O email é obrigatório")]
        public string Email { get; set; }

        [Required(ErrorMessage = "a senha é obrigatória")]
        public string Senha { get; set; }
    }
}
