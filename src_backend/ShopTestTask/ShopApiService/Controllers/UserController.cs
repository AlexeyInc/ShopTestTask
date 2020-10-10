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

        public UserController(IAuthDataService authDataService)
        {
            _authDataService = authDataService;
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
    }
}