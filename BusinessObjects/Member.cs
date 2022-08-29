using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObjects
{
    public class Member : IdentityUser
    {
        public Member()
        {
            Orders = new HashSet<Order>();
        }

        public Member(IdentityUser user)
        {
            Orders = new HashSet<Order>();
            Id = user.Id;
            UserName = user.UserName;
            NormalizedUserName = user.NormalizedUserName;
            Email = user.Email;
            NormalizedEmail = user.NormalizedEmail;
            EmailConfirmed = user.EmailConfirmed;
            PasswordHash = user.PasswordHash;
            SecurityStamp = user.SecurityStamp;
            ConcurrencyStamp = user.ConcurrencyStamp;
            PhoneNumber = user.PhoneNumber;
            PhoneNumberConfirmed = user.PhoneNumberConfirmed;
            TwoFactorEnabled = user.TwoFactorEnabled;
            LockoutEnd = user.LockoutEnd;
            LockoutEnabled = user.LockoutEnabled;
            AccessFailedCount = user.AccessFailedCount;
        }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
