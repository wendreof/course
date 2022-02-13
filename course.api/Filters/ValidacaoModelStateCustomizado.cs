using course.api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Linq;

namespace course.api.Filters
{
    /// <summary>
    /// Class ValidacaoModelStateCustomizado
    /// </summary>
    public class ValidacaoModelStateCustomizado : ActionFilterAttribute
    {
        /// <summary>
        /// Validates ModelState
        /// </summary>
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (!context.ModelState.IsValid)
            {
                var validaCampoViewModel = new ValidaCamposViewModelOutput(context.ModelState.SelectMany(sm => sm.Value.Errors).Select(s => s.ErrorMessage));
                context.Result = new BadRequestObjectResult(validaCampoViewModel);
            }
        }
    }
}
