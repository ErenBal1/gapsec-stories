import 'package:easy_localization/easy_localization.dart';

List<Map<String, dynamic>> murderDetail = [
  {
    "history":
        "Merhaba. Bu şey çalışmıyor mu? Lütfen biri bu yazımı okuyabiliyorsa cevap versin!"
            .tr(),
    "answers": [
      {"title": "Sen de kimsin?".tr(), "aId": 1},
      {"title": "Evet. Okuyabiliyorum.".tr(), "aId": 1}
    ],
    "id": 0
  },
  {
    "history": "OH SONUNDA! BİR İNSANLA KONUŞMAYALI SAATLER OLMUŞTU.".tr(),
    "answers": [
      {"title": "Kimsin sen peki?".tr(), "aId": 2},
      {"title": "Ne oluyor?".tr(), "aId": 7}
    ],
    "id": 1
  },
  {
    "history":
        "Ben mi? Ben... Aslında kim olduğumdan emin değilim. Buraya nasıl geldiğimi bile hatırlamıyorum. Tek bildiğim, uzun zamandır burada yalnız olduğum ve sonunda birine ulaşabildiğim."
            .tr(),
    "answers": [
      {
        "title": "Sakin ol. Nerede olduğunu tarif edebilir misin?".tr(),
        "aId": 3
      },
      {"title": "Neler oldu anlatabilir misin?".tr(), "aId": 4}
    ],
    "id": 2
  },
  {
    "history":
        "Olduğum yer gıcırdıyor sanırım ahşap bir kulübedeyim. Küçük pencereden etrafı biraz seçebiliyorum. Kapı ve arkasındaki askılıkta bir çanta var."
            .tr(),
    "answers": [
      {"title": "Uzaklaş oradan.".tr(), "aId": 5},
      {"title": "İşine yarayan şeyleri almalısın.".tr(), "aId": 6}
    ],
    "id": 3
  },
  {
    "history":
        "Bilmiyorum... Hiçbir şey bilmiyorum. son hatırladığım şey evimde uyumaktı, şimdi ise etrafımda sadece ağaçların olduğu bu yerdeyim telefonla seninle iletişim kurabiliyorum. Lütfen, bana yardım et hava kararmak üzere."
            .tr(),
    "answers": [
      {"title": "Hemen bir yer bulmalısın.".tr(), "aId": 9},
      {"title": "Etrafında sadece ağaç mı var?".tr(), "aId": 10}
    ],
    "id": 4
  },
  {
    "history":
        "Haklısın, hemen çıkıyorum... Ama bekle... Gördüklerimi görmek istemeyeceğine eminim. Yerde bileğinden kesilmiş, parmakları kapalı bir el var! Kusacağım sanırım. Elin tuttuğu metal bir şey var sanırım bir anahtar. Bu anahtar kapının anahtarı olmalı, onu alıyorum. Kapnın arkasındaki çanta da işimize yarayabilir onu da alıp çıkıyorum."
            .tr(),
    "answers": [
      {"title": "Hemen bir yer bulmalısın.".tr(), "aId": 9},
      {"title": "Etrafında sadece ağaç mı var?".tr(), "aId": 10}
    ],
    "id": 5
  },
  {
    "history":
        "Bekle bir saniye sanırım cebimde bir anahtar var, acele etmeliyim beni buraya kim getirdiyse her an geri gelebilir. Çantayı yanıma alıyorum. Kapı kilitli! Cebimdeki anahtarla deniyorum... Tamam şimdi açıldı. Buradan hemen uzaklaşıyorum. Ormanın içine doğru koşuyorum. Dışarısı gerçekten çok soğuk."
            .tr(),
    "answers": [
      {"title": "Hemen bir yer bulmalısın.".tr(), "aId": 9},
      {"title": "Etrafında sadece ağaç mı var?".tr(), "aId": 10}
    ],
    "id": 6
  },
  {
    "history":
        "Bilmiyorum! Gözlerimi sadece ağaçların olduğu bu yerde açtım ve telefonumda bu mesajlaşma açıktı. Kimsin sen? Sen mi kaçırdın beni!"
            .tr(),
    "answers": [
      {"title": "Sen kimsin? Ben seni tanımıyorum bile!".tr(), "aId": 4},
      {"title": "Kaçırmak mı?".tr(), "aId": 8}
    ],
    "id": 7
  },
  {
    "history":
        "Direkt suçladığım için özür dilerim ama korkuyorum ve hava kararmak üzere. Üşümeye başladım, ne yapacağımı bilmiyorum!!!"
            .tr(),
    "answers": [
      {"title": "Hemen bir yer bulmalısın.".tr(), "aId": 9},
      {"title": "Etrafında sadece ağaç mı var?".tr(), "aId": 10}
    ],
    "id": 8
  },
  {
    "history":
        "SÖYLEMESİ KOLAY! ETRAFIMDA HİÇBİR ŞEY YOK. DUR! SANIRIM BİR ŞEY GÖRÜYORUM. DUMAN VAR İLERİDE."
            .tr(),
    "answers": [
      {"title": "Birileri olabilir. Oraya gitmelisin.".tr(), "aId": 11},
      {"title": "Hava kararmadan git yoksa soğuktan öleceksin.".tr(), "aId": 12}
    ],
    "id": 9
  },
  {
    "history":
        "Evet kocaman bi ormandayım. Bir saniye galiba bir şeyler var. İleride dumanlar yükseliyor."
            .tr(),
    "answers": [
      {"title": "Birileri olabilir. Oraya gitmelisin.".tr(), "aId": 11},
      {"title": "Hava kararmadan git yoksa soğuktan öleceksin.".tr(), "aId": 12}
    ],
    "id": 10
  },
  {
    "history":
        "Tamam. Gidiyorum, çok uzak gözükmüyor. Umarım birilerini bulabilirim."
            .tr(),
    "answers": [
      {"title": "Vardın mı?".tr(), "aId": 13},
      {"title": "Hâlâ yürüyor musun?".tr(), "aId": 14}
    ],
    "id": 11
  },
  {
    "history":
        "Haklısın. Belki birileri varsa bana yardım edebilir. Yürümeye başladım."
            .tr(),
    "answers": [
      {"title": "Vardın mı?".tr(), "aId": 13},
      {"title": "Hâlâ yürüyor musun?".tr(), "aId": 14}
    ],
    "id": 12
  },
  {
    "history":
        "Hâlâ yürüyorum ama sanırım yaklaştım. Duman daha belirgin ve kokuyu alabiliyorum. Ama... bir dakika... garip sesler duyuyorum."
            .tr(),
    "answers": [
      {"title": "Ne tür sesler duyuyorsun?".tr(), "aId": 44},
      {"title": "Sessizce yaklaş.".tr(), "aId": 44}
    ],
    "id": 13
  },
  {
    "history":
        "Hâlâ yürüyorum ama sanırım yaklaştım. Duman daha belirgin ve kokuyu alabiliyorum. Ama... bir dakika... Aman Tanrım! Bu da ne!!!"
            .tr(),
    "answers": [
      {"title": "Ne, NELER OLUYOR?".tr(), "aId": 15},
      {"title": "Hey! Orada mısın?".tr(), "aId": 16}
    ],
    "id": 14
  },
  {
    "history": "Önümdeki kulübe yanıyor! İçeride birileri olabilir!!!".tr(),
    "answers": [
      {"title": "Bekle. Dikkatli ol. Üzerine sıçrayabilir.".tr(), "aId": 17},
      {"title": "Ateşten uzak dur. Yardım edemezsin.".tr(), "aId": 17}
    ],
    "id": 15
  },
  {
    "history":
        "Evet. Buradayım ama şok içerisindeyim. Ne yapacağımı bilmiyorum. Önümdeki kulübe yanıyor! Ve söndürebilecek hiçbir şeyim yok. Ya içeride birileri varsa!!!!"
            .tr(),
    "answers": [
      {"title": "Bekle. Dikkatli ol. Üzerine sıçrayabilir.".tr(), "aId": 17},
      {"title": "Ateşten uzak dur. Yardım edemezsin.".tr(), "aId": 17}
    ],
    "id": 16
  },
  {
    "history":
        "Galiba artık çok geç. Her şey küle dönüşmek üzere. Bir saniye, kulübenin yakınlarında bir çanta var."
            .tr(),
    "answers": [
      {"title": "Çantayı kontrol et.".tr(), "aId": 18},
      {"title": "Çevrede başka bir şey var mı?".tr(), "aId": 19}
    ],
    "id": 17
  },
  {
    "history":
        "Çantayı kontrol etmeye karar verdim. Dikkatle yaklaşıyorum... İçerisinde bir şeyler var gibi görünüyor."
            .tr(),
    "answers": [
      {"title": "Çantayı aç ve içindekilere bak.".tr(), "aId": 20},
      {"title": "Çantayı alma, sadece dışarıdan incele.".tr(), "aId": 21}
    ],
    "id": 18
  },
  {
    "history":
        "Etrafına bakacağım. Sanırım burada sadece çanta var. İşte bu! Yanında balta da var. Bu çok işime yarayabilir. Hepsini alıyorum."
            .tr(),
    "answers": [
      {"title": "Çantayı aç ve içindekilere bak.".tr(), "aId": 20},
      {"title": "Çantayı alma, sadece dışarıdan incele.".tr(), "aId": 21}
    ],
    "id": 19
  },
  {
    "history":
        "Çantayı açtım. Yanında da balta vardı. İçinde... bir dizüstü bilgisayar, bazı belgeler ve... bir telefon var!!! Ama telefon ve bilgisayarda şifre var. "
            .tr(),
    "answers": [
      {"title": "Telefonu şimdilik boşver.".tr(), "aId": 28},
      {"title": "Belgelere göz at.".tr(), "aId": 28}
    ],
    "id": 20
  },
  {
    "history":
        "Pekala. Çantayı almıyorum. Tuzak olabilir. Yanındaki baltayı aldım, bununla kendimi savunabilirim. Dur! Çan sesi! Çan sesi duyuyorum. Kilise olamaz herhalde burada ormanın ortasındayız."
            .tr(),
    "answers": [
      {
        "title": "Dikkatlice sese git. Belli ki yalnız değilsin.".tr(),
        "aId": 22
      },
      {"title": "Çan sesinin kaynağını bulmalısın.".tr(), "aId": 22}
    ],
    "id": 21
  },
  {
    "history": "Tamam. Dikkatlice sesin kaynağına doğru gidiyorum.".tr(),
    "answers": [
      {"title": "Vardın mı?".tr(), "aId": 23},
      {"title": "Bir şeyler görebiliyor musun?".tr(), "aId": 23}
    ],
    "id": 22
  },
  {
    "history":
        "Evet. Burada bir kilise var gerçekten. Etrafını sarmaşıklar sarmış. Ama neden burada bir kilise var anlamış değilim. Burası çok ıssız."
            .tr(),
    "answers": [
      {"title": "İçeride birileri varsa sana yardım edebilir.".tr(), "aId": 24},
      {"title": "Sessizce içeriye bak.".tr(), "aId": 24}
    ],
    "id": 23
  },
  {
    "history":
        "İçeride kimlerin olduğunu bilmiyorum. Bu yüzden temkinlice içeriye giriyorum. Kiliseyi tamamen sarmaşıklar kaplamış. Tıpkı kamuflaj olmuş gibi!"
            .tr(),
    "answers": [
      {"title": "Neler görüyorsun?".tr(), "aId": 25},
      {"title": "Kimse var mı?".tr(), "aId": 25}
    ],
    "id": 24
  },
  {
    "history":
        "Çok garip. Mumlar yanıyor. Ama içeride kimse yok. Korkmaya başladım. Sanki altımdan sesler geliyor. EVET! Kontrol etmek için kulağımı koydum. Anlaşılmayan birtakım sesler var."
            .tr(),
    "answers": [
      {"title": "Aşağıda birileri olmalı!".tr(), "aId": 26},
      {"title": "Aşağıya inmen tehlikeli olabilir!".tr(), "aId": 26}
    ],
    "id": 25
  },
  {
    "history":
        "Bu tehlikeli olabilir ama artık bu yerden kurtulmak için risk almak zorundayız. Yürümeye devam ederken ayağım bir şeye takıldı az daha düşüyordum. Takıldığım şeyi kaldırdığımda taşlarla kapatılmış bir merdiven olduğunu gördüm! Taşları yavaşça kenara ittirdim. Sesler iyice arttı! Aşağıya iniyorum."
            .tr(),
    "answers": [
      {"title": "Haber bekliyorum.".tr(), "aId": 1000},
      {"title": "Baltanı unutma. Sana lazım olabilir.".tr(), "aId": 1000}
    ],
    "id": 26
  },
  {
    "history": "System: Sinyal koptu!".tr(),
    "answers": [
      {"title": "Hikayeyi yeniden başlat".tr(), "aId": 0},
      {"title": "Hikayeyi yeniden başlat".tr(), "aId": 0}
    ],
    "id": 1000
  },
  {
    "history":
        "Belgelere göz atıyorum. Çoğu yanmış ama bazı kağıtlar hâlâ okunabilir durumda. Bir harita ve... bir şirket logosu var. \"DarkC\" yazıyor. Bu da ne demek?"
            .tr(),
    "answers": [
      {"title": "Haritayı incele.".tr(), "aId": 30},
      {"title": "DarkC hakkında daha fazla bilgi ara.".tr(), "aId": 29}
    ],
    "id": 28
  },
  {
    "history":
        "Belki telefon ve bilgisayarda bu konu hakkında bir şeyler daha bulabilirdim ama şu an ikisi de kullanabilir durumda değil. Bence artık nerede olduğumu ve nereye gitmem gerektiğini görebilmek için haritayı incelemem gerek."
            .tr(),
    "answers": [
      {"title": "Haklısın.".tr(), "aId": 30},
      {"title": "Haritayı incele.".tr(), "aId": 30}
    ],
    "id": 29
  },
  {
    "history":
        "Haritayı incelemeye başladım. Burası... burası benim olduğum yere benziyor. Ve kırmızı bir işaret var. Tam da şu an bulunduğum yere yakın bir noktada. Bu bir tesadüf olamaz değil mi?"
            .tr(),
    "answers": [
      {"title": "İşaretli noktaya gitmeyi dene.".tr(), "aId": 36},
      {"title": "Çantadaki diğer eşyaları kontrol et.".tr(), "aId": 31}
    ],
    "id": 30
  },
  {
    "history":
        "Tamamdır. Diğer eşyalara bakıyorum. Bilgisayarı açmaya çalıştım ama şifre istedi. Duvar kağıdında DarkC yazan bir sembol var. Telefon kilitli. Ama... bir dakika, çantanın iç cebinde küçük bir not buldum."
            .tr(),
    "answers": [
      {"title": "Notu oku.".tr(), "aId": 32},
      {"title": "Notu okumadan önce etrafı kontrol et.".tr(), "aId": 32}
    ],
    "id": 31
  },
  {
    "history":
        "Etrafı kontrol ettikten sonra notu okumaya başladım. Ellerim titriyor!! Tamam okudum şimdi. Üzerinde el yazısıyla yazılmış bir mesaj var: \"Proje Başarısız! Kanıtları yok et. Kimse öğrenmemeli.\n-E\""
            .tr(),
    "answers": [
      {"title": "Bu bilgi sence işimize yarayacak mı?".tr(), "aId": 33},
      {"title": "Notta başka ipucu var mı?".tr(), "aId": 33}
    ],
    "id": 32
  },
  {
    "history":
        "Bu bilgi kafamı daha da karıştırdı. Notu tekrar inceledim ve arkasında silik bir yazı gördüm. Koordinatlar gibi bir şey. Haritadaki işaretle ilgili olabilir mi?"
            .tr(),
    "answers": [
      {"title": "Koordinatları haritayla karşılaştır.".tr(), "aId": 34},
      {"title": "Telefonu açmaya çalış.".tr(), "aId": 35}
    ],
    "id": 33
  },
  {
    "history":
        "Tamamdır. Koordinatları haritayla karşılaştırıyorum şu an. Evet! Tam olarak haritadakı kırmızı işaretin olduğu yeri gösteriyor. Oraya gitmem gerekiyor sanırım..."
            .tr(),
    "answers": [
      {"title": "Haritadaki koordinatlara doğru git.".tr(), "aId": 36},
      {"title": "Önce dinlen ve plan yap.".tr(), "aId": 36}
    ],
    "id": 34
  },
  {
    "history":
        "Şifreyi çok fazla girersem bloke olabilir ve hiç açılmayabilir bence ipuçları bulana kadar bekletmem gerekiyor. Hava iyice karardı ve çok yoruldum."
            .tr(),
    "answers": [
      {"title": "Haritadaki koordinatlara doğru git.".tr(), "aId": 36},
      {"title": "Önce dinlen ve plan yap.".tr(), "aId": 36}
    ],
    "id": 35
  },
  {
    "history":
        "Tamam. Biraz dinlendim. Yorgunum ve burası çok yüksek! Bu yer benim yükseklik korkumu tetikliyor. Güvenli bir yer bulmalıyım. Ardından haritadaki noktaya doğru yola çıkacağım."
            .tr(),
    "answers": [
      {"title": "Ağaç dallarından basit bir barınak yap.".tr(), "aId": 37},
      {
        "title": "Yüksek bir ağaca tırman ve geceyi orada geçir.".tr(),
        "aId": 37
      }
    ],
    "id": 36
  },
  {
    "history":
        "DALGA MI GEÇİYORSUN BENİMLE! BURADA MI!? -_-, ağaç dallarından basit bir barınak yapmaya başladım. Çalışırken etraftan gelen seslere dikkat ediyorum. AAAA!!! ÇANTADA BULDUĞUM TELEFONA BİR BİLDİRİM GELDİ!"
            .tr(),
    "answers": [
      {"title": "Hemen telefonu kontrol et.".tr(), "aId": 38},
      {"title": "Önce barınağı bitir. Sonra telefona bak.".tr(), "aId": 38}
    ],
    "id": 37
  },
  {
    "history":
        "Merakıma yenik düştüm ve hemen bildirimi açtım. Ekranda bir mesaj var. \"Konum tespit edildi. Yardım yolda. Yerinde kal.\" Bu da ne demek oluyor?"
            .tr(),
    "answers": [
      {"title": "Mesaja cevap yazmaya çalış.".tr(), "aId": 39},
      {"title": "Karşındaki kimmiş öğren.".tr(), "aId": 39}
    ],
    "id": 38
  },
  {
    "history":
        "Olmuyor! Telefon kilitli ve sadece bu mesajı gösteriyor. Ne yapacağımı bilmiyorum!"
            .tr(),
    "answers": [
      {"title": "Telefonun etrafına bak.".tr(), "aId": 40},
      {
        "title": "Çevrendeki nesneleri kullanarak telefonu açmayı dene.".tr(),
        "aId": 56
      }
    ],
    "id": 39
  },
  {
    "history":
        "Tamam. Telefonun arkasına bakarken önceden yapıştırılmış küçük bir sticker buldum! Bekle okuyacağım. \"Unutma! Kaptanın doğum günü\". Bunlar hangi kaptandan bahsediyor ki? Kaptan... kaptan... DUR! Kaptan Kirk? Star Trek! NCC-1701. 1701 olmalı şifre. Hemen deneyeceğim!!!"
            .tr(),
    "answers": [
      {"title": "Şifreyi gir.".tr(), "aId": 41},
      {"title": "Tuzak olabilir dikkatli ol.".tr(), "aId": 41}
    ],
    "id": 40
  },
  {
    "history":
        "Tamam. Dikkatli bir şekilde girdim şifreyi ve telefon AÇILDI! Ama ekranda gördüklerimden kanım dondu."
            .tr(),
    "answers": [
      {"title": "Ne gördün?".tr(), "aId": 42},
      {"title": "Telefonu hemen kapat!".tr(), "aId": 42}
    ],
    "id": 41
  },
  {
    "history":
        "Ellerim titriyor şu anda sana yazarken. Ekranda bir video vardı. Bastım oynatmak için... Korkunç bir şey bu! Videoda maskeli biri var. Birisini takip ediyor ve sonra... Tanrım, onu öldürüyor. Bu nasıl bir canilik!!!"
            .tr(),
    "answers": [
      {"title": "Videoyu silmeyi dene.".tr(), "aId": 43},
      {"title": "Telefonu yanına al ve oradan hemen uzaklaş.".tr(), "aId": 43}
    ],
    "id": 42
  },
  {
    "history":
        "Videoyu silmeye çalıştım ancak olmuyor. Telefonu da bırakmak istemiyorum, kanıt olarak lazım olabilir. Burdan hemen uzaklaşmalıyım. DUR! Uzaktan motor ve çan sesi duyuyorum. Biri geliyor galiba!!! Yardım olabilir mi? Yoksa katil mi?"
            .tr(),
    "answers": [
      {"title": "Sakin ol! Kararını düzgünce ver.".tr(), "aId": 22},
      {"title": "Yardım olabilir.".tr(), "aId": 22}
    ],
    "id": 43
  },
  {
    "history":
        "Sesler... sanki birileri konuşuyor gibi. Ama anlaşılmıyor. Ve...".tr(),
    "answers": [
      {"title": "Ve? Ne?".tr(), "aId": 0},
      {"title": "Orada mısın?".tr(), "aId": 0}
    ],
    "id": 44
  },
  {
    "history":
        "Sanırım telefonun sinyali burada iyi çekmiyor. Ve... bir radyo sesi de var. Yaklaşayım mı?"
            .tr(),
    "answers": [
      {"title": "Evet, ama dikkatli ol.".tr(), "aId": 46},
      {"title": "Hayır, güvenli olmayabilir. Geri dön!".tr(), "aId": 47}
    ],
    "id": 45
  },
  {
    "history":
        "Tamam, çok yavaşça ilerliyorum. Ağaçlarından arasından bir açıklık gördüm."
            .tr(),
    "answers": [
      {"title": "Ne görüyorsun? Anlat hemen!".tr(), "aId": 48},
      {
        "title": "Sakin ol. Derin nefes al ve gördüklerini anlat.".tr(),
        "aId": 48
      }
    ],
    "id": 46
  },
  {
    "history":
        "Evet bu tehlikeli olabilir ama hava neredeyse kararmak üzere ormanda bu şekilde hayatta kalamam bu yüzden özür dilerim çünkü gitmek zorundayım. Bir saniye o ne?"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsun? Anlat hemen!".tr(), "aId": 48},
      {
        "title": "Sakin ol. Derin nefes al ve gördüklerini anlat.".tr(),
        "aId": 48
      }
    ],
    "id": 47
  },
  {
    "history":
        "Küçük bir kamp alanı var. İki çadır kurulmuş. Bir adet kamp ateşi yanıyor ve etrafında odunların üzerinde 3 adam oturuyor. Kamp malzemeleri var etrafta. Giyimleri normal ancak biraz kirli. Avcı gibiler."
            .tr(),
    "answers": [
      {"title": "Biraz daha gözlemle.".tr(), "aId": 49},
      {"title": "Yardım iste.".tr(), "aId": 52}
    ],
    "id": 48
  },
  {
    "history":
        "Tamam. Biraz daha inceliyorum. Adamlar birbirleriyle konuşuyorlar ama ne dediklerini tam olarak duyamıyorum. Biri elindeki haritaya bakıyor, diğer ikisi yemek hazırlıyor gibi görünüyor. Ne yapmalıyım? "
            .tr(),
    "answers": [
      {"title": "Sessizce daha da yaklaş.".tr(), "aId": 50},
      {"title": "Başka bir yerde yardım ara.".tr(), "aId": 51}
    ],
    "id": 49
  },
  {
    "history":
        "Daha fazla bilgi edinmeliyim. Yavaşça yaklaşıyorum. Şimdi konuşmaları duyabiliyorum. Tanrım! Bu adamlar avcı değil! Kaçırılmış birinden bahsediyorlar!"
            .tr(),
    "answers": [
      {"title": "Yanlarına git ve her şeyi anlat.".tr(), "aId": 52},
      {"title": "Saklan. Dinlemeye devam et.".tr(), "aId": 1001}
    ],
    "id": 50
  },
  {
    "history":
        "Kalbim çok hızlı atıyor ama geri çekilemem şu an. Daha fazla bilgi edinmeliyim.Yavaşça yaklaşıyorum. Şimdi konuşmaları duyabiliyorum. Tanrım! Bu adamlar avcı değil! Kaçırılmış birinden bahsediyorlar!"
            .tr(),
    "answers": [
      {"title": "Yanlarına git ve her şeyi anlat.".tr(), "aId": 52},
      {"title": "Saklan. Dinlemeye devam et.".tr(), "aId": 1001}
    ],
    "id": 51
  },
  {
    "history":
        "Sence bu çok tehlikeli olmaz mı? Beni öldürebilirler, bıçaklarını görmelisin! Duyduklarıma göre yabancı bir dilde konuşuyorlar. Ne dediklerini anlamıyorum. Galiba birisi haritaya bakıyor."
            .tr(),
    "answers": [
      {
        "title": "Haritaya ulaşabilirsen oradan kurtulabilirsin.".tr(),
        "aId": 53
      },
      {"title": "Harita senin kaçış yolun!".tr(), "aId": 53}
    ],
    "id": 52
  },
  {
    "history":
        "Bekle... Silah sesi duydum. Hepsi yerinden koşarak ses doğru koşmaya başladılar. İşte!! Orada duruyor harita! Gidip alayım mı?"
            .tr(),
    "answers": [
      {"title": "Güzel fırsat. Hemen al!".tr(), "aId": 0},
      {"title": "Çabuk!".tr(), "aId": 0}
    ],
    "id": 53
  },
  {
    "history":
        "Hayatımda hiç bu kadar panik yaptığımı hatırlamıyorum. Ve sana bir sürprizim var yerde çanta gördüm ve onu da aldım. Onlar dönmeden hemen burdan uzaklaşıyorum."
            .tr(),
    "answers": [
      {"title": "İlk önce haritayı aç.".tr(), "aId": 30},
      {"title": "Nerede olduğunu öğrenmelisin.".tr(), "aId": 30}
    ],
    "id": 54
  },
  {
    "history":
        "Buradan bir şeylere ulaşmak zorundayım. Biraz daha dinliyorum ve birinden bahsediyorlar. Aman Allahım dal parçasına bastım hepsi buraya bakıyor. BENİ FARKETTİLER!"
            .tr(),
    "answers": [
      {"title": "".tr(), "aId": 0},
      {"title": "".tr(), "aId": 0}
    ],
    "id": 1001
  },
  {
    "history":
        "Çevremde taş arıyorum. Tamam buldum. AAA! Tam telefona vuracakken telefon elimden düştü ve kılıfı çıktı. Kılıfının içerisinde de bir not varmış. Üstünde: \"Unutma! Kaptanın doğum günü\". Bunlar hangi kaptandan bahsediyor ki? Kaptan... kaptan... DUR! Kaptan Kirk? Star Trek! NCC-1701. 1701 olmalı şifre. Deniyorum hemen!!! "
            .tr(),
    "answers": [
      {"title": "Şifreyi gir.".tr(), "aId": 41},
      {"title": "Tuzak olabilir dikkatli ol.".tr(), "aId": 41}
    ],
    "id": 56
  },
];
