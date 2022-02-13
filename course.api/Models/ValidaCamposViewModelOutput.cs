using System.Collections.Generic;

namespace course.api.Models
{
    /// <summary>
    /// Model ValidaCamposViewModelOutput
    /// </summary>
    public class ValidaCamposViewModelOutput
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public ValidaCamposViewModelOutput(IEnumerable<string> erros)
        {
            Erros = erros;
        }

        /// <summary>
        /// Returns list of errors
        /// </summary>
        public IEnumerable<string> Erros { get; private set; }
    }
}
