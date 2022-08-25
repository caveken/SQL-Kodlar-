CREATE TABLE ogrenci(
ogr_no int,
ogr_isim VARCHAR(30),
notlar REAL,	
yas INT,
adres VARCHAR(50),
kayit_tarih DATE
);
create TABLE ogr_notlari
AS
SELECT ogr_no, notlar FROM ogrenci;

SELECT * FROM ogrenci;

create table personel(
pers_id int,
	isim varchar(30),
	sehir varchar(30),
	maas int,
	sirket varchar(20),
	adres varchar(50)
);
	
--Varolan personel tablosundan pers_id,sehir,adres 
--fieldlarına sahip personel_adres adında yeni tablo olusturalım	

create table personel_adres
as
Select pers_id, sehir,adres FROM personel;

SELECT*from personel
select * from personel_adres