using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Shop.Infrastructure.Database.Configuration;
using Shop.Infrastructure.Database.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Database.Services.Auth
{
    public class AuthDataService : IAuthDataService
    {
        string connectionString = null;
        private readonly AuthOptions _tokenOptions; 

        public AuthDataService(string conn, AuthOptions tokenOptions)
        {
            connectionString = conn; 
            _tokenOptions = tokenOptions;
        } 

        public async Task<bool> Register(string username, string password)
        {
            using (IDbConnection db = new SqlConnection(connectionString))
            { 
                var result = await db.ExecuteAsync("INSERT INTO [User] (Username, [Password]) VALUES(@UserName, @Password)", new { username, password });
                return result > 0;
            }
        }

        public async Task<string> Authenticate(string username, string password)
        {
            UserDbo currentUser = null;

            using (IDbConnection db = new SqlConnection(connectionString))
            {
                var user = await db.QueryAsync<UserDbo>("SELECT * FROM [User] WHERE Username = @UserName AND [Password] = @Password",
                                                        new { username, password }
                                                        );
                currentUser = user.FirstOrDefault();
            }

            if (currentUser == null)
            {
                throw new UnauthorizedAccessException("Invalid password");
            }

            var key = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_tokenOptions.Key));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;

            var jwt = new JwtSecurityToken(
                    issuer: _tokenOptions.Issuer,
                    audience: _tokenOptions.Audience,
                    notBefore: now,
                    claims: new ClaimsIdentity(new Claim[]
                    {
                        new Claim(ClaimTypes.NameIdentifier, currentUser.Id.ToString()),
                        new Claim(ClaimTypes.Name, currentUser.Username)
                    }).Claims,
                    expires: now.Add(TimeSpan.FromMinutes(_tokenOptions.MinutesLifetime)),
                    signingCredentials: creds
            );

            var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);

            return encodedJwt;

            //var tokenDescriptor = new SecurityTokenDescriptor
            //{
            //    Issuer = _tokenOptions.Issuer,
            //    Audience = _tokenOptions.Audiense,
            //    Subject = new ClaimsIdentity(new Claim[]
            //    {
            //        new Claim(ClaimTypes.NameIdentifier, currentUser.Id.ToString()),
            //        new Claim(ClaimTypes.Name, currentUser.Username)
            //    }),
            //    Expires = DateTime.Now.Add(TimeSpan.FromMinutes(_tokenOptions.MinutesLifetime)),
            //    SigningCredentials = creds
            //};

            //var tokenHandler = new JwtSecurityTokenHandler();

            //SecurityToken userToken = tokenHandler.CreateToken(tokenDescriptor);

            //return tokenHandler.WriteToken(userToken);
        } 

        public async Task<bool> UserExists(string username)
        {
            using (IDbConnection db = new SqlConnection(connectionString))
            {
                var user = await db.QueryAsync<UserDbo>("SELECT * FROM [User] WHERE Username = @UserName", new { username });
                return user.FirstOrDefault() != null;
            }
        }
    }
}
