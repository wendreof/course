using System.ComponentModel.DataAnnotations;

namespace course.api.Models.Usuarios
{
    /// <summary>
    /// Model RegistroViewModelInput
    /// </summary>
    public class RegistroViewModelInput
    {
        /// <summary>
        /// Prop Login
        /// </summary>
        [Required(ErrorMessage = "O login é obrigatório")]
        [StringLength(10)]
        public string Login { get; set; }

        /// <summary>
        /// Prop Email
        /// </summary>
        [Required(ErrorMessage = "O E-mail é obrigatório")]
        [StringLength(50)]
        public string Email { get; set; }

        /// <summary>
        /// Prop Senha
        /// </summary>
        [Required(ErrorMessage = "A senha é obrigatória")]
        [StringLength(8)]
        public string Senha { get; set; }
    }
}
