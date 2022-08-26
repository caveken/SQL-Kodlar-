-- EXISTS , NOT EXISTS --
-- EXISTS condition subquerylerde kullanilir
-- IN ifadesinin kullanimina benzer
-- EXISTS , NOT EXISTS ifadeleri de altsorgudan getirilen degerlerin icerisinde
-- bir degerin olmasi veya olmamasi durumunda islem yapilmasini saglar
-- Exists true false gibidir


CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

CREATE TABLE nisan
(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan


SELECT urun_id, musteri_isim from mart 
where EXISTS (SELECT urun_id from nisan where mart.urun_id=nisan.urun_id)

SELECT urun_isim, musteri_isim from nisan 
where EXISTS (SELECT urun_id from mart where mart.urun_id=nisan.urun_id)

SELECT urun_isim, musteri_isim from nisan 
where not EXISTS (SELECT urun_id from mart where mart.urun_id=nisan.urun_id)




