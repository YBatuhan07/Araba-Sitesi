using ArabaSitesi.Entities;
using System.Net;
using System.Net.Mail;

namespace ArabaSitesi.WebUI.Utils
{
    public class MailHelper
    {
        public static async Task SendMailAsync(Musteri musteri)
        {
            SmtpClient smtpClient = new SmtpClient("mail.adres.com",587);
            smtpClient.Credentials = new NetworkCredential("emailAdı","emailSifre");
            smtpClient.EnableSsl = true;
            MailMessage message = new MailMessage();
            message.From = new MailAddress("info@siteadi.com");
            message.To.Add("info@siteadi.com");
            message.To.Add("info2@siteadi.com");
            message.Subject = "Mesaj geldi";
            message.Body =
                $"Mail bilgileri <hr/> Ad Soyad: : {musteri.Adi} {musteri.Soyadi} <hr/>" +
                $" araba {musteri.AracId} <hr/> Email : {musteri.Email} <hr/> Telefon: {musteri.Telefon}";
            message.IsBodyHtml = true;
            await smtpClient.SendMailAsync(message);
            smtpClient.Dispose();
        }
    }
}
