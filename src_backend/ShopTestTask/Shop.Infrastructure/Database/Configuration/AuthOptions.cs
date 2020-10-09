using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Infrastructure.Database.Configuration
{
    public class AuthOptions
    {
        public static string TokenSettings { get; } = "TokenSettings";
        public string Issuer { get; set; }
        public string Key { get; set; }
        public int MinutesLifetime { get; set; }
    }
}
