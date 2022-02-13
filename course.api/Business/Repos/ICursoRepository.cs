using course.api.Business.Entities;
using System.Collections.Generic;

namespace course.api.Business.Repos
{
    /// <summary>
    /// Interface ICursoRepository
    /// </summary>
    public interface ICursoRepository
    {
        /// <summary>
        /// Create new curso
        /// </summary>
        void Add(Curso curso);

        /// <summary>
        /// Commit changes to DB
        /// </summary>
        void Commit();

        /// <summary>
        /// Return list of cursos
        /// </summary>
        IList<Curso> Get(int codigoUsuario);
    }
}
