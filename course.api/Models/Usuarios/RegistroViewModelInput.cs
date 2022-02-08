using System.ComponentModel.DataAnnotations;

namespace course.api.Models.Usuarios
{
    public class RegistroViewModelInput
    {
        [Required(ErrorMessage = "O login é obrigatório")]
        [StringLength(10)]
        public string Login { get; set; }

        [Required(ErrorMessage = "O E-mail é obrigatório")]
        [StringLength(50)]
        public string Email { get; set; }

        [Required(ErrorMessage = "A senha é obrigatória")]
        [StringLength(8)]
        public string Senha { get; set; }
    }
}
