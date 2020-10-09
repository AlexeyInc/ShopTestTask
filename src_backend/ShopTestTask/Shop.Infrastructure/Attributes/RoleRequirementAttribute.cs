using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Shop.Infrastructure.Database.Services.Role;
using System.Security.Claims;
using Microsoft.Extensions.DependencyInjection;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Attributes
{
    public class RoleRequirementAttribute : TypeFilterAttribute
    {
        public RoleRequirementAttribute(params object[] arguments)
            : base(typeof(RoleRequirementFilterImpl))
        {
            Arguments = new object[] { arguments };
        }

        private class RoleRequirementFilterImpl : IAsyncAuthorizationFilter
        {
            private readonly int _requiredRoleId;

            public RoleRequirementFilterImpl(object[] arguments)
            {
                _requiredRoleId = (int)arguments[0];
            }
            public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
            {
                var userId = context.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

                var roleDataService = context.HttpContext.RequestServices.GetService<IRoleDataService>();

                var haveRolePermission = await roleDataService.CheckRoleForUser(_requiredRoleId, int.Parse(userId));

                if (!haveRolePermission)
                {
                    context.Result = new ContentResult()
                    {
                        Content = "User doesn't have required role!",
                        StatusCode = 403
                    };
                }
            }
        }
    }
}
