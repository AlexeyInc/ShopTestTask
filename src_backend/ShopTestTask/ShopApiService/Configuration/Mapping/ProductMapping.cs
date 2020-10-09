using AutoMapper;
using Shop.Infrastructure.Database.Models;
using ShopApiService.Models;

namespace ShopApiService.Configuration.Mapping
{
    public partial class MappingProfile : Profile
    {
        public void MapProduct()
        {
            CreateMap<ProductViewModel, ProductDbo>()
                .ReverseMap();
        }
    }
}
