using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopApiService.Configuration.Mapping
{
    public partial class MappingProfile : Profile
    {
        public MappingProfile()
        {
            MapProduct();
        }
    }
}
