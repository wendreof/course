using System.ComponentModel.DataAnnotations;

namespace course.api.Models
{
    /// <summary>
    /// Model CursoViewModelInput
    /// </summary>
    public class CursoViewModelInput
    {
        /// <summary>
        /// Prop Nome
        /// </summary>
        [Required(ErrorMessage = "O nome do curso é obrigatório")]
        public string Nome { get; set; }

        /// <summary>
        /// Prop Descricao
        /// </summary>
        [Required(ErrorMessage = "A descrição do curso é obrigatória")]
        public string Descricao { get; set; }
    }
}