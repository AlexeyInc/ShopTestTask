using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Shop.Infrastructure.Database.Services.Auth;
using Shop.Infrastructure.Database.Services.Role;
using ShopApiService.Helpers;
using ShopApiService.Models;

namespace ShopApiService.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IAuthDataService _authDataService;
        private readonly IRoleDataService _roleDataService;

        public UserController(IAuthDataService authDataService,
            IRoleDataService roleDataService)
        {
            _authDataService = authDataService;
            _roleDataService = roleDataService;
        }

        [HttpPost("Authorize")]
        public async Task<ActionResult<JwtViewModel>> AuthorizeUser(UserLoginViewModel userLogin)
        {
            userLogin.Username = userLogin.Username.ToLower();

            var passwordHash = userLogin.Password.GetPasswrordHash();

            if (!await _authDataService.UserExists(userLogin.Username))
            {
                await _authDataService.Register(userLogin.Username, passwordHash);
            }

            var jwtToken = await _authDataService.Authenticate(userLogin.Username, passwordHash);

            return Ok(new JwtViewModel
            {
                Token = jwtToken
            });
        }

        [HttpPost("AddRole/{roleId}")]
        public async Task<IActionResult> AddRole(int roleId)
        {
            var userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            if (!await _roleDataService.AddRoleForUser(int.Parse(userId), roleId))
            {
                return BadRequest("Role adding error");
            }

            return Ok("Role added!");
        }

        [HttpPost("RemoveRole/{roleId}")]
        [Authorize]
        public async Task<IActionResult> RemoveRole(int roleId)
        {
            var userId = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            if (!await _roleDataService.RemoveRoleForUser(int.Parse(userId), roleId))
            {
                return BadRequest("Role removing error");
            }

            return Ok("Role removed!");
        }
    }
}