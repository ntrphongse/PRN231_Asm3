using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace eStore.Data
{
    public class eStoreClientContext : IdentityDbContext
    {
        public eStoreClientContext(DbContextOptions<eStoreClientContext> options)
            : base(options)
        {
        }
    }
}
