using System.Collections.Generic;

namespace course.api.Models
{
    /// <summary>
    /// ValidaCamposViewModelOutput
    /// </summary>
    public class ValidaCamposViewModelOutput
    {
        public ValidaCamposViewModelOutput(IEnumerable<string> erros)
        {
            Erros = erros;
        }

        public IEnumerable<string> Erros { get; private set; }
    }
}
