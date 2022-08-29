-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır 
PostgreSQL'de "~" karakteri ile kullanılır.


* önceki öğenin sıfır veya daha fazla tekrarını belirtir.
+  önceki öğenin bir veya daha fazla kez tekrarını belirtir.
?  önceki öğenin sıfır veya bir kez tekrarını belirtir.
{m} önceki öğenin tam olarak m kez tekrarını belirtir .
{m,} önceki öğenin m veya daha fazla kez tekrarını belirtir .
{m,n} önceki öğenin en az m ve en fazla n kez tekrarını ifade eder.
() Öğeleri tek bir mantıksal öğede gruplamak için parantezler kullanılabilir .
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
    INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
	INSERT INTO kelimeler VALUES (1018, 'Haaak', 5);

select * from kelimeler

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır

--Başında sonunda ne olduğu/olmadığı önemli değil içinde at veya ot geçen kelimeler
--% önceki öğenin sıfır veya daha fazla tekrarını belirtir.
--* önceki öğenin sıfır veya daha fazla tekrarını belirtir.

--SIMILAR TO ile
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%';
--LIKE ile
select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%'
--REGEX
select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at'
select * from kelimeler WHERE kelime ~* '^H[a-z,A-Z,0-9](.*)k$'


-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler 
where kelime similar to 'ho%|hi%'
--LIKE ile
select * from kelimeler 
where kelime ~~* 'ho%' or kelime ~~*'hi%'
--REGEX ile
select * from kelimeler 
where kelime ~* 'h[oi](.*)' 
-- Regex'de bir karakter için köşeli parantez kullanılır. 
-- [oi] o veya i harfi anlamında tek karakter gösterir
-- Regex'te .(nokta) bir karakteri temsil eder"
-- * sıfır veya daha fazla tekrar anlamında kullanılır
-- (.*) karakterin 0 ya da daha fazla tekrarını gösterir (like daki % gibi)



--Sonu 't' veya 'm' ile bitenleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler 
where kelime similar to '%t|%m';
--REGEX ile
select * from kelimeler 
where kelime ~* '(.*)[tm]$' 
-- $ karakteri bitişi gösterir


--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz

--SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
-- LIKE ile
select * from kelimeler where kelime ~~* 'h_t';
-- REGEX ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'
-- [a-z,A-Z,0-9]  tek karakter gösterir



--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan 
--“kelime" değerlerini çağırın.

--SIMILAR to ile
Select kelime from kelimeler where kelime similar to 'h[a-e]%t'  -- 3 harfli olmak zorunda değil
-- REGEX ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'


--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.

-- REGEX ile
select * from kelimeler where kelime ~ '^[say](.*)' 
-- ^ başlangıç'ı temsil eder


--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$'
-- $ karakteri bitişi gösterir


-- İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.

--SIMILAR to ile
select * from kelimeler where kelime similar to 'h[a|i]t';
-- REGEX ile
select * from kelimeler where kelime ~ '^h[ai]t$'


--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın. 

select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'


--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
--SIMILAR to ile
select * from kelimeler where kelime similar to '%[o][o]%'
select * from kelimeler where kelime similar to '%[o]{2}%' 
-- REGEX ile
select * from kelimeler where kelime ~* '[o]{2}' 
-- Süslü parantez içinde belirttiğimiz rakam bir önceki köşeli parantez içinde kaçtane olduğunu belirtir
--{m} önceki öğenin tam olarak m kez tekrarını belirtir .
--{m,} önceki öğenin m veya daha fazla kez tekrarını belirtir .
--{m,n} önceki öğenin en az m ve en fazla n kez tekrarını ifade eder.


--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

--SIMILAR to ile
select * from kelimeler where kelime similar to '%[o]{4}%'
-- REGEX ile
select * from kelimeler where kelime ~* '[o]{4}' 


--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
SELECT kelime FROM kelimeler WHERE kelime ~ '^[yas](.*)[mf]$';











