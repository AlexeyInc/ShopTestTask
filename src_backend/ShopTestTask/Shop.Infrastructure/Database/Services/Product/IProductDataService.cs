using System.Collections.Generic;
using System.Threading.Tasks;
using Shop.Infrastructure.Database.Models;

namespace Shop.Infrastructure.Database.Services.Product
{
    public interface IProductDataService
    {
        public Task<IEnumerable<ProductDbo>> GetProducts(int queryId);
    }
}
