namespace course.api.Business.Entities
{
    public class Curso
    {
        /// <summary>
        /// dsd
        /// </summary>
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public int CodigoUsuario { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}
