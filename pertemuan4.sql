USE KampusDB;

--CROSS JOIN
--Menampilkan semua kombinasi mahasiswa dan matakuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMK FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS JOIN MataKuliah AS MK;

--menampilkan semua kombinasi dosen dan ruangan
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS JOIN Ruangan R;

--LEFT JOIN
--Menampilkan semua mahasiswa termasuk yang belum mengambil KRS
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT JOIN KRS K ON M.MahasiswaID = K.MahasiswaID;

--menampilkan semua mata kuliah, termasuk yg blm ada jadwal
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
LEFT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--RIGHT JOIN
--menampilkan semua jadwal, walaupum tidak ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
RIGHT JOIN JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--menampilkan semua ruangan, apakah dipakai atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--INNER JOIN
--menampilkan nama mahasiswa dan matakuliahnya melalui tabel KRS
SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID

--menampilkan mata kuliah dan dosen pengampu
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK
JOIN Dosen D ON MK.DosenID = D.DosenID

--menampilkan semua jadwal 
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J 
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID; 

--menampilkan nama mahasiswa, matkul dengan nilai akhir
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID; 

--menampilkan dosen dan matakuliah yang diajar
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER JOIN MataKuliah MK ON D.DosenID = MK.DosenID;

--menampilkan nama mahasiswa dan nilai akhirnya
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = M.MahasiswaID;

--SELF JOIN
--mencari pasangan mahasiswa dari prodi yang sama
SELECT A.NamaMahasiswa AS Mahasiswa1,	
		B.NamaMahasiswa AS Mahasiswa2,
		A.Prodi
FROM Mahasiswa A
INNER JOIN Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; --agar tidak ad pasangan yang sama

--LATIHAN 
--1.Tampilkan nama mahasiswa (NamaMahasiswa) beserta prodi-nya (Prodi) dari tabel Mahasiswa,tetapi hanya mahasiswa yang memiliki nilai di tabel Nilai
SELECT M.NamaMahasiswa, M.Prodi
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--2.Tampilkan nama dosen(NamaDosen) dan ruangan(KodeRuangan) tempat dosen tersebut mengajar
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
JOIN JadwalKuliah J ON D.DosenID = J.DosenID
JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--3. Tampilkan daftar mahasiswa (NamaMahasiswa) yang mengambil suatu mata kuliah(NamaMK) beserta nama mata kuliah dan dosen pengampu-nya(NamaDosen)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM KRS K
JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON MK.DosenID = D.DosenID;

--4. Tampilkan jadwal kuliah berisi nama mata kuliah(NamaMK), nama dosen(NamaDosen), dan hari kuliah(Hari) tetapi tidak perlu menampilkan ruangan.
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON J.DosenID = D.DosenID;

--5. Tampilkan nilai mahasiswa(NilaiAkhir) lengkap dengan nama mahasiswa(NamaMahasiswa) nama mata kuliah (NamaMK) , nama dosen pengampu(NamaDosen) dan nilai akhirnya(NilaiAkhir)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
JOIN Dosen D ON MK.DosenID = D.DosenID;