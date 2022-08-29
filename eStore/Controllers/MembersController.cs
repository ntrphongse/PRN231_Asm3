using eStore.Models;
using eStoreLibrary;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace eStore.Controllers
{
    public class MembersController : Controller
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;

        public MembersController(
            UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            if (signInManager.IsSignedIn(User))
            {
                if (eStoreClientUtils.IsAdmin(User))
                {
                return RedirectToAction("Index", "Products");
                } else
                {
                    return RedirectToAction("Index", "Orders");
                }
            }
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(MemberLoginModel loginInformation)
        {
            if (signInManager.IsSignedIn(User))
            {
                if (eStoreClientUtils.IsAdmin(User))
                {
                    return RedirectToAction("Index", "Products");
                }
                else
                {
                    return RedirectToAction("Index", "Orders");
                }
            }

            try
            {
                IdentityUser defaultAdmin = JsonConvert.DeserializeObject<IdentityUser>(
                    eStoreLibrary.eStoreClientConfiguration.DefaultAccount);

                if (ModelState.IsValid)
                {
                    if (!loginInformation.Email.ToLower().Equals(defaultAdmin.Email.ToLower()))
                    {
                        IdentityUser user = await userManager.FindByEmailAsync(loginInformation.Email);
                        if (user != null && !user.EmailConfirmed)
                        {
                            throw new Exception("Email is not confirmed yet!!");
                        }
                        //if (await userManager.CheckPasswordAsync(user, loginInformation.Password) == false)
                        //{
                        //    throw new Exception("Invalid login information!!");
                        //}

                        var result = await signInManager.PasswordSignInAsync(loginInformation.Email, loginInformation.Password, false, true);

                        if (result.Succeeded)
                        {
                            await userManager.AddClaimAsync(user, new Claim(ClaimTypes.Role, "User"));
                            //await userManager.AddClaimAsync(user, new Claim(ClaimTypes.NameIdentifier, "User"));
                            return RedirectToAction("Index", "Orders");
                        }
                        else if (result.IsLockedOut)
                        {
                            throw new Exception("Account is locked temporarily!! Please try again in a couple of minutes");
                        }
                        else
                        {
                            throw new Exception("Invalid login information!!!!");
                        }
                    }
                    else
                    {
                        if (loginInformation.Password.Equals(defaultAdmin.PasswordHash))
                        {
                            defaultAdmin.UserName = defaultAdmin.Email;
                            //defaultAdmin.
                            await signInManager.SignInAsync(defaultAdmin, true);
                            //await userManager.AddClaimAsync(defaultAdmin, new Claim(ClaimTypes.Role, "Admin"));
                            
                            return RedirectToAction("Index", "Products");

                        }
                        else
                        {
                            throw new Exception("Invalid login information!!!!");
                        }
                    }
                }
                return View(loginInformation);
            }
            catch (Exception ex)
            {
                ViewData["Login"] = ex.Message;
                return View(loginInformation);
            }

        }

        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("Login", "Members");
        }

        [AllowAnonymous]
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
