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