using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace eStore.Middlewares
{
    public class AuthorizationCustomMiddleware
    {
        private readonly RequestDelegate _next;

        public AuthorizationCustomMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {

            IdentityUser defaultAdmin = JsonConvert.DeserializeObject<IdentityUser>(
                    eStoreLibrary.eStoreClientConfiguration.DefaultAccount);

            var currentUser = context.User;
            if (currentUser.Identity.IsAuthenticated)
            {
                var currentClaims = currentUser.Claims;
                var role = currentClaims.FirstOrDefault(c => c.Type.Equals(ClaimTypes.Role));
                if (role == null 
                    && currentUser.Identity.Name.Equals(defaultAdmin.Email))
                {
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Role, "Admin")
                    };
                    var appIdentity = new ClaimsIdentity(claims);
                    context.User.AddIdentity(appIdentity);
                }
            }

            await _next(context);
        }
    }

    public static class AuthorizationCustomMiddlewareExtensions
    {
        public static IApplicationBuilder UseCustomAuthorization(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<AuthorizationCustomMiddleware>();
        }
    }
}
