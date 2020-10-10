using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Shop.Infrastructure.Database.Configuration;
using Shop.Infrastructure.Database.Services.Auth;
using Shop.Infrastructure.Database.Services.Product;
using Shop.Infrastructure.Database.Services.Role;
using Shop.Infrastructure.Middlewares;
using ShopApiService.Configuration;
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

        public void ConfigureServices(IServiceCollection services)
        {
            var connectionString = Configuration.GetConnectionString("DatabaseConnection");
             
            var tokenSettings = Configuration.GetSection(AuthOptions.TokenSettings).Get<AuthOptions>();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                     .AddJwtBearer(options =>
                     {
                         options.RequireHttpsMetadata = false;
                         options.TokenValidationParameters = new TokenValidationParameters
                         {
                            ValidateIssuer = true,
                            
                            ValidIssuer = tokenSettings.Issuer,

                             ValidateAudience = true,
                             
                             ValidAudience = tokenSettings.Audience,

                             ValidateLifetime = true,

                            IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(tokenSettings.Key)),
                            
                            ValidateIssuerSigningKey = true
                         };
                     });

            services.AddCors(o => o.AddPolicy("CustomPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));

            services.AddControllers();

            services.AddAutoMapper(typeof(MappingProfile));

            services.AddScoped<IAuthDataService, AuthDataService>(provider => new AuthDataService(connectionString, tokenSettings));
            services.AddScoped<IRoleDataService, RoleDataService>(provider => new RoleDataService(connectionString));
            services.AddScoped<IProductDataService, ProductDataService>(provider => new ProductDataService(connectionString));
             
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

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseCors("CustomPolicy");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();

            app.UseSwaggerUI(s => s.SwaggerEndpoint("/swagger/v1/swagger.json", "ShopTestTask"));
        }
    }
}
