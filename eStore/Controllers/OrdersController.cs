using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjects;
using Microsoft.AspNetCore.Identity;
using System.Net.Http;
using eStoreLibrary;
using Microsoft.AspNetCore.Authorization;

namespace eStore.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        private readonly eStoreContext _context;
        private readonly UserManager<IdentityUser> userManager;

        public OrdersController(eStoreContext context,
            UserManager<IdentityUser> userManager)
        {
            _context = context;
            this.userManager = userManager;
        }

        // GET: Orders
        [Authorize]
        public IActionResult Index()
        {
            //var eStoreContext = _context.Orders.Include(o => o.Member);
            //return View(await eStoreContext.ToListAsync());
            return View();
        }

        private IEnumerable<IdentityUser> GetMembers()
        {
            return userManager.Users.ToList();
        }

        private async Task<IEnumerable<Product>> GetProductsAsync()
        {
            HttpResponseMessage response = await eStoreClientUtils.ApiRequest(
                eStoreHttpMethod.GET,
                eStoreClientConfiguration.DefaultBaseApiUrl + "/Products");

            if (response.IsSuccessStatusCode)
            {
                IEnumerable<Product> products =
                    await response.Content.ReadAsAsync<IEnumerable<Product>>();
                return products;
            }
            else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new Exception("Failed to get products! Please log out and log in again...");
            }
            else
            {
                throw new Exception(await response.Content.ReadAsStringAsync());
            }
        }

        // GET: Orders/Details/5
        public IActionResult Details(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var order = await _context.Orders
            //    .Include(o => o.Member)
            //    .FirstOrDefaultAsync(m => m.OrderId == id);
            //if (order == null)
            //{
            //    return NotFound();
            //}

            //return View(order);
            return View();
        }

        // GET: Orders/Create
        public async Task<IActionResult> Create()
        {
            try
            {
                ViewData["ProductsSelectedList"] = new SelectList(await GetProductsAsync(), "ProductId", "ProductName");
                ViewData["MemberId"] = new SelectList(GetMembers(), "Id", "Email");

                return View();
            }
            catch (Exception ex)
            {
                ViewData["Orders"] = ex.Message;
                return View();
            }
        }

        public IActionResult Report()
        {
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("OrderId,MemberId,OrderDate,RequiredDate,ShippedDate,Freight")] Order order)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _context.Add(order);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["MemberId"] = new SelectList(_context.Set<Member>(), "Id", "Id", order.MemberId);
        //    return View(order);
        //}

        // GET: Orders/Edit/5
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    //if (id == null)
        //    //{
        //    //    return NotFound();
        //    //}

        //    //var order = await _context.Orders.FindAsync(id);
        //    //if (order == null)
        //    //{
        //    //    return NotFound();
        //    //}
        //    //ViewData["MemberId"] = new SelectList(_context.Set<Member>(), "Id", "Id", order.MemberId);
        //    //return View(order);
        //    //return View();
        //}

        // POST: Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("OrderId,MemberId,OrderDate,RequiredDate,ShippedDate,Freight")] Order order)
        //{
        //    if (id != order.OrderId)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(order);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!OrderExists(order.OrderId))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["MemberId"] = new SelectList(_context.Set<Member>(), "Id", "Id", order.MemberId);
        //    return View(order);
        //}

        // GET: Orders/Delete/5
        public IActionResult Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var order = await _context.Orders
            //    .Include(o => o.Member)
            //    .FirstOrDefaultAsync(m => m.OrderId == id);
            //if (order == null)
            //{
            //    return NotFound();
            //}

            //return View(order);
            return View();
        }

        // POST: Orders/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var order = await _context.Orders.FindAsync(id);
        //    _context.Orders.Remove(order);
        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        //private bool OrderExists(int id)
        //{
        //    return _context.Orders.Any(e => e.OrderId == id);
        //}
    }
}
