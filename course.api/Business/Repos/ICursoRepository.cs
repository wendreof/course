using course.api.Business.Entities;
using System.Collections.Generic;

namespace course.api.Business.Repos
{
    public interface ICursoRepository
    {
        void Add(Curso curso);
        void Commit();
        IList<Curso> Get(int codigoUsuario);
    }
}
