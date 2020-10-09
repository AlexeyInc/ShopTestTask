using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Shop.Infrastructure.Database.Models
{
    public class ProductDbo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Cost { get; set; }
        public int Amount { get; set; }
    }
}
