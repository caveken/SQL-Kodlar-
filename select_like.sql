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
select * from personel WHERE isim ilike '%A%';

-- Ismi t harfi ile biten personeli listele
select * from personel WHERE isim like '%t';

-- Isminin 2. harfi e olan personeli listeleyiniz
select * from personel WHERE isim ilike '_e%'

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel WHERE isim ~~* 'a%n'

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select isim from personel WHERE isim ilike '_a_u%'

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel WHERE isim like '_e%y%'

-- a harfi olmayan personeli listeleyin
select * from personel where isim not like '%a%'

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~* 'A_____a%'

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz. 
select isim from personel where isim like '%r_'





