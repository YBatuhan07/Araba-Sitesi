using System.ComponentModel.DataAnnotations;

namespace ArabaSitesi.Entities
{
    public class Slider : IEntity
    {
        public int Id { get; set; }
        [Display(Name = "Başlık"), StringLength(200)]
        public string? Baslik { get; set; }
        [Display(Name = "Açıklama"), StringLength(500)]
        public string? Aciklama { get; set; }
        [StringLength(100)]
        public string? Resim { get; set; }
        [StringLength(100)]
        public string? Link { get; set; }
    }
}
