using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Shop.Infrastructure.Database.Services.Auth;
using Shop.Infrastructure.Database.Services.Product;
using Shop.Infrastructure.Database.Services.Role;
using Shop.Infrastructure.Middlewares;
using ShopApiService.Configuration.Mapping;

namespace ShopApiService
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var connectionString = Configuration.GetConnectionString("DatabaseConnection");

            services.AddScoped<IAuthDataService, AuthDataService>(provider => new AuthDataService(connectionString, Configuration));
            services.AddScoped<IRoleDataService, RoleDataService>(provider => new RoleDataService(connectionString));
            services.AddScoped<IProductDataService, ProductDataService>(provider => new ProductDataService(connectionString));

            services.AddAutoMapper(typeof(MappingProfile));

            services.AddControllers();

            services.AddCors(o => o.AddPolicy("DemocraticPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Shop Swagger API",
                    Description = "API for Shop test task"
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseMiddleware<JwtParserMiddleware>();

            app.UseAuthorization();

            app.UseCors("DemocraticPolicy");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();

            app.UseSwaggerUI(s => s.SwaggerEndpoint("/swagger/v1/swagger.json", "ShopTestTask"));
        }
    }
}
