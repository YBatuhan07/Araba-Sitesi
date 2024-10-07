using System.ComponentModel.DataAnnotations;

namespace ArabaSitesi.WebUI.Models
{
    public class CustomerLoginViewModel
    {
        [StringLength(50), Required(ErrorMessage = "{0} Boş bırakılamaz")]
        public string Email { get; set; }
        [StringLength(50), Required(ErrorMessage = "{0} Boş bırakılamaz")]
        [Display(Name = "Şifre")]
        public string Sifre { get; set; }
    }
}
