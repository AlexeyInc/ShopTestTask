using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ShopApiService.Helpers
{
    public static class SecurityExtensions
    {
        public static string GetPasswrordHash(this string password)
        {
            var passwordHash = new SHA1CryptoServiceProvider().ComputeHash(Encoding.ASCII.GetBytes(password));

            return Encoding.UTF8.GetString(passwordHash);
        }
    }
}
