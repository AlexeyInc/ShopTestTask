using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Shop.Infrastructure.Database.Services.Role;

namespace ShopApiService.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleDataService _roleDataService;

        public RoleController(IRoleDataService roleDataService)
        {
            _roleDataService = roleDataService;
        }

        [HttpPost("Add/{roleId}")]
        [Authorize]
        public async Task<IActionResult> AddRole(int roleId)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier).Value;

            if (!await _roleDataService.AddRoleForUser(int.Parse(userId), roleId))
            {
                return BadRequest("Role adding error");
            }

            return Ok("Role added!");
        }

        [HttpPost("Remove/{roleId}")]
        [Authorize]
        public async Task<IActionResult> RemoveRole(int roleId)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier).Value;

            if (!await _roleDataService.RemoveRoleForUser(int.Parse(userId), roleId))
            {
                return BadRequest("Role removing error");
            }

            return Ok("Role removed!");
        }
    }
}