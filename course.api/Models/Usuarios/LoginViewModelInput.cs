using System.ComponentModel.DataAnnotations;

namespace course.api.Models.Usuarios
{
    public class LoginViewModelInput
    {
        [Required(ErrorMessage = "O login é obrigatório")]
        [StringLength(10)]
        public string Login { get; set; }

        [Required(ErrorMessage = "A senha é obrigatória")]
        [StringLength(8)]
        public string Senha { get; set; }
    }
}
