using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Infrastructure.Database.Models
{
    public class UserDbo
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
