using ArabaSitesi.Entities;
using ArabaSitesi.Service.Abstract;
using ArabaSitesi.Service.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace ArabaSitesi.WebUI.Controllers
{
    public class AracController : Controller
    {
        private readonly ICarService _serviceArac;
        private readonly IService<Musteri> _serviceMusteri;


        public AracController(ICarService serviceArac, IService<Musteri> serviceMusteri)
        {
            _serviceArac = serviceArac;
            _serviceMusteri = serviceMusteri;
        }

        public async Task<IActionResult> IndexAsync(int id)
        {
            var model = await _serviceArac.GetCustomCar(id);
            return View(model);
        }
        [Route("tum-araclar")]
        public async Task<IActionResult> List()
        {
            var model = await _serviceArac.GetCustomCarList(c => c.SatistaMi);
            return View(model);
        }
        public async Task<IActionResult> Ara(string q)
        {
            var model = await _serviceArac.GetCustomCarList(c =>
            c.SatistaMi && 
            (c.Marka.Adi.Contains(q) || c.Modeli.Contains(q) ||c.KasaTipi.Contains(q)));
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> MusteriKayit(Musteri musteri)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await _serviceMusteri.AddAsync(musteri);
                    await _serviceMusteri.SaveAsync();
                    return Redirect("/Arac/Index/" + musteri.AracId);
                }
                catch
                {
                    ModelState.AddModelError("", "Hata oluştu");
                }
            }
            return View();
        }
    }
}
