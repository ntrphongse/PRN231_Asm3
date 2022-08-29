using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjects;
using System.Net.Http;
using eStoreLibrary;
using Microsoft.AspNetCore.Authorization;

namespace eStore.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductsController : Controller
    {
        private readonly eStoreContext _context;

        public ProductsController(eStoreContext context)
        {
            _context = context;
        }

        // GET: Products
        public IActionResult Index()
        {
            //var eStoreContext = _context.Products.Include(p => p.Category);
            //return View(await eStoreContext.ToListAsync());
            return View();
        }

        private async Task<IEnumerable<Category>> GetCategoriesAsync()
        {
            HttpResponseMessage response = await eStoreClientUtils.ApiRequest(
                eStoreHttpMethod.GET,
                eStoreClientConfiguration.DefaultBaseApiUrl + "/Categories");

            if (response.IsSuccessStatusCode)
            {
                IEnumerable<Category> categories =
                    await response.Content.ReadAsAsync<IEnumerable<Category>>();
                return categories;
            }
            else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                throw new Exception("Failed to get categories! Please log out and log in again...");
            }
            else
            {
                throw new Exception(await response.Content.ReadAsStringAsync());
            }
        }

        // GET: Products/Details/5
        public IActionResult Details(int? id)
        {
            //try
            //{
            //    if (id == null)
            //{
            //    throw new Exception("Product is not specified!");
            //}
            //}
            //catch (Exception ex)
            //{
            //    ViewData["Products"] = ex.Message;
            //    return View();
            //}

            //var product = await _context.Products
            //    .Include(p => p.Category)
            //    .FirstOrDefaultAsync(m => m.ProductId == id);
            //if (product == null)
            //{
            //    return NotFound();
            //}

            //return View(product);
            return View();
        }

        // GET: Products/Create
        public async Task<IActionResult> Create()
        {
            ViewData["CategoryId"] = new SelectList(await GetCategoriesAsync(), "CategoryId", "CategoryName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,CategoryId,ProductName,Weight,UnitPrice,UnitsInStock")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", product.CategoryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    throw new Exception("Product is not specified!");
                }
                HttpResponseMessage response = await eStoreClientUtils.ApiRequest(
                    eStoreHttpMethod.GET,
                    eStoreClientConfiguration.DefaultBaseApiUrl + "/Products/" + id);

                if (response.IsSuccessStatusCode)
                {
                    Product product = await response.Content.ReadAsAsync<Product>();
                    ViewData["CategoryId"] = new SelectList(await GetCategoriesAsync(), "CategoryId", "CategoryName", product.CategoryId);

                    return View(product);
                }
                else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                {
                    return RedirectToAction("AccessDenied", "Login");
                }
                else
                {
                    throw new Exception(await response.Content.ReadAsStringAsync());
                }
            }
            catch (Exception ex)
            {
                ViewData["Products"] = ex.Message;
                return View();
            }
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("ProductId,CategoryId,ProductName,Weight,UnitPrice,UnitsInStock")] Product product)
        //{
        //    if (id != product.ProductId)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(product);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!ProductExists(product.ProductId))
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
        //    ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", product.CategoryId);
        //    return View(product);
        //}

        // GET: Products/Delete/5
        public IActionResult Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var product = await _context.Products
            //    .Include(p => p.Category)
            //    .FirstOrDefaultAsync(m => m.ProductId == id);
            //if (product == null)
            //{
            //    return NotFound();
            //}

            //return View(product);
            return View();
        }

        // POST: Products/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var product = await _context.Products.FindAsync(id);
        //    _context.Products.Remove(product);
        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        //private bool ProductExists(int id)
        //{
        //    return _context.Products.Any(e => e.ProductId == id);
        //}
    }
}
