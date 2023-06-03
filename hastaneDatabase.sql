create database db_hastane
use master 

CREATE TABLE tbl_hastane1
(
hastaneid INT PRIMARY KEY,
hastane_isim VARCHAR(35) NOT NULL,
hastane_telefon varchar(11) not null,
hastane_adres nvarchar(max) not null,
hastane_eposta nvarchar(max) not null
);


CREATE TABLE tbl_personeller
(
personelid INT PRIMARY KEY ,
sicilno VARCHAR(6) NOT NULL,
personel_unvan VARCHAR(25) NOT NULL,
personel_tcno VARCHAR(11) NOT NULL,
personel_isim VARCHAR(25) NOT NULL,
personel_soyisim VARCHAR(25) NOT NULL,
personel_cinsiyet char (5),
personel_telefonno varchar(11) not null,
personel_ikametyeri nvarchar(max) not null,
personel_eposta nvarchar(max) not null,
personel_dogumtarihi DATE  not null,	
);


CREATE TABLE tbl_hastalar
(
hastaid INT PRIMARY KEY ,
hasta_tc char(11) not null,
hasta_isim nvarchar(50) not null,
hasta_soyisim varchar(25) not null,
hasta_cinsiyet char (5),
hasta_medenihali char (5),
hasta_dogumtarihi DATE not null,
hasta_kangrubu char(8),
hasta_ikametyeri nvarchar(max),
hasta_telefonno varchar(11) not null,
hasta_eposta nvarchar(max) not null
);


CREATE TABLE tbl_poliklinik
(
Poliklinikid INT PRIMARY KEY ,
Poliklinik_ismi nvarchar(60),
persenelid  INT FOREIGN KEY REFERENCES tbl_personeller (personelid)
);


CREATE TABLE tbl_randevu
(
randevuid INT PRIMARY KEY ,
randevu_tarih DATE,
randevu_saati time,
randevu_sure char (100),
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid),
persenelid  INT FOREIGN KEY REFERENCES tbl_personeller (personelid), 
poliklinikid INT FOREIGN KEY REFERENCES tbl_poliklinik (Poliklinikid)  
);


CREATE TABLE tbl_muayene
(
muayeneid INT PRIMARY KEY ,
muayene_tarih date,
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid),
persenelid  INT FOREIGN KEY REFERENCES tbl_personeller (personelid) 
);


CREATE TABLE tbl_recete
(
receteid INT PRIMARY KEY ,
recete_tarih date,
recete_sure char (10),
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid)
);


CREATE TABLE tbl_ilaclar
(
ilacid INT PRIMARY KEY ,
ilac_isim varchar(25),
ilac_icerik nvarchar(max) not null,
receteid INT FOREIGN KEY REFERENCES tbl_recete (receteid)
);


CREATE TABLE tbl_tahliller
(
tahlilid INT PRIMARY KEY ,
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid),
tahlil_türü  nvarchar(max) not null,
);


CREATE TABLE tbl_tahlilsonuc
(
tahlilsonucid INT PRIMARY KEY ,
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid),
tahlil_açýklama nvarchar(max)
);


CREATE TABLE tbl_izinler
(
personelid INT FOREIGN KEY REFERENCES tbl_personeller (personelid),
izin_baslangýc date,
izin_bitis date,
açýklama nvarchar(max) 
);


CREATE TABLE tbl_fatura
(
faturaid INT PRIMARY KEY, 
odeme_turu nvarchar(max),
fatura_tutar money,
Fatura_tarih DATE,
hastaid INT FOREIGN KEY REFERENCES tbl_hastalar (hastaid)
);


CREATE TABLE tbl_sitekullanýcýlarý 
(
uyeid INT PRIMARY KEY, 
uyelikturu nvarchar(max) 
);


CREATE TABLE tbl_sikayet_oneri_ve_memnuniyetler
(
þikayetid INT PRIMARY KEY ,
hasta_sikayet INT FOREIGN KEY REFERENCES tbl_hastalar(hastaid),
açýklama nvarchar(max) not null
);


CREATE TABLE tbl_unvan
(
unvanid INT PRIMARY KEY ,
unvan_adý nvarchar(max) not null,
unvan INT FOREIGN KEY REFERENCES tbl_personeller(personelid)
);




insert into tbl_hastane1 values (1,'AREL HASTANESÝ',05360478596,'Kemalpaþa, No:, Halkalý Cd No:101, 34295 Küçükçekmece/Ýstanbul','info@arelhastanesi.com')


INSERT into tbl_personeller values (10,20000,'doktor',20147878101,'Ayþe','Doðan','Kadýn',05260418956,'Sefaköy','ayþedgn@gmail.com','01.20.1987')
INSERT into tbl_personeller values (11,20001,'doktor',20147070454,'Buket','Yýlmaz','Kadýn',05260412020,'Avcýlar','buketylmz@gmail.com','05.11.1991')
INSERT into tbl_personeller values (12,20002,'doktor',20404745890,'Cüneyt','Aslan','Erkek',05260411010,'Beylikdüzü','cnytaslan@gmail.com','06.15.1990')
INSERT into tbl_personeller values (13,20003,'doktor',4015122685,'Cenk','Yýlmaz','Erkek',05262859696,'Bakýrköy','cenkyýlmaz@gmail.com','04.18.1989')
INSERT into tbl_personeller values (14,20004,'doktor',2014787804,'Bünyamin','Taþkýn','Erkek',05260410025,'Avcýlar','bünyamintþkn@gmail.com','05.09.1987')
INSERT into tbl_personeller values (15,20005,'doktor',201478781010,'Tuðba','Büyük','Kadýn',05540589663,'Beylikdüzü','drtugbabyk@gmail.com','01.03.1984')
INSERT into tbl_personeller values (16,20006,'doktor',201478781414,'Hakan','Bilgin','Erkek',05540502558,'Florya','drhakanbilgin@gmail.com','03.03.1980')
INSERT into tbl_personeller values (17,20007,'doktor',2014704184,'Burcu','Saðlam','Kadýn',05540589660,'Beylikdüzü','drburcusglm@gmail.com','02.06.1985')
INSERT into tbl_personeller values (18,20008,'doktor',2015484125,'ERDAL','KAN','ERKEK',05260462121,'BEÞÝKTAÞ','drerdalkan@gmail.com','01.01.1970')
INSERT into tbl_personeller values (19,20009,'doktor',20147805263,'HANÝFE','KAN','Kadýn',05260410584,'BEÞÝKTAÞ','drhanýfekan@gmail.com','12.12.1975')
INSERT into tbl_personeller values (20,20010,'doktor',201478720,'BURCU','TAÞPINAR','Kadýn',052604182021,'KADIKÖY','drburcutaspýnar@gmail.com','01.01.1991')
INSERT into tbl_personeller values (21,20011,'doktor',2014782222,'KADER','OZASLAN','Kadýn',052604189045,'Bakýrköy','drkaderozasln@gmail.com','02.02.1988')
INSERT into tbl_personeller values (22,20012,'doktor',20147878101,'MUSTAFA','ÇELÝK','ERKEK',0526041052,'BEYLÝKDÜZÜ','drmustafaclk@gmail.com','04.04.1980')
INSERT into tbl_personeller values (23,20013,'doktor',20147878101,'EDA','AKSU','Kadýn',05260528956,'HALKALI','edaaksu@gmail.com','05.05.1990')
INSERT into tbl_personeller values (24,20014,'doktor',20147874501,'HASAN','KAYA','ERKEK',05260412222,'Sefaköy','drhasankaya@gmail.com','07.25.1991')
INSERT into tbl_personeller values (25,20015,'doktor',2014784758,'MERYEM','ÇÝÇEK','Kadýn',05260410814,'AVCILAR','meryemcicek@gmail.com','01.02.1989')
INSERT into tbl_personeller values (26,20016,'doktor',201478704154,'ÖZLEM','YELÝÞYURT','Kadýn',05260414656,'MERTER','ozlemyslyrt@gmail.com','08.08.1984')
INSERT into tbl_personeller values (27,20017,'doktor',20147878181,'HATÝCE','BAYAR','Kadýn',05260415896,'Sefaköy','hatýcebyr@gmail.com','11.01.1980')
INSERT into tbl_personeller values (28,20018,'doktor',20147873333,'Ahmet','Koçak','ERKEK',0526041588811,'HALKALI','ahmetkck@gmail.com','10.09.1985')
INSERT into tbl_personeller values (29,20019,'doktor',20147870000,'DOÐAN','DEMÝR','ERKEK',0526041556333,'Sefaköy','dogandemýr@gmail.com','02.11.1978')
INSERT into tbl_personeller values (30,20020,'doktor',20147871414,'MÜGE','GENÇTÜRK','Kadýn',052604156569,'AVCILAR','mugegenctrk@gmail.com','09.07.1995')
INSERT into tbl_personeller values (100,30000,'hemþire',30147878101,'Ayça','Doðan','Kadýn',05360418956,'Sefaköy','aycadgn@gmail.com','02.01.1987')
INSERT into tbl_personeller values (101,30001,'Hemþire',30147070454,'Büþra','Yýlmaz','Kadýn',05260412020,'Avcýlar','busraylmz@gmail.com','10.05.1991')
INSERT into tbl_personeller values (102,30002,'Hemþire',30404745890,'Cenk','Aslan','Erkek',05560411010,'Beylikdüzü','cnktaslan@gmail.com','05.06.1990')
INSERT into tbl_personeller values (103,30003,'hemþire',3015122685,'emir','Yýlmaz','Erkek',05562859696,'Bakýrköy','emýryýlmaz@gmail.com','08.02.1989')
INSERT into tbl_personeller values (104,30004,'hemþire',3014787804,'Burak','Taþkýn','Erkek',05460410025,'Avcýlar','buraktþkn@gmail.com','05.09.1987')
INSERT into tbl_personeller values (105,30005,'hemþire',3014704184,'Beren','Saðlam','Kadýn',05440589660,'Beylikdüzü','berensglm@gmail.com','12.06.1985')
INSERT into tbl_personeller values (106,30006,'hemþire',30147878101,'Murat','ÇELÝK','ERKEK',05226041052,'BEYLÝKDÜZÜ','muratclk@gmail.com','08.04.1980')
INSERT into tbl_personeller values (107,30007,'hemþire',30147878101,'Ece','AKSU','Kadýn',05660528956,'HALKALI','eceaksu@gmail.com','03.05.1990')
INSERT into tbl_personeller values (108,30008,'hemþire',301478704154,'Özge','YELÝÞYURT','Kadýn',05760414656,'MERTER','ozgeyslyrt@gmail.com','09.08.1984')
INSERT into tbl_personeller values (109,30009,'hemþire',30147878181,'Helin','BAYAR','Kadýn',05960415896,'Sefaköy','helinbyr@gmail.com','11.01.1980')
INSERT into tbl_personeller values (201,40000,'hademe',301478781010,'Tuba','Büyük','Kadýn',05140589663,'Beylikdüzü','tubabyk@gmail.com','16.03.1984')
INSERT into tbl_personeller values (202,40001,'hademe',301478781414,'Hasan','Bilgin','Erkek',05040502558,'Florya','hasanbilgin@gmail.com','13.03.1980')
INSERT into tbl_personeller values (203,40002,'Hademe',3014784758,'Melis','ÇÝÇEK','Kadýn',05360410814,'AVCILAR','meliscicek@gmail.com','11.02.1989')
INSERT into tbl_personeller values (300,50000,'güvelik',3015484125,'Engin','KAN','ERKEK',05860462121,'BEÞÝKTAÞ','enginkan@gmail.com','10.01.1970')
INSERT into tbl_personeller values (301,50001,'güvenlik',30147805263,'ayþe','KAN','Kadýn',05760410584,'BEÞÝKTAÞ','aysekan@gmail.com','12.12.1975')
INSERT into tbl_personeller values (302,50002,'güvenlik',301478720,'Beren','TAÞPINAR','Kadýn',05160418201,'KADIKÖY','berentaspýnar@gmail.com','10.01.1991')
INSERT into tbl_personeller values (303,50003,'güvenlik',3014782222,'aslý','OZASLAN','Kadýn',05060418945,'Bakýrköy','asliozasln@gmail.com','05.02.1988')
INSERT into tbl_personeller values (304,50004,'güvenlik',30147874501,'Hakan','KAYA','ERKEK',05260412222,'Sefaköy','hakankaya@gmail.com','05.07.1991')
INSERT into tbl_personeller values (400,60000,'hasta bakým elemaný',30147873333,'Ali','Koçak','ERKEK',0536041588811,'HALKALI','alick@gmail.com','12.09.1985')
INSERT into tbl_personeller values (401,60001,'hasta bakým elemaný',30147870000,'arda','DEMÝR','ERKEK',05660455333,'Sefaköy','ardademýr@gmail.com','02.11.1978')
INSERT into tbl_personeller values (500,70000,'EZCACI',30147871414,'nalan','GENÇTÜRK','Kadýn',05604156569,'AVCILAR','nalangenctrk@gmail.com','11.07.1995')


INSERT into tbl_hastalar values (1000,4258749688,'hasan','demir','Erkek','evli','06.11.1968','Arh-','halkalý',05410148788,'hasandmr@gmail.com')
INSERT into tbl_hastalar values (1001,4789632121,'ahmet','çelik','Erkek','evli','05.08.1975','Arh+','halkalý',05410142020,'ahmetclk@gmail.com')
INSERT into tbl_hastalar values (1002,4258749600,'berk','ateþ','Erkek','bekar','05.05.2019','ABrh-','cennet',05410140021,'berkates@gmail.com')
INSERT into tbl_hastalar values (1003,4258749688,'selen','karaca','kadýn','bekar','11.12.1998','Brh-','avcýlar',05410148074,'selenkrc@gmail.com')
INSERT into tbl_hastalar values (1004,4258749600,'koray','yýlmaz','Erkek','evli','02.08.1991','Brh-','bakýrköy',05410148711,'tugcedmr@gmail.com')
INSERT into tbl_hastalar values (1006,4258749682,'sümeyye','yýldýz','kadýn','bekar','06.05.1996','Arh-','florya',05410121541,'sumeyyeyýldýz@gmail.com')
INSERT into tbl_hastalar values (1007,4258749633,'kadir','can','Erkek','bekar','12.06.1995','0rh-','beylikdüzü',05410141212,'kadýrcan@gmail.com')
INSERT into tbl_hastalar values (1008,4258749044,'hasan','taþdelen','Erkek','evli','12.12.1989','0rh+','orhangazi',05410145222,'hasantsdln@gmail.com')
INSERT into tbl_hastalar values (1009,4258749688,'behiye','yýldýz','kadýn','evli','09.05.1990','Arh-','kadýköy',05410148041,'behýyeyldz@gmail.com')
INSERT into tbl_hastalar values (1010,4258749603,'sýla','yüksel','kadýn','bekar','10.12.2000','Arh+','beyazýt',05410142121,'sýlayksl@gmail.com')
INSERT into tbl_hastalar values (1011,4258749147,'melike','gelici','kadýn','bekar','05.10.1993','Arh-','beþiktaþ',05410141212,'melýkeglc@gmail.com')
INSERT into tbl_hastalar values (1012,4258749668,'can','kýran','Erkek','evli','12.12.1990','Arh+','söðütlüçeþme',05410140120,'cankýran@gmail.com')
INSERT into tbl_hastalar values (1013,4258749014,'sefa','tosun','Erkek','bekar','12.11.1988','0rh-','beylikdüzü',054101404127,'sefatosun@gmail.com')
INSERT into tbl_hastalar values (1014,4258749047,'recep','yüksel','Erkek','evli','08.08.1956','0rh+','yeþilköy',05410141010,'recepyksl@gmail.com')
INSERT into tbl_hastalar values (1015,4258741215,'tezcan','çelik','Erkek','evli','02.09.1976','Arh-','halkalý',05410141223,'tezcanclk@gmail.com')
INSERT into tbl_hastalar values (1016,4258742323,'alperen','kaymak','Erkek','bekar','05.11.1988','Arh-','sefaköy',05410142052,'alperenkymk@gmail.com')
INSERT into tbl_hastalar values (1017,4258749666,'aslý','olam','kadýn','bekar','11.05.2000','Arh+','bakýrköy',05410146666,'aslýolm@gmail.com')
INSERT into tbl_hastalar values (1018,4258749777,'ilker','taþkýn','Erkek','bekar','12.01.2001','Arh-','halkalý',05410147788,'ilkertskn@gmail.com')
INSERT into tbl_hastalar values (1019,4258749999,'selime','demir','kadýn','evli','01.10.1960','ABrh-','sefaköy',05410148788,'selimedmr@gmail.com')
INSERT into tbl_hastalar values (1020,5258749999,'samet','demir','kadýn','evli','02.10.1960','ABrh-','sefaköy',05410148789,'sametedmr@gmail.com')


Insert into tbl_poliklinik values (3000,'dahiliye',10 )
Insert into tbl_poliklinik values (3001,'cildiye',11)
Insert into tbl_poliklinik values (3002,'kulak,burun,boðaz',12)
Insert into tbl_poliklinik values (3003,'kardiyoloji',13)
Insert into tbl_poliklinik values (3004,'göz',14)
Insert into tbl_poliklinik values (3005,'nöroloji',103)
Insert into tbl_poliklinik values (3006,'pskiyatri',102) 
Insert into tbl_poliklinik values (3007,'çocuk',17)
Insert into tbl_poliklinik values (3008,'kalp damar',18)
Insert into tbl_poliklinik values (3009,'beyin ve sinir',19)
Insert into tbl_poliklinik values (3010,'genel',20)
Insert into tbl_poliklinik values (3011,'kadýn doðum',21)
Insert into tbl_poliklinik values (3012,'ortopeti ve travmatoloji',22)
Insert into tbl_poliklinik values (3013,'üroloji',23)
Insert into tbl_poliklinik values (3014,'acil servis',24)
Insert into tbl_poliklinik values (3015,'göðüs',25)
Insert into tbl_poliklinik values (3016,'beyin ve sinir',106) 
Insert into tbl_poliklinik values (3017,'genel',27)
Insert into tbl_poliklinik values (3018,'kadýn doðum',101) 
Insert into tbl_poliklinik values (3019,'ortopeti ve travmatoloji',100) 
Insert into tbl_poliklinik values (3030,'dahiliye',30 )


INSERT into tbl_randevu values (2000,'09.01.2021','13:20','20 dakika',1000,10,3000)
INSERT into tbl_randevu values (2001,'02.04.2020','14:00','20 dakika',1001,11,3001)
INSERT into tbl_randevu values (2002,'09.02.2021','09:00','20 dakika',1002,12,3002)
INSERT into tbl_randevu values (2003,'05.01.2021','15:00','20 dakika',1003,13,3003)
INSERT into tbl_randevu values (2004,'06.08.2020','14:40','20 dakika',1004,14,3004) 
INSERT into tbl_randevu values (2005,'01.06.2021','08:00','20 dakika',1005,104,3005)
INSERT into tbl_randevu values (2006,'03.09.2021','14:00','20 dakika',1006,16,3006)
INSERT into tbl_randevu values (2007,'02.04.2020','04:20','20 dakika',1007,17,3007)
INSERT into tbl_randevu values (2008,'09.01.2021','09:00','20 dakika',1008,18,3008)
INSERT into tbl_randevu values (2009,'08.12.2021','12:00','20 dakika',1009,19,3009)
INSERT into tbl_randevu values (2010,'12.04.2020','09:00','20 dakika',1010,20,3010)
INSERT into tbl_randevu values (2011,'09.01.2021','09:00','20 dakika',1011,21,3011)
INSERT into tbl_randevu values (2012,'05.15.2021','13:40','20 dakika',1012,22,3012)
INSERT into tbl_randevu values (2013,'10.03.2020','14:00','20 dakika',1013,23,3013)
INSERT into tbl_randevu values (2014,'12.12.2021','09:00','20 dakika',1014,24,3014)
INSERT into tbl_randevu values (2015,'11.06.2021','11:40','20 dakika',1015,103,3015)
INSERT into tbl_randevu values (2016,'12.08.2020','14:00','20 dakika',1016,102,3016)
INSERT into tbl_randevu values (2017,'12.06.2021','09:20','20 dakika',1017,27,3017)
INSERT into tbl_randevu values (2018,'06.08.2021','10:20','20 dakika',1018,101,3018)
INSERT into tbl_randevu values (2019,'11.08.2020','14:00','20 dakika',1016,102,3016)
INSERT into tbl_randevu values (2020,'11.06.2021','09:20','20 dakika',1017,27,3017)
INSERT into tbl_randevu values (2021,'07.08.2021','10:20','20 dakika',1018,101,3018)


Insert into tbl_muayene values (4000,'03.12.2021',1000,10)
Insert into tbl_muayene values (4001,'03.11.2021',1001,11)
Insert into tbl_muayene values (4002,'03.10.2021',1002,10)
Insert into tbl_muayene values (4003,'03.09.2021',1003,10)
Insert into tbl_muayene values (4004,'03.02.2021',1004,13)
Insert into tbl_muayene values (4005,'04.11.2021',1005,13)
Insert into tbl_muayene values (4006,'02.11.2021',1006,14)
Insert into tbl_muayene values (4007,'10.12.2021',1007,14)
Insert into tbl_muayene values (4008,'11.02.2021',1008,13)
Insert into tbl_muayene values (4009,'12.12.2021',1009,13)
Insert into tbl_muayene values (4010,'10.01.2021',1010,17)
Insert into tbl_muayene values (4011,'10.02.2021',1011,18)
Insert into tbl_muayene values (4012,'03.08.2021',1012,18)
Insert into tbl_muayene values (4013,'03.06.2021',1013,20)
Insert into tbl_muayene values (4014,'11.12.2021',1014,20)
Insert into tbl_muayene values (4015,'03.12.2021',1015,19)
Insert into tbl_muayene values (4016,'03.12.2021',1016,19)
Insert into tbl_muayene values (4017,'03.12.2021',1017,17)
Insert into tbl_muayene values (4018,'03.12.2021',1018,17)
Insert into tbl_muayene values (4019,'03.12.2021',1019,17)
Insert into tbl_muayene values (4020,'03.12.2021',1019,19)


Insert into tbl_recete values (5000,'03.12.2021','4 iþ günü',1000)
Insert into tbl_recete values (5001,'03.11.2021','4 iþ günü',1001)
Insert into tbl_recete values (5002,'03.10.2021','4 iþ günü',1002)
Insert into tbl_recete values (5003,'03.09.2021','4 iþ günü',1003)
Insert into tbl_recete values (5004,'03.02.2021','4 iþ günü',1004)
Insert into tbl_recete values (5005,'04.11.2021','4 iþ günü',1005)
Insert into tbl_recete values (5006,'02.11.2021','4 iþ günü',1006)
Insert into tbl_recete values (5007,'12.12.2021','4 iþ günü',1007)
Insert into tbl_recete values (5008,'11.02.2021','4 iþ günü',1008)
Insert into tbl_recete values (5009,'10.12.2021','4 iþ günü',1009)
Insert into tbl_recete values (5010,'07.01.2021','4 iþ günü',1010)
Insert into tbl_recete values (5011,'02.02.2021','4 iþ günü',1011)
Insert into tbl_recete values (5012,'03.08.2021','4 iþ günü',1012)
Insert into tbl_recete values (5013,'12.06.2021','4 iþ günü',1013)
Insert into tbl_recete values (5014,'05.12.2021','4 iþ günü',1014)
Insert into tbl_recete values (5015,'03.12.2021','4 iþ günü',1015)
Insert into tbl_recete values (5016,'03.12.2021','4 iþ günü',1016)
Insert into tbl_recete values (5017,'03.12.2021','4 iþ günü',1017)
Insert into tbl_recete values (5018,'03.12.2021','4 iþ günü',1018)
Insert into tbl_recete values (5019,'03.12.2021','4 iþ günü',1019)
Insert into tbl_recete values (5020,'03.12.2021','4 iþ günü',1019)


Insert into tbl_ilaclar values (6000,'parol','aðrý kesici',5000)
Insert into tbl_ilaclar values (6001,'parol','aðrý kesici',5001)
Insert into tbl_ilaclar values (6002,'minoset','aðrý kesici',5002)
Insert into tbl_ilaclar values (6003,'minoset','aðrý kesici',5003)
Insert into tbl_ilaclar values (6004,'parol','aðrý kesici',5004)
Insert into tbl_ilaclar values (6005,'parol','aðrý kesici',5005)
Insert into tbl_ilaclar values (6006,'parol','aðrý kesici',5006)
Insert into tbl_ilaclar values (6007,'minoset','aðrý kesici',5007)
Insert into tbl_ilaclar values (6008,'minoset','aðrý kesici',5008)
Insert into tbl_ilaclar values (6009,'parol','aðrý kesici',5009)
Insert into tbl_ilaclar values (6010,'penisilin','antibiyotik',5010)
Insert into tbl_ilaclar values (6011,'penisilin','antibiyotik',5011)
Insert into tbl_ilaclar values (6012,'penisilin','antibiyotik',5012)
Insert into tbl_ilaclar values (6013,'minoset','aðrý kesici',5013)
Insert into tbl_ilaclar values (6014,'parol','aðrý kesici',5014)
Insert into tbl_ilaclar values (6015,'penisilin','antibiyotik',5015)
Insert into tbl_ilaclar values (6016,'parol','aðrý kesici',5016)
Insert into tbl_ilaclar values (6017,'minoset','aðrý kesici',5017)
Insert into tbl_ilaclar values (6018,'minoset','aðrý kesici',5018)
Insert into tbl_ilaclar values (6019,'penisilin','antibiyotik',5019)
Insert into tbl_ilaclar values (6020,'penisilin','antibiyotik',5019)
Insert into tbl_ilaclar values (6021,'penisilin','antibiyotik',5019)


Insert into tbl_tahliller values (7000,1000,'kan')
Insert into tbl_tahliller values (7001,1001,'kan')
Insert into tbl_tahliller values (7002,1002,'kan')
Insert into tbl_tahliller values (7003,1003,'kan')
Insert into tbl_tahliller values (7004,1004,'idrar')
Insert into tbl_tahliller values (7005,1005,'idrar')
Insert into tbl_tahliller values (7006,1006,'kan')
Insert into tbl_tahliller values (7007,1007,'kan')
Insert into tbl_tahliller values (7008,1008,'idrar')
Insert into tbl_tahliller values (7009,1009,'idrar')
Insert into tbl_tahliller values (7010,1010,'idrar')
Insert into tbl_tahliller values (7011,1011,'idrar')
Insert into tbl_tahliller values (7012,1012,'kan')
Insert into tbl_tahliller values (7013,1013,'kan')
Insert into tbl_tahliller values (7014,1014,'kan')
Insert into tbl_tahliller values (7015,1015,'kan')
Insert into tbl_tahliller values (7016,1016,'idar')
Insert into tbl_tahliller values (7017,1017,'kan')
Insert into tbl_tahliller values (7018,1018,'kan')
Insert into tbl_tahliller values (7019,1019,'idrar')
Insert into tbl_tahliller values (7020,1019,'kan')
Insert into tbl_tahliller values (7021,1018,'idrar')


Insert into tbl_tahlilsonuc values (8000,1000,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8001,1001,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8002,1002,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8003,1003,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8004,1004,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8005,1005,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8006,1006,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8007,1007,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8008,1008,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8009,1009,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8010,1010,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8011,1011,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8012,1012,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8013,1013,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8014,1014,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8015,1015,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8016,1016,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8017,1017,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8018,1018,'vitamin eksikliði')
Insert into tbl_tahlilsonuc values (8019,1019,'enfeksiyon')
Insert into tbl_tahlilsonuc values (8020,1019,'vitamin eksikliði')


Insert into tbl_izinler values (11,'10.10.2021','10.11.2021','yýllýk izin')
Insert into tbl_izinler values (12,'01.09.2021','01.25.2021','yýllýk izin')
Insert into tbl_izinler values (13,'12.25.2021','01.08.2022','yýllýk izin')
Insert into tbl_izinler values (14,'04.08.2021','05.08.2021','yýllýk izin')
Insert into tbl_izinler values (20,'12.05.2021','03.06.2021','yýllýk izin')
Insert into tbl_izinler values (16,'03.11.2021','07.11.2021','doðum izni')
Insert into tbl_izinler values (109,'12.10.2021','12.30.2021','yýllýk izin')
Insert into tbl_izinler values (18,'04.06.2021','05.06.2021','yýllýk izin')
Insert into tbl_izinler values (108,'03.04.2020','04.04.2020','Ýstirahat izni')
Insert into tbl_izinler values (23,'04.09.2020','04.25.2020','yýllýk izin')
Insert into tbl_izinler values (105,'03.10.2019','03.25.2019','evlilik izni')
Insert into tbl_izinler values (203,'12.02.2019','12.03.2019','yýllýk izin')
Insert into tbl_izinler values (30,'08.03.2021','09.04.2021','yýllýk izin')
Insert into tbl_izinler values (302,'11.02.2021','12.03.2021','yýllýk izin')
Insert into tbl_izinler values (304,'10.11.2021','11.11.2021','yýllýk izin')
Insert into tbl_izinler values (20,'05.01.2021','06.02.2021','yýllýk izin')
Insert into tbl_izinler values (21,'09.05.2021','10.09.2021','doðum izni')
Insert into tbl_izinler values (102,'04.10.2021','05.11.2021','yýllýk izin')
Insert into tbl_izinler values (10,'10.10.2021','11.11.2021','yýllýk izin')
Insert into tbl_izinler values (104,'04.10.2018','06.11.2018','yýllýk izin')


Insert into tbl_fatura values (101,'peþin',1000,'03.12.2021',1000)
Insert into tbl_fatura values (102,'peþin',1000,'03.11.2021',1001)
Insert into tbl_fatura values (103,'peþin',500,'03.10.2021',1002)
Insert into tbl_fatura values (104,'peþin',200,'03.09.2021',1003)
Insert into tbl_fatura values (105,'taksit',2000,'03.02.2021',1004)
Insert into tbl_fatura values (106,'taksit',2000,'04.11.2021',1004)
Insert into tbl_fatura values (107,'peþin',2500,'10.11.2021',1006)
Insert into tbl_fatura values (108,'taksit',1000,'03.12.2021',1007)
Insert into tbl_fatura values (109,'taksit',2000,'05.02.2021',1008)
Insert into tbl_fatura values (1010,'peþin',1500,'06.12.2021',1009)
Insert into tbl_fatura values (1011,'peþin',1500,'07.01.2021',1010)
Insert into tbl_fatura values (1012,'pesin',300,'03.02.2021',1011)
Insert into tbl_fatura values (1013,'taksit',3000,'03.08.2021',1012)
Insert into tbl_fatura values (1014,'peþin',700,'03.06.2021',1013)
Insert into tbl_fatura values (1015,'peþin',600,'05.12.2021',1014)
Insert into tbl_fatura values (1016,'taksit',1500,'03.12.2021',1015)
Insert into tbl_fatura values (1017,'taksit',2500,'03.12.2021',1016)
Insert into tbl_fatura values (1018,'peþin',1000,'03.12.2021',1017)
Insert into tbl_fatura values (1019,'taksit',2000,'03.12.2021',1018)
Insert into tbl_fatura values (1020,'peþin',200,'03.12.2021',1019)         


Insert into tbl_sitekullanýcýlarý values (9000,'personel')
Insert into tbl_sitekullanýcýlarý values (9001,'hasta')
Insert into tbl_sitekullanýcýlarý values (9002,'personel')
Insert into tbl_sitekullanýcýlarý values (9003,'personel')
Insert into tbl_sitekullanýcýlarý values (9004,'personel')
Insert into tbl_sitekullanýcýlarý values (9005,'personel')
Insert into tbl_sitekullanýcýlarý values (9006,'personel')
Insert into tbl_sitekullanýcýlarý values (9007,'personel')
Insert into tbl_sitekullanýcýlarý values (9008,'personel')
Insert into tbl_sitekullanýcýlarý values (9009,'personel')
Insert into tbl_sitekullanýcýlarý values (9010,'personel')
Insert into tbl_sitekullanýcýlarý values (9011,'hasta')
Insert into tbl_sitekullanýcýlarý values (9012,'hasta')
Insert into tbl_sitekullanýcýlarý values (9013,'hasta')
Insert into tbl_sitekullanýcýlarý values (9014,'hasta')
Insert into tbl_sitekullanýcýlarý values (9015,'hasta')
Insert into tbl_sitekullanýcýlarý values (9016,'personel')
Insert into tbl_sitekullanýcýlarý values (9017,'personel')
Insert into tbl_sitekullanýcýlarý values (9018,'personel')
Insert into tbl_sitekullanýcýlarý values (9019,'personel')


Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10000,1000,'Doktor sorunumu dinlemeden parol verip yolladý bir daha bu hastaneye gelmeyeceðim!') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10001,1002,'randevum olmasýna raðmen doktor gelmemiþti.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10002,1005,'her þeyiyle harikaydý kesinlikle çevreme de önereceðim.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10003,1006,'benimle ilgilenen doktor ve hemþireleriniz oldukça iyiydi sað olun. ') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10004,1008,'hastanenin içi çok güzel, çok beðendim. Doktorda çok ilgiliydi, teþekkürler. ') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10005,1011,'sizi saðlýk bakanlýðýna þikayet edeceðim sürüm sürüm süründüreceðim böyle hastane olmaz olsun.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10006,1013,'hastanenin içi çok temizdi bu konuda personellerinize çok teþekkür ederim. doktorlarda çok ilgiliydi teþekkürler') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10007,1014,'tedavim yarým kaldý') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10008,1015,'her þey profesyonel bir þekilde ilerledi') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10009,1016,'randevuya tam vaktinde geldiðim halde tam 1 saat bekletildim bunun sonucunda da ihale toplantýsýný iptal etmek durumunda kaldým araya avukatlar girmeden 3 iþ günü içinde zararýmýn karþýlanmasýný istiyorum yoksa size karþý dava açacaðýmý belirtmek isterim!') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10010,1017,'yanlýþ tedavi edildim') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10011,1018,'yanlýþ ilaç verdiler.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10012,1010,'gelen hastalarýn hepsi istisnasýz aðrý kesici ve antibiyotik yazdýrmaya geliyorlar. Almayýn þu hastalarý içeri') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10013,1011,'Tatilleriniz, ikramiyetleriniz ve insanlara olan iyilikçi bakýþ açýnýz için bir kez daha teþekkür etmek isterim.Ýyi günler diliyorum.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10014,1018,'çalýþtýðým oda bahçe tarafýna bakýyor ve benim polenlere karþý alerjim var çok kötü oluyorum. Ana caddeye bakan bir oda ile yerimin deðiþtirilmesini rica ediyorum. þimdiden teþekkürler') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10015,1001,'yemeklerinizin tadý çok güzel ve doyurucu, ücretsiz olmasý da ayrý bi güzel. Çalýþýrken daha bir motive oluyorum sað olun.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10016,1002,'Ne kadar eski kafalý ve gereksiz hasta varsa bana yolluyorsunuz sabýr taþ mýyým ben? Uzun zamandýr burada çalþtýðým için yapýyorsunuz ama ayýptýr günahtýr benim ne suçum var! Böyle devam ederse istifamý verip tazminatýmý alýp çýkacaðým yeter artýk!!') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10017,1003,'maaþlarýmýza artýk zam yapmanýzýn vakti geldi bence kendime bir an önce araba almak istiyorum. ')  
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10018,1004,'Tuvaletteki peçeteler sürekli olarak çalýnýyor daha güvenli bir peçetelik ile deðiþtirilmesini ayrýca sabunlar için de yine çalýnmamasý için þiþelere deðilde alýþveriþ merkezlerindeki gibi eli algýlayýnca kendiliðinden sabun gelen sensörler ile deðiþtirilmesini rica ediyorum.') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10019,1000,'çalýþtýðým odayý en baþtan yenilediðiniz için çok teþekkür ederim, çok beðendim. Artýk sabahlarý iþe geliken ayaklarým harika bir þekilde kendiliðinden gelmek isteyecekler <3 ') 
Insert into tbl_sikayet_oneri_ve_memnuniyetler values (10020,1001,'çalýþtýðým odayý en baþtan yenilediðiniz için çok teþekkür ederim, çok beðendim. Artýk sabahlarý iþe geliken ayaklarým harika bir þekilde kendiliðinden gelmek isteyecekler <3 ') 


Insert into tbl_unvan values (11000,'Profesör',10)
Insert into tbl_unvan values (11001,'Profesör',11)
Insert into tbl_unvan values (11002,'Profesör',12)
Insert into tbl_unvan values (11003,'Profesör',13)
Insert into tbl_unvan values (11004,'asistan',14)
Insert into tbl_unvan values (11005,'asistan',15)
Insert into tbl_unvan values (11006,'asistan',16)
Insert into tbl_unvan values (11007,'asistan',17)
Insert into tbl_unvan values (11008,'Doçent',18)
Insert into tbl_unvan values (11009,'Doçent',19)
Insert into tbl_unvan values (11010,'Doçent',20)
Insert into tbl_unvan values (11011,'Doçent',21)
Insert into tbl_unvan values (11012,'Doçent',22)
Insert into tbl_unvan values (11013,'yardýmcý',23)
Insert into tbl_unvan values (11014,'yardýmcý',24)
Insert into tbl_unvan values (11015,'öðretim görevlisi',25)
Insert into tbl_unvan values (11016,'öðretim görevlisi',26)
Insert into tbl_unvan values (11017,'doçent',27)
Insert into tbl_unvan values (11018,'doçent',28)
Insert into tbl_unvan values (11019,'profesör',29)
Insert into tbl_unvan values (11020,'doçent',30)
Insert into tbl_unvan values (11021,'asistan',100)
Insert into tbl_unvan values (11022,'asistan',101)
Insert into tbl_unvan values (11023,'asistan',102)
Insert into tbl_unvan values (11024,'asistan',103)


--TABLO LÝSTELEYEN SORGULAR
select * from  tbl_hastane1;            

select * from tbl_personeller;

select * from tbl_hastalar;

select * from  tbl_poliklinik;

select * from  tbl_muayene;

select * from  tbl_sitekullanýcýlarý;

select * from  tbl_randevu;

select * from tbl_recete;

select * from  tbl_ilaclar;

select * from  tbl_tahliller;

select * from tbl_tahlilsonuc;

select * from tbl_izinler;

select * from tbl_fatura;

select * from tbl_sikayet_oneri_ve_memnuniyetler;

select * from tbl_unvan;


--ORDER BY SORGULARI

select * from tbl_fatura order by fatura_tarih asc

select * from tbl_fatura order by fatura_tutar desc

select * from tbl_personeller where personel_isim='Ayþe' or personel_isim='Emine'order by personel_isim

select * from tbl_hastalar where hasta_cinsiyet='erkek' or hasta_cinsiyet='kýz'order by hasta_cinsiyet

select * from tbl_izinler order by izin_baslangýc desc

select hasta_ikametyeri,hasta_telefonno from tbl_hastalar where hasta_isim like 'A%'


--FONKSÝYON SORGUSU 

create function yas_bulan
(@dogumTarihi date)
returns tinyint
as
begin
return year (getdate())-year (@dogumTarihi)
end
go

select dbo.yas_bulan ('06.11.1968') as [hasan demirin yaþý]

  

--TABLO SÝLME SORGUSU
/*drop table tbl_sitekullanýcýlarý;*/

/*drop table tbl_poliklinik;*/