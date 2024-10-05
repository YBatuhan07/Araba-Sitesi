﻿using ArabaSitesi.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArabaSitesi.Data
{
    public class DatabaseContext : DbContext
    {
        public DbSet<Arac> Araclar { get; set; }
        public DbSet<Kullanici> Kullanicilar { get; set; }
        public DbSet<Marka> Markalar { get; set; }
        public DbSet<Musteri> Musteriler { get; set; }
        public DbSet<Rol> Roller { get; set; }
        public DbSet<Satis> Satislar { get; set; }
        public DbSet<Servis> Servisler { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(
                @"server = (LocalDB)\MSSQLLocalDB;database=ArabaSitesiNetCore;
                integrated security=True;
                MultipleActiveResultSets=True;");
            base.OnConfiguring(optionsBuilder);
        }

        //Fluent API
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Rol varlığının Adi özelliği zorunlu ve varchar(50) tipinde olmalıdır.
            // Rol içinde data annoation tanımlamaya gerek kalmadı.
            modelBuilder.Entity<Rol>().Property(m=>m.Adi).IsRequired().HasColumnType("varchar(50)");

            // Marka varlığının Adi özelliği zorunlu ve varchar(50) tipinde olmalıdır.
            // Marka içinde data annoation tanımlamaya gerek kalmadı.
            modelBuilder.Entity<Marka>().Property(m => m.Adi).IsRequired().HasColumnType("varchar(50)");

            // Veritabanı oluşturulurken varsayılan verileri eklemek için kullanılır.
            // Rol tablosuna "Admin" rolünü ekler.
            modelBuilder.Entity<Rol>().HasData(new Rol
            {
                Id = 1,
                Adi = "Admin"
            });

            // Kullanici tablosuna "Admin" kullanıcısını ekler.
            modelBuilder.Entity<Kullanici>().HasData(new Kullanici
            {
                Id = 1,
                Adi = "Admin",
                Soyadi = "Admin",
                Telefon = "553",
                AktifMi = true,
                EklenmeTarihi = DateTime.Now, // Kullanıcının eklenme tarihini otomatik olarak ayarlar.
                Email = "admin@otoservissatis.tc",
                KullaniciAdi = "admin",
                Sifre = "123456",
                /*Rol = new Rol { Id = 1 },*/ // Kullanıcıya "Admin" rolünü atar.
                RolId = 1
            });
            base.OnModelCreating(modelBuilder); // Temel sınıfın OnModelCreating metodunu çağırır.
        }
    }
}
