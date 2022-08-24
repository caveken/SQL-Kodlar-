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

-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)// fk iki tabloyu birbirine baglıyor
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

DELETE from calisanlar WHERE id='10002';

DELETE from adresler WHERE adres_id='10002';

drop table calisanlar;

-- ON DELETE CASCADE --
--Her defasinda once child tablodaki verileri silmek yerine
--ON DELETE CASCADE  silme ozelligini aktif hale getirebiliriz
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

SELECT * FROM talebeler;

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade--bu satır ilişkili tablolarda parenttan direk silebilmemizi saglıyor
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

SELECT * FROM notlar;

delete from notlar WHERE talebe_id='123';
delete from talebeler WHERE id='126';-- on delete cascade kullandığımız için parenttan direk silebildik

DROP table talebeler CASCADE; -- Parent tabloyu kaldırmak istersek Drop table tablo_adı'ndan sonra 
--CASCADE komutunu kullanırız

--Talebeler tablosundaki isim sutununa NOTT NULL kısıtlaması ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz

alter table talebeler 
alter column isim TYPE VARCHAR(30), 
alter column isim SET NOT NULL;

-- Talebeler tablosundaki yazılı_notu sutununa 60 dan büyük rakam girilebilsin
alter table talebeler 
ADD CONSTRAINT sinir CHECK (yazili_notu>60);

--CHECK kısıtlaması ile tablodaki istediğimiz sutunu sınırlandırabiliriz
-- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi
INSERT INTO talebeler VALUES(128, 'Mustafa Can', 'Hasan',45);

create table ogrenciler(
id int, 
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

SELECT * from ogrenciler
select * from ogrenci_adres

--Tablodaki bir sutuna PRIMARY KEY ekleme
alter table ogrenciler
add primary key (id);

--PRIMARY KEY oluşturmada 2. yol
alter table ogrenciler
ADD CONSTRAINT pk_id PRIMARY KEY(id);

--PK'den sonra FK ataması
alter table ogrenci_adres
ADD foreign key (id) REFERENCES ogrenciler; 
--Child tabloyu parent tablodan oluşturduğumuz için sutun adı verilmedi

--PK' yi CONSTRAINT silme 
alter table ogrenciler DROP CONSTRAINT pk_id;

alter TABLE ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;

SELECT * from talebeler WHERE yazili_notu>85;

--ismi mustafa bak olan talebenin tüm bilgileri
SELECT * from talebeler where isim='Mustafa Bak';


--SELECT KOMUTUNDA BETWEEN KOSULU
-- BETWEEN belirttiginiz iki veri arasindaki bilgileri listeler
-- BETWEEN de belirttigimiz degerlerde listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

SELECT * from personel;


/*
    AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler    
*/

--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz
SELECT * from personel where id between '1003' and '1005';

SELECT from personel WHERE isim between 'Derya Soylu' and 'Yavuz Bal'

select * from personel WHERE isim='Sena Beyaz' or maas=70000;

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme imkanı verir
--Farklı sütunlar için IN kullanılamaz

--id si 1001,1002 ve 1004 olan personelin bilgilerini listele
SELECT * FROM personel where id in ('1003', '1002', '1004');


SELECT * from personel where maas in (70000,100000);

/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/

-- Ismi A harfi ile baslayan personeli listele

SELECT * from personel where isim ilike 'a%';

-- Ismi t harfi ile biten personeli listele
SELECT * from personel where isim ilike '%t';

SELECT * FROM personel WHERE isim ILIKE '_e%';








