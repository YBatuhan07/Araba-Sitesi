using ArabaSitesi.Entities;
using ArabaSitesi.Service.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ArabaSitesi.WebUI.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class RolesController : Controller
    {
        private readonly IService<Rol> _service;

        public RolesController(IService<Rol> service)
        {
            _service = service;
        }

        // GET: RolesController1
        public  async Task<ActionResult> IndexAsync()
        {
            var model = await _service.GetAllAsync();
            return View(model);
        }

        // GET: RolesController1/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RolesController1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RolesController1/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "AdminPolicy")]
        public ActionResult Create(Rol rol)
        {
            try
            {
                _service.Add(rol);
                _service.Save();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: RolesController1/Edit/5
        public async Task<ActionResult> EditAsync(int id)
        {
            var model = await _service.FindAsync(id);
            return View(model);
        }

        // POST: RolesController1/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "AdminPolicy")]
        public ActionResult Edit(int id, Rol rol)
        {
            try
            {
                _service.Update(rol);
                _service.Save();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: RolesController1/Delete/5
        public async Task<ActionResult> DeleteAsync(int id)
        {
            var model = await _service.FindAsync(id);
            return View(model);
        }

        // POST: RolesController1/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "AdminPolicy")]
        public ActionResult Delete(int id, Rol rol)
        {
            try
            {
                _service.Delete(rol);
                _service.Save();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
