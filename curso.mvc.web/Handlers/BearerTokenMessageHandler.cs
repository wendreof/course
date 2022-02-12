

using Microsoft.AspNetCore.Http;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;

namespace curso.mvc.web.Handlers
{
    public class BearerTokenMessageHandler: DelegatingHandler
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public BearerTokenMessageHandler(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        protected async override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            if (request?.Headers?.Authorization != null)
            {
                var token = _httpContextAccessor.HttpContext.User.FindFirst("token").Value;
                request.Headers.Authorization = new AuthenticationHeaderValue(request.Headers.Authorization.Scheme, token);
            }
            return await base.SendAsync(request, cancellationToken);
        }

    }
}
