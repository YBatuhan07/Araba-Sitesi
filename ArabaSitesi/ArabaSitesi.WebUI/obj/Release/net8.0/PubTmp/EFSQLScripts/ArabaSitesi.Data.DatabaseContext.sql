IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Markalar] (
        [Id] int NOT NULL IDENTITY,
        [Adi] varchar(50) NOT NULL,
        CONSTRAINT [PK_Markalar] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Roller] (
        [Id] int NOT NULL IDENTITY,
        [Adi] varchar(50) NOT NULL,
        CONSTRAINT [PK_Roller] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Servisler] (
        [Id] int NOT NULL IDENTITY,
        [ServiseGelisTarihi] datetime2 NOT NULL,
        [AracSorunu] nvarchar(max) NOT NULL,
        [ServisUcreti] decimal(18,2) NOT NULL,
        [ServistenCikisTarihi] datetime2 NOT NULL,
        [YapilanIslemler] nvarchar(max) NULL,
        [GarantiKapsamindaMi] bit NOT NULL,
        [AracPlaka] nvarchar(15) NOT NULL,
        [Marka] nvarchar(50) NOT NULL,
        [Model] nvarchar(50) NULL,
        [KasaTipi] nvarchar(50) NULL,
        [SaseNo] nvarchar(50) NULL,
        [Notlar] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Servisler] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Araclar] (
        [Id] int NOT NULL IDENTITY,
        [MarkaId] int NOT NULL,
        [Renk] nvarchar(50) NOT NULL,
        [Fiyati] decimal(18,2) NOT NULL,
        [Modeli] nvarchar(50) NOT NULL,
        [KasaTipi] nvarchar(50) NOT NULL,
        [ModelYili] int NOT NULL,
        [SatistaMi] bit NOT NULL,
        [Notlar] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Araclar] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Araclar_Markalar_MarkaId] FOREIGN KEY ([MarkaId]) REFERENCES [Markalar] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Kullanicilar] (
        [Id] int NOT NULL IDENTITY,
        [Adi] nvarchar(50) NOT NULL,
        [Soyadi] nvarchar(50) NOT NULL,
        [Email] nvarchar(50) NOT NULL,
        [Telefon] nvarchar(20) NOT NULL,
        [KullaniciAdi] nvarchar(50) NOT NULL,
        [Sifre] nvarchar(50) NOT NULL,
        [AktifMi] bit NOT NULL,
        [EklenmeTarihi] datetime2 NULL,
        [RolId] int NOT NULL,
        CONSTRAINT [PK_Kullanicilar] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Kullanicilar_Roller_RolId] FOREIGN KEY ([RolId]) REFERENCES [Roller] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Musteriler] (
        [Id] int NOT NULL IDENTITY,
        [AracId] int NOT NULL,
        [Adi] nvarchar(50) NOT NULL,
        [Soyadi] nvarchar(50) NOT NULL,
        [TcNo] nvarchar(11) NULL,
        [Email] nvarchar(50) NOT NULL,
        [Adres] nvarchar(500) NULL,
        [Telefon] nvarchar(15) NULL,
        [Notlar] nvarchar(max) NULL,
        CONSTRAINT [PK_Musteriler] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Musteriler_Araclar_AracId] FOREIGN KEY ([AracId]) REFERENCES [Araclar] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE TABLE [Satislar] (
        [Id] int NOT NULL IDENTITY,
        [AracId] int NOT NULL,
        [MusteriId] int NOT NULL,
        [SatisFiyati] decimal(18,2) NOT NULL,
        [SatisTarihi] datetime2 NOT NULL,
        CONSTRAINT [PK_Satislar] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Satislar_Araclar_AracId] FOREIGN KEY ([AracId]) REFERENCES [Araclar] ([Id]),
        CONSTRAINT [FK_Satislar_Musteriler_MusteriId] FOREIGN KEY ([MusteriId]) REFERENCES [Musteriler] ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Adi') AND [object_id] = OBJECT_ID(N'[Roller]'))
        SET IDENTITY_INSERT [Roller] ON;
    EXEC(N'INSERT INTO [Roller] ([Id], [Adi])
    VALUES (1, ''Admin'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Adi') AND [object_id] = OBJECT_ID(N'[Roller]'))
        SET IDENTITY_INSERT [Roller] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Adi', N'AktifMi', N'EklenmeTarihi', N'Email', N'KullaniciAdi', N'RolId', N'Sifre', N'Soyadi', N'Telefon') AND [object_id] = OBJECT_ID(N'[Kullanicilar]'))
        SET IDENTITY_INSERT [Kullanicilar] ON;
    EXEC(N'INSERT INTO [Kullanicilar] ([Id], [Adi], [AktifMi], [EklenmeTarihi], [Email], [KullaniciAdi], [RolId], [Sifre], [Soyadi], [Telefon])
    VALUES (1, N''Admin'', CAST(1 AS bit), ''2024-10-04T15:18:04.5146670+03:00'', N''admin@otoservissatis.tc'', N''admin'', 1, N''123456'', N''Admin'', N''553'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Adi', N'AktifMi', N'EklenmeTarihi', N'Email', N'KullaniciAdi', N'RolId', N'Sifre', N'Soyadi', N'Telefon') AND [object_id] = OBJECT_ID(N'[Kullanicilar]'))
        SET IDENTITY_INSERT [Kullanicilar] OFF;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Araclar_MarkaId] ON [Araclar] ([MarkaId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Kullanicilar_RolId] ON [Kullanicilar] ([RolId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Musteriler_AracId] ON [Musteriler] ([AracId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Satislar_AracId] ON [Satislar] ([AracId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_Satislar_MusteriId] ON [Satislar] ([MusteriId]);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004121805_InitialCreate'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241004121805_InitialCreate', N'8.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004210823_DataAnnotationsEklendi'
)
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Kullanicilar]') AND [c].[name] = N'Telefon');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Kullanicilar] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Kullanicilar] ALTER COLUMN [Telefon] nvarchar(20) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004210823_DataAnnotationsEklendi'
)
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Kullanicilar]') AND [c].[name] = N'KullaniciAdi');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Kullanicilar] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Kullanicilar] ALTER COLUMN [KullaniciAdi] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004210823_DataAnnotationsEklendi'
)
BEGIN
    EXEC(N'UPDATE [Kullanicilar] SET [EklenmeTarihi] = ''2024-10-05T00:08:22.8272686+03:00''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241004210823_DataAnnotationsEklendi'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241004210823_DataAnnotationsEklendi', N'8.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Musteriler]') AND [c].[name] = N'TcNo');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Musteriler] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Musteriler] ALTER COLUMN [TcNo] nvarchar(50) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    ALTER TABLE [Araclar] ADD [Resim1] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    ALTER TABLE [Araclar] ADD [Resim2] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    ALTER TABLE [Araclar] ADD [Resim3] nvarchar(100) NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    EXEC(N'UPDATE [Kullanicilar] SET [EklenmeTarihi] = ''2024-10-06T11:12:39.9388908+03:00''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006081240_AracResimEklendi'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241006081240_AracResimEklendi', N'8.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006082049_SliderEklendi'
)
BEGIN
    CREATE TABLE [Sliders] (
        [Id] int NOT NULL IDENTITY,
        [Baslik] nvarchar(200) NULL,
        [Aciklama] nvarchar(500) NULL,
        [Resim] nvarchar(100) NULL,
        [Link] nvarchar(100) NULL,
        CONSTRAINT [PK_Sliders] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006082049_SliderEklendi'
)
BEGIN
    EXEC(N'UPDATE [Kullanicilar] SET [EklenmeTarihi] = ''2024-10-06T11:20:49.0397994+03:00''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006082049_SliderEklendi'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241006082049_SliderEklendi', N'8.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006172951_AnasayfaEklendi'
)
BEGIN
    ALTER TABLE [Araclar] ADD [Anasayfa] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006172951_AnasayfaEklendi'
)
BEGIN
    EXEC(N'UPDATE [Kullanicilar] SET [EklenmeTarihi] = ''2024-10-06T20:29:50.8602972+03:00''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241006172951_AnasayfaEklendi'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241006172951_AnasayfaEklendi', N'8.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241007203007_UserGuidEklendi'
)
BEGIN
    ALTER TABLE [Kullanicilar] ADD [UserGuid] uniqueidentifier NULL;
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241007203007_UserGuidEklendi'
)
BEGIN
    EXEC(N'UPDATE [Kullanicilar] SET [EklenmeTarihi] = ''2024-10-07T23:30:07.1300098+03:00'', [UserGuid] = ''55ede3d1-5c1c-4de6-9358-eba6adc0f3fa''
    WHERE [Id] = 1;
    SELECT @@ROWCOUNT');
END;
GO

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20241007203007_UserGuidEklendi'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241007203007_UserGuidEklendi', N'8.0.10');
END;
GO

COMMIT;
GO

