using course.api.Models;

namespace course.api.Configs
{
    /// <summary>
    /// Interface IAuthenticationService
    /// </summary>
    public interface IAuthenticationService
    {
        /// <summary>
        /// Method GerarToken
        /// </summary>
        string GerarToken(UsuarioViewModelOutput usuarioViewModelOutput);
    }
}
