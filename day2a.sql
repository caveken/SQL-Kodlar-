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

-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.
10:59
CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');--unique olmalı
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--maas null olamaz
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--can tekrarlı
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--maas hiçlik olamaz
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--ilk null id kabul
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--ikinci null id kabul edilmez
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--pk unique olmalı
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--pk null olamaz

-- FOREIGN KEY --
CREATE TABLE adresler (
adres_id char(5),
sokak varchar(20),	
cadde varchar(30),					 
sehir varchar(20),					 
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
); 

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

SELECT * FROM calisanlar;
SELECT * FROM adresler;

