--menampilkan semua data pada tabel product
SELECT *
FROM Production.Product;

--menampilkan nama,productnumber, dan listprice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--menampilkan data menguunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--menampilkan Hargabaru = listprice = 1.1
SELECT Name, ListPrice, (ListPrice *1.1) AS HargaBaru
FROM Production.Product;

--menggabungkan string dengan data
SELECT Name + '(' + ProductNumber + ')' AS ProductLengkap
FROM Production.Product;

--Filterisasi data
--menampilkan product berwarna red
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'red';

--menampilkan produk yang ListPricenya lebih dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice<1000;

--menampilkan produk yg berwarna hitan dan pricelist dan leebiih dari 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice > 500;

--menampilkan produk yang berwarna redd, blue, and black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black');

--menampilkan product yang namanya mengandung kata 'road'
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Road%';

--agregasi dan pengelompokan
--menghiyung total baris
SELECT COUNT(*) AS TotalProduk
FROM Production.Product

--menampilkan warna produk dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--menampilkan productID, Jumlah Orderqyt, dan rata2 unit price
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT * 
FROM Sales.SalesOrderDetail

--menentukan data dengan gruping lebiih dari 1 color
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product

--filter hasil agregasi
--menampilkan warna produk yanng jumlahnya lebih dr 20
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) >2;

--menampilkan warna produk yang listpricenya lebih dari 500 dan jumlahnyalebih dr 10
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE ListPrice > 500
GROUP BY Color
HAVING COUNT(*) >1;

--MENAMPILKAN PRODUCTID yang jumlahh orderqtynya lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) >10;

--menampilkan specialofferId yang rata2 orderqtynya kurang dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) >2;

--menampilkan warna yang listpricenya lebuh dari 1000 menggunakan max
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) = 1000;

--advance select dan order by
--menampilkan jobtitle tanpa duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle 
FROM HumanResources.Employee;

--menampilkan 5 produk termahal
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--OFFSET FETCH
SELECT Name, ListPrice
FROM Production.Product
ORDER BY Listprice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice >0
GROUP BY Color 
ORDER BY TotalNilaiStok DESC;

--TUGAS MANDIRI
SELECT ProductID,LineTotal
FROM Sales.SalesOrderDetail;