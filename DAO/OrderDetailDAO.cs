using BusinessObjects;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class OrderDetailDAO
    {
        private static OrderDetailDAO instance = null;
        private readonly static object instanceLock = new object();
        private OrderDetailDAO()
        {

        }
        public static OrderDetailDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new OrderDetailDAO();
                    }
                    return instance;
                }
            }
        }

        public async Task<IEnumerable<OrderDetail>> GetOrderDetailsAsync(int orderId)
        {
            var database = new eStoreContext();
            return await database.OrderDetails
                .Where(od => od.OrderId == orderId)
                .Include(od => od.Product)
                .ToListAsync();
        }
    }
}
