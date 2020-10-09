using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Data.SqlClient;
using Shop.Infrastructure.Database.Models;

namespace Shop.Infrastructure.Database.Services.Product
{
    public class ProductDataService : IProductDataService
    {
        string connectionString = null;
        
        public ProductDataService(string conn)
        {
            connectionString = conn;
        }
        public async Task<IEnumerable<ProductDbo>> GetProducts(int queryTypeId)
        {
            IEnumerable<ProductDbo> products;

            using (IDbConnection db = new SqlConnection(connectionString))
            {
                var result = await db.QueryAsync<ProductDbo>(sql: "exec GetProducts @TypeSubquery",
                                                            param: new { TypeSubquery = queryTypeId });
                products = result.ToList();
            }  
            return products;
        }
    }
}
