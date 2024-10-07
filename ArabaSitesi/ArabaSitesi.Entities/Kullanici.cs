using System.ComponentModel.DataAnnotations;

namespace ArabaSitesi.Entities
{
    public class Kullanici :IEntity
    {
        public int Id { get; set; }
        [StringLength(50)]
        [Display(Name = "Ad"), Required(ErrorMessage ="{0} Boş bırakılamaz")]
        public string Adi { get; set; }
        [StringLength(50)]
        [Display(Name = "Soyad"), Required(ErrorMessage = "{0} Boş bırakılamaz")]
        public string Soyadi { get; set; }
        [StringLength(50), Required(ErrorMessage = "{0} Boş bırakılamaz")]
        public string Email { get; set; }
        [StringLength(20)]
        public string? Telefon { get; set; }
        [StringLength(50)]
        [Display(Name = "Kullanıcı Adı")]
        public string? KullaniciAdi { get; set; }
        [StringLength(50), Required(ErrorMessage = "{0} Boş bırakılamaz")]
        [Display(Name = "Şifre")]
        public string Sifre { get; set; }
        [Display(Name = "Aktif mi?")]
        public bool AktifMi { get; set; }
        [Display(Name = "Eklenme Tarihi"),ScaffoldColumn(false)]
        public DateTime? EklenmeTarihi { get; set; } = DateTime.Now;
        [Display(Name ="Kullanıcı Rolü")]
        public int RolId { get; set; }
        [Display(Name = "Kullanıcı Rolü")]
        public virtual Rol? Rol { get; set; }
    }
}
