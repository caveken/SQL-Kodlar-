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

-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
insert into student VALUES ('1001','ali can',25);
insert into student VALUES ('1002','veli can',35);
insert into student VALUES ('1003','ayse can',45);
insert into student VALUES ('1004','derya can',55);

--tabloya parcali veri ekleme
INSERT INTO student(st_name,age) VALUES ('murat can' ,65);

--DQL --> data query lnguage
--select

SELECT *from student;
SELECT *from student;


SELECT st_name from student;
select st_name from student;
--SELECT KOMUTU WHERE KOŞULU
select * from student WHERE age>35;

--TCL - Transaction Control Lang.
--Begin -Savepoint -rollback -commit
--Transection veritabani sistemlerinde bir islem basladiginda baslar 
--ve islem bitince sona erer
--Bu islemler veritabani olusturma, veri silme, veri guncelleme 
--veriyi geri getirme gibi islemler olabilir.

create table ogrenciler2(
id serial,
isim VARCHAR(50),
veli_isim Varchar(50),
yazili_notu real
);
Begin;
insert into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default,'Canan Gül','Ayşe Şen',90.5);
savepoint x;
insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);
ROLLBACK TO x;
select * from ogrenciler2;
commit;
--Transaction kullanımında SERIAL data türü kullanımı tavsiye edilmez.
--savepointten sonra eklediğimiz veride sayaç mantığı ile çalıştığı için
--sayacta en son hangi sayıda kaldıysa ordan devam eder
-- NOT : PostgreSQL de transaction kullanımı için 'Begin' komutuyla başlarız sonrasında tekrar yanlış bir veriyi
-- düzeltmek veya bizim için önemli olan verilerden sonra ekleme yapabilmek için 'SAVEPOINT savepointadi'
-- kullanırız ve bu savepointe dönebilmek için 'ROLLBACK TO savepointismi'
-- komutunu kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki verileri tabloda bize
-- verir ve son olarak Transaction'ı sonlandırmak için mutlaka 'COMMIT' komutu kullanırız. MySQL de
-- transaction olmadanda kullanılır

-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT *from ogrenciler;

-- Soru : id'si 124 olan öğrenciyi siliniz
DELETE FROM ogrenciler WHERE id=127;
-- Soru : ismi Kemal Yasa olan satırı siliniz
DELETE FROM ogrenciler WHERE isim='Kemal Yasa';
-- Soru : ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim='Nesibe Yilmaz'or isim= 'Mustafa Bak';
-- soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
DELETE FROM ogrenciler WHERE isim='Ali Can'or id= 123;
Delete from ogrenciler

--DELETE - TRUNCATE -->
-- Tablodaki tüm verileri silelim
TRUNCATE table ogrenciler

--DDL - Data Definition Lang.
--CREATE -ALTER -DROP
--ALTER TABLE--
-- ALTER TABLE tabloda ADD, TYPE, SET, RENAME veya 
--DROP COLUMNS işlemleri için kullanılır
--Personel isminde bir tablo oluşturalım

create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
select * from personel;
-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20), add yas int;

ALTER TABLE personel DROP column sirket;

--personel tablosundaki sehir sutunun adını ülke olarak değişiştirelim
alter table personel rename column sehir to ulke;

--personel tablosunu adıı işçiler olarak değiştirin
alter table personel rename to isciler;
select * from isciler;

-- DDL - DROP komutu
DROP table isciler;

