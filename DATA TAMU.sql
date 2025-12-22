------------------------------------------------------------
-- CREATE DATABASE
------------------------------------------------------------
CREATE DATABASE HotelReservasi;
GO

USE HotelReservasi;
GO

------------------------------------------------------------
-- TABLE TAMU
------------------------------------------------------------
CREATE TABLE Tamu (
    TamuID INT IDENTITY(1,1) PRIMARY KEY,
    NamaTamu VARCHAR(100),
    Alamat TEXT,
    NoTelepon VARCHAR(20),
    Email VARCHAR(100)
);

------------------------------------------------------------
-- TABLE TIPE KAMAR
------------------------------------------------------------
CREATE TABLE TipeKamar (
    TipeKamarID INT IDENTITY(1,1) PRIMARY KEY,
    NamaTipe VARCHAR(50),
    HargaPerMalam INT,
    Kapasitas INT
);

------------------------------------------------------------
-- TABLE KAMAR
------------------------------------------------------------
CREATE TABLE Kamar (
    KamarID INT IDENTITY(1,1) PRIMARY KEY,
    NomorKamar VARCHAR(10),
    StatusKamar VARCHAR(20),
    TipeKamarID INT,
    FOREIGN KEY (TipeKamarID)
        REFERENCES TipeKamar(TipeKamarID)
);

------------------------------------------------------------
-- TABLE PEGAWAI
------------------------------------------------------------
CREATE TABLE Pegawai (
    PegawaiID INT IDENTITY(1,1) PRIMARY KEY,
    NamaPegawai VARCHAR(100),
    Jabatan VARCHAR(50),
    NoTelepon VARCHAR(20)
);

------------------------------------------------------------
-- TABLE RESERVASI
------------------------------------------------------------
CREATE TABLE Reservasi (
    ReservasiID INT IDENTITY(1,1) PRIMARY KEY,
    TanggalCheckIn DATE,
    TanggalCheckOut DATE,
    StatusReservasi VARCHAR(20),
    TamuID INT,
    PegawaiID INT,
    FOREIGN KEY (TamuID)
        REFERENCES Tamu(TamuID),
    FOREIGN KEY (PegawaiID)
        REFERENCES Pegawai(PegawaiID)
);

------------------------------------------------------------
-- TABLE DETAIL RESERVASI
------------------------------------------------------------
CREATE TABLE DetailReservasi (
    DetailReservasiID INT IDENTITY(1,1) PRIMARY KEY,
    ReservasiID INT,
    KamarID INT,
    FOREIGN KEY (ReservasiID)
        REFERENCES Reservasi(ReservasiID),
    FOREIGN KEY (KamarID)
        REFERENCES Kamar(KamarID)
);

------------------------------------------------------------
-- TABLE METODE PEMBAYARAN
------------------------------------------------------------
CREATE TABLE MetodePembayaran (
    MetodeID INT IDENTITY(1,1) PRIMARY KEY,
    NamaMetode VARCHAR(50)
);

------------------------------------------------------------
-- TABLE PEMBAYARAN
------------------------------------------------------------
CREATE TABLE Pembayaran (
    PembayaranID INT IDENTITY(1,1) PRIMARY KEY,
    TanggalBayar DATE,
    TotalBayar INT,
    StatusPembayaran VARCHAR(20),
    ReservasiID INT,
    MetodeID INT,
    FOREIGN KEY (ReservasiID)
        REFERENCES Reservasi(ReservasiID),
    FOREIGN KEY (MetodeID)
        REFERENCES MetodePembayaran(MetodeID)
);

------------------------------------------------------------
-- TABLE LAYANAN
------------------------------------------------------------
CREATE TABLE Layanan (
    LayananID INT IDENTITY(1,1) PRIMARY KEY,
    NamaLayanan VARCHAR(100),
    HargaLayanan INT
);

------------------------------------------------------------
-- TABLE DETAIL LAYANAN
------------------------------------------------------------
CREATE TABLE DetailLayanan (
    DetailLayananID INT IDENTITY(1,1) PRIMARY KEY,
    ReservasiID INT,
    LayananID INT,
    Jumlah INT,
    FOREIGN KEY (ReservasiID)
        REFERENCES Reservasi(ReservasiID),
    FOREIGN KEY (LayananID)
        REFERENCES Layanan(LayananID)
);

------------------------------------------------------------
-- INSERT DATA TAMU
------------------------------------------------------------
INSERT INTO Tamu (NamaTamu, Alamat, NoTelepon, Email) VALUES
('Ahmad Fauzi', 'Bandung', '081234567801', 'ahmad1@mail.com'),
('Deni Firmansyah', 'Jakarta', '081234567802', 'deni2@mail.com'),
('Dedi Pratama', 'Bekasi', '081234567803', 'dedi3@mail.com'),
('Rizky anugrah', 'Bogor', '081234567804', 'anang@mail.com'),
('Nugraha Putra', 'Depok', '081234567805', 'nugraha5@mail.com'),
('Rizki Maulana', 'Bandung', '081234567806', 'rizki6@mail.com'),
('Andi Saputra', 'Garut', '081234567807', 'andi7@mail.com'),
('Fajar Ramadhan', 'Cimahi', '081234567808', 'fajar8@mail.com'),
('Ilham Kurnia', 'Tasikmalaya', '081234567809', 'ilham9@mail.com'),
('Agus Salim', 'Subang', '081234567810', 'agus10@mail.com'),
('Budi Santoso', 'Purwakarta', '081234567811', 'budi11@mail.com'),
('Eko Prasetyo', 'Karawang', '081234567812', 'eko12@mail.com'),
('Hendra Wijaya', 'Cirebon', '081234567813', 'hendra13@mail.com'),
('Indra Gunawan', 'Majalengka', '081234567814', 'indra14@mail.com'),
('Joko Susilo', 'Solo', '081234567815', 'joko15@mail.com'),
('Kurniawan', 'Yogyakarta', '081234567816', 'kurnia16@mail.com'),
('Lukman Hakim', 'Semarang', '081234567817', 'lukman17@mail.com'),
('Mochamad Arif', 'Malang', '081234567818', 'arif18@mail.com'),
('Nanda Pradipta', 'Surabaya', '081234567819', 'nanda19@mail.com'),
('Oki Setiawan', 'Sidoarjo', '081234567820', 'oki20@mail.com'),
('Putra Anugrah', 'Kediri', '081234567821', 'putra21@mail.com'),
('Qori Maulida', 'Jember', '081234567822', 'qori22@mail.com'),
('Rama Saputra', 'Banyuwangi', '081234567823', 'rama23@mail.com'),
('Satria Nugroho', 'Madiun', '081234567824', 'satria24@mail.com'),
('Taufik Hidayat', 'Blitar', '081234567825', 'taufik25@mail.com'),
('Umar Faruq', 'Pasuruan', '081234567826', 'umar26@mail.com'),
('Vino Prakoso', 'Probolinggo', '081234567827', 'vino27@mail.com'),
('Wahyu Setiawan', 'Lamongan', '081234567828', 'wahyu28@mail.com'),
('Yoga Pratama', 'Gresik', '081234567829', 'yoga29@mail.com'),
('Zaki Ramadhan', 'Mojokerto', '081234567830', 'zaki30@mail.com');



------------------------------------------------------------
-- INSERT DATA TIPE KAMAR
------------------------------------------------------------
INSERT INTO TipeKamar (NamaTipe, HargaPerMalam, Kapasitas) VALUES
('Standard', 300000, 2),
('Deluxe', 450000, 2),
('Suite', 700000, 4);

------------------------------------------------------------
-- INSERT DATA KAMAR
------------------------------------------------------------
INSERT INTO Kamar (NomorKamar, StatusKamar, TipeKamarID) VALUES
('101', 'Tersedia', 1),
('102', 'Tersedia', 1),
('201', 'Tersedia', 2),
('202', 'Tersedia', 2),
('301', 'Tersedia', 3);

------------------------------------------------------------
-- INSERT DATA PEGAWAI
------------------------------------------------------------
INSERT INTO Pegawai (NamaPegawai, Jabatan, NoTelepon) VALUES
('Bayu Adji', 'Resepsionis', '0821111111'),
('Halim Suryana', 'Admin', '0822222222'),
('Fauzan Muhammad', 'Kasir', '082333354'),
('Nugraha Putra', 'Kasir', '0823333356'),
('Vica Septiana', 'Kasir', '0823333333');

------------------------------------------------------------
-- INSERT DATA RESERVASI
------------------------------------------------------------
INSERT INTO Reservasi (TanggalCheckIn, TanggalCheckOut, StatusReservasi, TamuID, PegawaiID) VALUES
('2025-01-10', '2025-01-12', 'Aktif', 1, 1),
('2025-01-11', '2025-01-13', 'Aktif', 2, 2),
('2025-01-12', '2025-01-14', 'Selesai', 3, 1);

------------------------------------------------------------
-- INSERT DATA DETAIL RESERVASI
------------------------------------------------------------
INSERT INTO DetailReservasi (ReservasiID, KamarID) VALUES
(1, 1),
(2, 3),
(3, 5);

------------------------------------------------------------
-- INSERT DATA METODE PEMBAYARAN
------------------------------------------------------------
INSERT INTO MetodePembayaran (NamaMetode) VALUES
('Cash'),
('Transfer'),
('QRIS');

------------------------------------------------------------
-- INSERT DATA PEMBAYARAN
------------------------------------------------------------
INSERT INTO Pembayaran (TanggalBayar, TotalBayar, StatusPembayaran, ReservasiID, MetodeID) VALUES
('2025-01-10', 600000, 'Lunas', 1, 1),
('2025-01-11', 900000, 'Lunas', 2, 2),
('2025-01-12', 1400000, 'Lunas', 3, 3);

------------------------------------------------------------
-- INSERT DATA LAYANAN
------------------------------------------------------------
INSERT INTO Layanan (NamaLayanan, HargaLayanan) VALUES
('Laundry', 50000),
('Room Service', 75000),
('Spa', 150000);

------------------------------------------------------------
-- INSERT DATA DETAIL LAYANAN
------------------------------------------------------------
INSERT INTO DetailLayanan (ReservasiID, LayananID, Jumlah) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1);
