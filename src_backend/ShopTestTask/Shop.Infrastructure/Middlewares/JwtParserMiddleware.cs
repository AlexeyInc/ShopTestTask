using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Middlewares
{
    public class JwtParserMiddleware
    {
        private readonly RequestDelegate _next;

        public JwtParserMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            string rawAccessToken = httpContext.Request.Headers["Authorization"];

            if (rawAccessToken != null)
            {
                var handler = new JwtSecurityTokenHandler();

                var accessToken = handler.ReadJwtToken(rawAccessToken.Replace("Bearer ", string.Empty));
                var userId = new Claim(ClaimTypes.NameIdentifier, accessToken.Claims.FirstOrDefault(x => x.Type == "nameid")?.Value);
                var userName = new Claim(ClaimTypes.Name, accessToken.Claims.FirstOrDefault(x => x.Type == "unique_name")?.Value);

                var newIdentity = new ClaimsIdentity(new Claim[] { userId, userName });

                httpContext.User = new ClaimsPrincipal(newIdentity);
            }

            await _next(httpContext);
        }
    }
}
