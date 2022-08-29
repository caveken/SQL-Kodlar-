/*
-- GROUP BY -- HAVİNG --
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, avg(maas) as ortalama_yas from personel-- select from arası sütunları belirtiyor
where cinsiyet = 'E' --koşul içeriği sütunda yok
GROUP by ulke --sütun içeriği
HAVING avg(maas)> 3000; --koşul içeriği sütunda yok

--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, avg(maas) as ortalama_maas, count (cinsiyet) as erkek_calisan_sayi from personel
where cinsiyet='E' --erkek calışan şartı
GROUP by ulke 
having count(cinsiyet)>1; --gruplandırma şartı

select * from personel;