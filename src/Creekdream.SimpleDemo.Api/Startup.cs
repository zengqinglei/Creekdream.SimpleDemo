using Creekdream.AspNetCore;
using Creekdream.Dependency;
using Creekdream.Mapping;
using Creekdream.Orm;
using Creekdream.SimpleDemo.Api.Filters;
using Creekdream.SimpleDemo.Api.Middlewares;
using Creekdream.SimpleDemo.Mappers;
using Creekdream.UnitOfWork;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.IO;

namespace Creekdream.SimpleDemo.Api
{
    /// <inheritdoc />
    public class Startup
    {
        private readonly IConfiguration _configuration;

        /// <inheritdoc />
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <summary>
        /// This method gets called by the runtime. Use this method to add services to the container.
        /// </summary>
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.AddMvc(
                options =>
                {
                    options.Filters.Add(typeof(CustomExceptionFilter));
                })
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            #region dapper
            services.AddDbConnection(
                options =>
                {
                    options.UseSqlServer(_configuration.GetConnectionString("Default"));
                    options.MapperAssemblies.Add(typeof(BookMapper).Assembly);
                });
            #endregion

            #region entityframework
            //services.AddDbContext<DbContext, Creekdream.SimpleDemoDbContext>(
            //    options =>
            //    {
            //        options.UseLazyLoadingProxies().UseSqlServer(
            //            _configuration.GetConnectionString("Default"),
            //            option => option.UseRowNumberForPaging());
            //    });
            #endregion

            services.AddSwaggerGen(
                options =>
                {
                    options.SwaggerDoc("v1", new Info { Version = "v1", Title = "简单示例项目API" });
                    var baseDirectory = AppDomain.CurrentDomain.BaseDirectory;
                    options.IncludeXmlComments(Path.Combine(baseDirectory, $"Creekdream.SimpleDemo.Application.xml"));
                    options.IncludeXmlComments(Path.Combine(baseDirectory, $"Creekdream.SimpleDemo.Api.xml"));
                });

            return services.AddCreekdream(
                options =>
                {
                    options.UseAutofac();
                    options.UseDapper();
                    options.UseUnitOfWork();
                    options.UseAutoMapper();
                    options.AddSimpleDemoCore();
                    options.AddSimpleDemoApplication();
                });
        }

        /// <summary>
        /// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// </summary>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            //SeedData.Initialize(app.ApplicationServices).Wait();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCustomRewriter();
            app.UseStaticFiles();
            app.UseSwagger();
            app.UseSwaggerUI(
                c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "简单示例项目API");
                });

            app.UseMvc();
        }
    }
}


