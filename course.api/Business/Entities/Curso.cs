namespace course.api.Business.Entities
{
    /// <summary>
    /// Model Curso
    /// </summary>
    public class Curso
    {
        /// <summary>
        /// Prop Codigo
        /// </summary>
        public int Codigo { get; set; }

        /// <summary>
        /// Prop Nome
        /// </summary>
        public string Nome { get; set; }

        /// <summary>
        /// Prop Descricao
        /// </summary>
        public string Descricao { get; set; }

        /// <summary>
        /// Prop CodigoUsuario
        /// </summary>
        public int CodigoUsuario { get; set; }

        /// <summary>
        /// Prop Usuario
        /// </summary>
        public virtual Usuario Usuario { get; set; }
    }
}
