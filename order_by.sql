-- ORDER BY --
-- ORDER BY cümleciği bir SORGU deyimi içerisinde belli ibr SUTUN'a göre
-- sıralama yapmak için kullanılır


CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

-- kisiler tablosunu adres'e göre sıralayarak sorgulayınız.


select * from kisiler order by adres
select * from kisiler order by adres asc; --ASCENDING yazmasak da sıralı verir

--kişiler tablosunu adrese göre tersten sıralayalım
select * from kisiler order by adres DESC --descending tersten sıralama için

--kişiler tablosunda maası buyukten kucuge sıralayın
select * from kisiler order by maas DESC

--ismi mine olanları maasa göre azalan sırada sorgulayın
select * from kisiler where isim = 'Mine' order by maas desc  

select * from kisiler where soyisim = 'Bulut' order by maas





