using BusinessObjects;
using eStoreLibrary;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Repository;

namespace eStoreAPI
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddRepository(this IServiceCollection services)
        {
            services.AddDbContext<eStoreContext>(options =>
                options.UseSqlServer(eStoreAPIConfiguration.ConnectionString));

            services.AddScoped<ICategoryRepository, CategoryRepository>();
            //services.AddScoped<IMemberRepository, MemberRepository>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IOrderDetailRepository, OrderDetailRepository>();
            services.AddScoped<IProductRepository, ProductRepository>();

            return services;
        }
    }
}
