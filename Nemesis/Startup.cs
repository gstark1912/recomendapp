using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.DynamicProxy;
using AutofacSerilogIntegration;
using AutoMapper;
using Castle.DynamicProxy;
using FluentValidation.AspNetCore;
using GSS.Authentication.CAS.AspNetCore;
using GSS.Authentication.CAS.Validation;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Nemesis.API;
using Nemesis.DAL;
using Nemesis.DAL.Common;
using Nemesis.DAL.Interfaces;
using Nemesis.DAL.Repositories;
using Nemesis.Integration.Configuration;
using Nemesis.Integration.Interfaces;
using Nemesis.Integration.Repositories;
using Nemesis.IServices;
using Nemesis.Security;
using Nemesis.Services;
using Nemesis.Utils;
using Newtonsoft.Json.Serialization;
using Serilog;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Transactions;

namespace Nemesis
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

        }

        public IConfiguration Configuration { get; }
        public IContainer ApplicationContainer { get; private set; }
        public ILogger log;

        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            var builder = new ContainerBuilder();

            services.Configure<IntegrationOptions>(Configuration.GetSection("Integration"));
            services.AddMvc()
                .AddJsonOptions(options => options.SerializerSettings.ContractResolver = new DefaultContractResolver())
                .AddFluentValidation(fvc => fvc.RegisterValidatorsFromAssemblyContaining<Dtos.TaskDto>())
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);


            RegisterAuthentication(builder, services);
            RegisterLogger(builder, services);

            //swagger
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "Nemesis API", Version = "v1" });
            });

            //register automapper
            services.AddAutoMapper(cfg =>
            {
                cfg.AddProfiles("Nemesis.Mapper");
                cfg.CreateMissingTypeMaps = true;
            });

            RegisterDatabaseContext(builder, services);

            //register repositories
            RegisterRepositories(builder);

            services.AddDistributedRedisCache(options =>
            {
                options.Configuration = Configuration["Cache:Configuration"];
                options.InstanceName = Configuration["Cache:InstanceName"];
            });

            services.AddCors();

            services.AddHostedService<CacheInitializer>();

            RegisterServices(builder, services);

            this.ApplicationContainer = builder.Build();
            return new AutofacServiceProvider(this.ApplicationContainer);
        }

        private void RegisterAuthentication(ContainerBuilder builder, IServiceCollection services)
        {

            builder.RegisterType<ClaimsTransformer>().As<IClaimsTransformation>();

            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
               .AddCookie(options =>
               {
                   options.LoginPath = "/api/account/login";
                   options.LogoutPath = "/account/logout";
               })
               .AddCAS(options =>
               {
                   options.CallbackPath = "/signin-cas";
                   options.CasServerUrlBase = Configuration["Authentication:CASUrl"];
                   var protocolVersion = Configuration.GetValue("Authentication:CAS:ProtocolVersion", 2);
                   if (protocolVersion != 3)
                   {
                       switch (protocolVersion)
                       {
                           case 1:
                               options.ServiceTicketValidator = new Cas10ServiceTicketValidator(options);
                               break;
                           case 2:
                               options.ServiceTicketValidator = new Cas20ServiceTicketValidator(options);
                               break;
                       }
                   }
                   options.Events = new CasEvents
                   {
                       OnCreatingTicket = context =>
                       {
                           // add claims from CasIdentity.Assertion ?
                           var assertion = context.Assertion;
                           if (assertion == null) return Task.CompletedTask;
                           if (!(context.Principal.Identity is ClaimsIdentity identity)) return Task.CompletedTask;
                           identity.AddClaim(new Claim(identity.NameClaimType, assertion.PrincipalName));
                           
                           //if (assertion.Attributes.TryGetValue("email", out var email))
                           //{
                           //    identity.AddClaim(new Claim(ClaimTypes.Email, email));
                           //}
                           //if (assertion.Attributes.TryGetValue("display_name", out var displayName))
                           //{
                           //    identity.AddClaim(new Claim(ClaimTypes.GivenName, displayName));
                           //}
                           return Task.CompletedTask;
                       }
                   };
               });

            //builder.RegisterType<IsInitiativeResponsibleHandler>().As<IAuthorizationHandler>();

        }

        private void RegisterLogger(ContainerBuilder builder, IServiceCollection services)
        {
            builder.RegisterLogger();
            //builder.Register(c => new LoggerInterceptor());
            builder.RegisterType<LoggerInterceptor>();

            builder.RegisterType<AsyncLoggerInterceptor>().As<IAsyncInterceptor>();
            //builder.RegisterType<AsyncTransactionalInterceptor>().As<IAsyncInterceptor>();
            builder.RegisterType<TransactionalInterceptor>();

        }

        private void RegisterDatabaseContext(ContainerBuilder builder, IServiceCollection services)
        {
            services.AddDbContext<NemesisContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            builder.RegisterType<DbFactory>().As<IDbFactory>();
        }

        private void RegisterRepositories(ContainerBuilder builder)
        {
            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>();
            builder.RegisterType<InitiativeRepository>().As<IInitiativeRepository>();
            builder.RegisterType<TaskRepository>().As<ITaskRepository>();
           
            builder.RegisterType<HRSEmployeeRepository>().As<IHRSEmployeeRepository>().EnableInterfaceInterceptors();
           
        }

        private void RegisterServices(ContainerBuilder builder, IServiceCollection services)
        {
            builder.RegisterType<InitiativeService>().As<IInitiativeService>().EnableInterfaceInterceptors();
            builder.RegisterType<TaskService>().As<ITaskService>().EnableInterfaceInterceptors();
            

            builder.Populate(services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error"); //puede no ir, esto no es MVC
                app.UseHsts();
            }

            app.UseHttpsRedirection(); 
            app.UseStaticFiles();
            app.UseCookiePolicy();
            app.UseSwagger();
            
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });

            app.UseCors(options => {
                options.AllowAnyHeader();
                options.AllowAnyMethod();
                options.AllowAnyOrigin();
                options.AllowCredentials();
            });

            app.UseAuthentication();
            app.UseMvc();
        }        
    }
}
