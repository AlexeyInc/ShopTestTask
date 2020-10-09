using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Shop.Infrastructure.Attributes;
using Shop.Infrastructure.Database.Services.Product;
using Shop.Infrastructure.Enums;
using ShopApiService.Models;

namespace ShopApiService.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    { 
        private readonly IProductDataService _productDataService;
        private readonly IMapper _mapper;

        public ProductController(IProductDataService productDataService,
            IMapper mapper)
        {
            _productDataService = productDataService;
            _mapper = mapper;
        }

        [HttpGet("Popular")]
        [RoleRequirement(UserRole.Analyst)]
        public async Task<IEnumerable<ProductViewModel>> PopularProducts()
        {
            var productsDbo = await _productDataService.GetProducts((int)ProductQueryType.Popular);

            var productsViewModel = _mapper.Map<IEnumerable<ProductViewModel>>(productsDbo);

            return productsViewModel;
        }

        [HttpGet("Actual")]
        [RoleRequirement(UserRole.Manager)]
        public async Task<IEnumerable<ProductViewModel>> ActualProducts()
        {
            var productsDbo = await _productDataService.GetProducts((int)ProductQueryType.Actual);

            var productsViewModel = _mapper.Map<IEnumerable<ProductViewModel>>(productsDbo);

            return productsViewModel;
        }

        [HttpGet("Top")]
        [RoleRequirement(UserRole.Head)]
        public async Task<IEnumerable<ProductViewModel>> TopProducts()
        {
            var productsDbo = await _productDataService.GetProducts((int)ProductQueryType.Top);

            var productsViewModel = _mapper.Map<IEnumerable<ProductViewModel>>(productsDbo);

            return productsViewModel;
        }
    }
}