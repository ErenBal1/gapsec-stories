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
      {"title": "Belgeler hakkında daha fazla bilgi ara.".tr(), "aId": 29}
    ],
    "id": 28
  },
  {
    "history":
        "Belki telefon ve bilgisayarda bu konu hakkında bir şeyler daha bulabilirdim ama şu an ikisi de kullanabilir durumda değil. Bence artık nerede olduğumu ve nereye gitmem gerektiğini görebilmek için haritayı incelemem gerek."
            .tr(),
    "answers": [
      {"title": "Nerede olduğumuzu öğren.".tr(), "aId": 30},
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
        "Tamamdır. Diğer eşyalara bir göz atayım. Bilgisarayı açmaya çalışıyorum ama şifre istiyor. Telefon da aynı şekilde. Ama... bir saniye, çantanın iç cebinde küçük bir not var."
            .tr(),
    "answers": [
      {"title": "Ne yazıyor? Okuyabiliyor musun?".tr(), "aId": 33},
      {"title": "Şifre için bir ipucu olabilir mi?".tr(), "aId": 33}
    ],
    "id": 31
  },
  {
    "history":
        "Evet, burada kesinlikle bir şey ölmüş, ama bir hayvan düşmüş olsaydı, üstünü bu şekilde kapatmazlardı diye düşünüyorum. Belki de bir cinayeti örtbas etmeye çalışmışlar. Sanırım haklıyım, çünkü az ileride bir ayakkabı görüyorum ve hemen yanına gidiyorum. Evet! Bu kesinlikle bir cinayet, çünkü ayakkabının her yeri kan içinde."
            .tr(),
    "answers": [
      {"title": "Haritayı kullanarak oradan uzaklaş.".tr(), "aId": 35},
      {"title": "Kuyunun içine inebilir misin?".tr(), "aId": 37}
    ],
    "id": 32
  },
  {
    "history":
        "Sanırım şifre sadece 6 rakamdan oluşuyor ve bilgisayardaki şifre için istenen pin kodu ile aynı uzunlukta. Bakalım, şifre bu mu? Evet, açıldı! Tanrım, şarjı çok az; ne yapmalıyım?"
            .tr(),
    "answers": [
      {"title": "Diskleri kontrol et.".tr(), "aId": 34},
      {"title": "Açabildiğin tüm dosyalara bak.".tr(), "aId": 34}
    ],
    "id": 33
  },
  {
    "history":
        "Deniyorum, ama cihaz kapanmak üzere. Bir dosya gözüme çarptı; adı ‘kaldır.’ İçinde insanların resimleri var. Ve… buradaki kişi benim! Bu nasıl olabilir?"
            .tr(),
    "answers": [
      {
        "title": "Bu, ‘ortadan kaldır’ anlamına geliyor olabilir mi?".tr(),
        "aId": 40
      },
      {"title": "Hemen kaç oradan!".tr(), "aId": 40}
    ],
    "id": 34
  },
  {
    "history":
        "Haritada gidebileceğim bir yer gözükmüyor. Bu kuyunun içinde ne varsa bizi aydınlatabilir. Çok derin görünmüyor; belki kalın ağaç dallarını destek olarak kullanıp inebilirim. Koku çok ağır, bu yüzden tişörtümü burnuma sarmak zorundayım. İniyorum. Burada büyük, siyah bir poşet var ve üstüne bantlanmış bir not var; sadece ‘Lucy’ yazıyor. Bu, kız kardeşimin adı. Tanrım, olamaz, olmamalı! Poşeti açmak istemiyorum, bu gerçek değil!"
            .tr(),
    "answers": [
      {"title": "Öğrenmek zorundasın.".tr(), "aId": 38},
      {"title": "Poşeti aç.".tr(), "aId": 38}
    ],
    "id": 35
  },
  {
    "history":
        "İşaretli noktaya doğru gidiyorum. Neredeyse varmak üzereyim. Galiba… bu mu? Burada, üzeri dallarla kapatılmış bir delik var. Sanırım bu bir kuyu ve işaretli nokta tam olarak burayı gösteriyor. Kuyunun yanına yaklaştım ve üzerindeki dal parçalarını kenara koydum. Burnuma inanılmaz bir koku gelmeye başladı; çürümüş bir şeylerin kokusu ve neredeyse kusacaktım. Kendimi zor attım kenara."
            .tr(),
    "answers": [
      {"title": "Oraya inmen senin için tehlikeli olabilir.".tr(), "aId": 32},
      {"title": "İçerisine bir hayvan düşmüş olabilir.".tr(), "aId": 32}
    ],
    "id": 36
  },
  {
    "history":
        "Çok derin görünmüyor; belki kalın ağaç dallarını destek olarak kullanıp inebilirim. Koku çok ağır, bu yüzden tişörtümü burnuma sarmak zorundayım. İniyorum. Burada büyük, siyah bir poşet var ve üstüne bantlanmış bir not var; sadece ‘Lucy’ yazıyor. Kız kardeşimin adı da bu. Tanrım, olamaz, olmamalı! Poşeti açmak istemiyorum, bu gerçek değil!"
            .tr(),
    "answers": [
      {"title": "Öğrenmek zorundasın.".tr(), "aId": 38},
      {"title": "Poşeti aç.".tr(), "aId": 38}
    ],
    "id": 37
  },
  {
    "history":
        "Bu… bu… kardeşim. Kolunda ise ‘kaç’ yazıyor, kanla yazılmış. Neler oluyor? Bütün bu olaylar ne anlama geliyor? Kardeşimin cesedini mi buldum? Başım dönüyor."
            .tr(),
    "answers": [
      {"title": "Hey! Orada mısın?".tr(), "aId": 39},
      {"title": "İyi misin? Çabuk çık oradan!".tr(), "aId": 39}
    ],
    "id": 38
  },
  {
    "history":
        "Bayılmışım ve yağmur yağmaya başlamış. Uyanmasaydım, kuyunun içerisinde boğulacakmışım. Kendimi dışarı zor attım ve cihaz düzgün çalışmamaya başladı."
            .tr(),
    "answers": [
      {"title": "Artık oradan uzaklaş.".tr(), "aId": 40},
      {"title": "Kaçmak zorundasın.".tr(), "aId": 40}
    ],
    "id": 39
  },
  {
    "history":
        "Galiba haklısın, canım tehlikede. Bekle! Birisi beni izliyor. Tam karşımda."
            .tr(),
    "answers": [
      {"title": "Ne görüyorsun?".tr(), "aId": 41},
      {"title": "Karşında olan kim?".tr(), "aId": 41}
    ],
    "id": 40
  },
  {
    "history": "Bağlantı koptu.".tr(),
    "answers": [
      {"title": "Korkuyorum iyi misin?".tr(), "aId": 42},
      {"title": "Lütfen iyi olduğunu söyle.".tr(), "aId": 42}
    ],
    "id": 41
  },
  {
    "history": "Sinyal yok.".tr(),
    "answers": [
      {"title": "Lütfen cevap ver".tr(), "aId": 43},
      {"title": "Yaşıyor musun?".tr(), "aId": 43}
    ],
    "id": 42
  },
  {
    "history":
        "Evet, yaşıyorum. Buraya nasıl geldim? Hatırladığım son şey, simsiyah giyinmiş birinin elindeki bezle yüzümü kapatmasıydı. Burası da ne böyle? Bulunduğum yerde çan sesleri geliyor. Yoksa beni kiliseye mi getirdiler?"
            .tr(),
    "answers": [
      {"title": "Etrafında neler var?".tr(), "aId": 56},
      {"title": "Bulunduğun yeri tarif et.".tr(), "aId": 56}
    ],
    "id": 43
  },
  {
    "history":
        "Sesler… sanki birileri konuşuyor gibi. Ama ne söyledikleri anlaşılmıyor. Ve…"
            .tr(),
    "answers": [
      {"title": "Ve?".tr(), "aId": 45},
      {"title": "Orada mısın?".tr(), "aId": 45}
    ],
    "id": 44
  },
  {
    "history":
        "Buradayım. Sanırım telefonun sinyali burada iyi çekmiyor. Ve… sanırım bir radyo sesi de var. Yaklaşayım mı?"
            .tr(),
    "answers": [
      {"title": "Evet ama dikkatli ol.".tr(), "aId": 46},
      {"title": "Hayır, güvenli olmayabilir. Geri dön.".tr(), "aId": 47}
    ],
    "id": 45
  },
  {
    "history":
        "Tamam, çok yavaşça ilerliyorum. Ağaçların arasından bir açıklık görüyorum. Ve…"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsun? Hemen anlat!".tr(), "aId": 48},
      {
        "title": "Sakin ol. Derin nefes al ve gördüklerini anlat.".tr(),
        "aId": 48
      }
    ],
    "id": 46
  },
  {
    "history":
        "Evet, bu tehlikeli olabilir ama hava neredeyse kararmak üzere ve ormanda bu şekilde hayatta kalamam. Bu yüzden özür dilerim, gitmek zorundayım. Bir saniye, o da ne!"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsun? Hemen anlat!".tr(), "aId": 48},
      {
        "title": "Sakin ol. Derin nefes al ve gördüklerini anlat.".tr(),
        "aId": 48
      }
    ],
    "id": 47
  },
  {
    "history":
        "Bir küçük kamp alanı var. İki çadır kurulmuş, bir kamp ateşi yanıyor ve etrafında üç adam oturuyor. Kamp malzemeleri dağılmış. Giyimleri normal ama biraz kirli; avcı gibiler."
            .tr(),
    "answers": [
      {"title": "Biraz daha gözlemle.".tr(), "aId": 49},
      {"title": "Yardım iste.".tr(), "aId": 52}
    ],
    "id": 48
  },
  {
    "history":
        "Biraz daha izlemeye karar verdim. Adamlar birbirleriyle konuşuyorlar ama ne dediklerini tam olarak duyamıyorum. Biri elindeki haritaya bakıyor, diğer ikisi yemek hazırlıyor gibi görünüyor. Ne yapmalıyım?"
            .tr(),
    "answers": [
      {
        "title": "Sessizce daha da yaklaş, konuşmalarını duymaya çalış.".tr(),
        "aId": 50
      },
      {"title": "Geri çekil ve başka bir yerde yardım ara.".tr(), "aId": 51}
    ],
    "id": 49
  },
  {
    "history":
        "Daha fazla bilgi edinmeliyim. Yavaşça yaklaşıyorum. Şimdi konuşmaları duyabiliyorum ve... Tanrım! Bu adamlar avcı değil! Kaçırılmış birinden bahsediyorlar!"
            .tr(),
    "answers": [
      {"title": "".tr(), "aId": 0},
      {"title": "".tr(), "aId": 0}
    ],
    "id": 50
  },
  {
    "history":
        "Kalbim çok hızlı atıyor ama daha fazla bilgi edinmeliyim. Yavaşça yaklaşıyorum. Şimdi konuşmaları duyabiliyorum ve... Tanrım! Bu adamlar avcı değil! Kaçırılmış birinden bahsediyorlar!"
            .tr(),
    "answers": [
      {"title": "Yanlarına git ve her şeyi anlat.".tr(), "aId": 52},
      {"title": "Saklan ve dinlemeye devam et".tr(), "aId": 1001}
    ],
    "id": 51
  },
  {
    "history":
        "Sence bu çok tehlikeli olmaz mı? Beni öldürebilirler, bıçaklarını görmelisin. Duyduklarıma göre yabancı bir dilde konuşuyorlar, ne dediklerini anlamıyorum. Galiba birisi haritaya bakıyor."
            .tr(),
    "answers": [
      {
        "title": "Haritaya ulaşabilirsen burdan kurtulabiliriz.".tr(),
        "aId": 53
      },
      {"title": "Harita bizim kaçış yolumuz olabilir.".tr(), "aId": 53}
    ],
    "id": 52
  },
  {
    "history":
        "Bekle... silah sesi duydum. Hepsi yerinden koşarak sese doğru koşmaya başladılar, işte orda harita yerde duruyor! gidip alıyım mı?"
            .tr(),
    "answers": [
      {"title": "Güzel bir fırsat hemen al.".tr(), "aId": 54},
      {"title": "Çabuk ol yakalanma.".tr(), "aId": 54}
    ],
    "id": 53
  },
  {
    "history":
        "Hayatımda hiç bu kadar panik yaptığımı hatırlamıyorum. Ve sana bir sürprizim var yerde çanta gördüm ve onu da aldım! Onlar dönmeden hemen burdan uzaklaşıyorum."
            .tr(),
    "answers": [
      {"title": "Dikkatli ol ilk önce haritayı aç.".tr(), "aId": 30},
      {"title": "Nerede olduğumuzu öğrenmeliyiz.".tr(), "aId": 30}
    ],
    "id": 54
  },
  {
    "history":
        "Burdan bişeylere ulaşmak zorundayız biraz daha dinliyorum ve birinden bahsediyorlar. Aman Allahım dal parçasına bastım hepsi buraya bakıyor ve üzerime doğru koşmaya başladılar!"
            .tr(),
    "answers": [
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0}
    ],
    "id": 1001
  },
  {
    "history":
        "Gözlerimi demir bir masanın üzerinde açtım. Tavanda loş bir sarı ışık yanıyor. Yerlerde yer yer kan lekeleri var."
            .tr(),
    "answers": [
      {"title": "Kimse gelmeden çık oradan.".tr(), "aId": 57},
      {"title": "Orası ameliyathane olmalı!".tr(), "aId": 58}
    ],
    "id": 56
  },
  {
    "history":
        "Buradan canlı çıkabileceğimi hiç sanmıyorum. Yerde parlayan bir şey var, ışıktan dolayı yerdeki kanlı neşteri bile göremedim. Elime aldım ve buradan çıkmalıyım."
            .tr(),
    "answers": [
      {"title": "Dikkatli ol her an biri gelebilir!".tr(), "aId": 59},
      {"title": "Kendini koru!".tr(), "aId": 59}
    ],
    "id": 57
  },
  {
    "history":
        "Evet, bunu nasıl da düşünemedim! Işıktan dolayı yerdeki kanlı neşteri bile göremedim. Elime aldım ve buradan çıkmalıyım."
            .tr(),
    "answers": [
      {"title": "Dikkatli ol her an biri gelebilir!".tr(), "aId": 59},
      {"title": "Kendini koru!".tr(), "aId": 59}
    ],
    "id": 58
  },
  {
    "history":
        "Az daha yakalanıyordum. Buraya doğru gelen bir gölge var. Kapının arkasına geçtim."
            .tr(),
    "answers": [
      {"title": "Öldür onu!".tr(), "aId": 60},
      {"title": "Kaçmak için kurtul ondan.".tr(), "aId": 60}
    ],
    "id": 59
  },
  {
    "history":
        "Kendime inanamıyorum, az önce bir rahibi öldürdüm. Hayır! Bu rahip değilmiş."
            .tr(),
    "answers": [
      {"title": "Nasıl anladın?".tr(), "aId": 61},
      {"title": "Ortadan kaldır.".tr(), "aId": 61}
    ],
    "id": 60
  },
  {
    "history":
        "Cesedi odanın en ucuna götürdüm. Elinde bir iğne vardı ve beni fark edince bana saplamaya çalıştı. Neden bir rahip bunu yapmaya çalışsın? Sanırım birden fazla kişi bu tarafa geliyor. Koşmaya başladım, yerler ıslak ve kaygan. Onlar da…"
            .tr(),
    "answers": [
      {"title": "Arkana bakmadan kaç oradan!".tr(), "aId": 62},
      {"title": "Işık gördüğün yere doğru koş!".tr(), "aId": 62}
    ],
    "id": 61
  },
  {
    "history": "Bağlantı koptu.".tr(),
    "answers": [
      {"title": "Kurtuldun mu?".tr(), "aId": 0},
      {"title": "Iyi misin?".tr(), "aId": 0}
    ],
    "id": 62
  },
  {
    "history":
        "Merdivenlerden yukarı doğru tırmandım. Üzerimde bir kapak vardı ve kaldırdığımda kendimi kilisenin günah çıkarma kabininde buldum. Kapağı kilitledim ama her an kırabilirler. Ne yapmalıyım?"
            .tr(),
    "answers": [
      {"title": "Kiliseden çık!".tr(), "aId": 64},
      {"title": "Kilisenin içine saklan.".tr(), "aId": 65}
    ],
    "id": 63
  },
  {
    "history":
        "Kapıyı zorluyorum ama açılmıyor. Neredeyse kapağı kırmak üzereler. Sanırım kapana kısıldım!"
            .tr(),
    "answers": [
      {"title": "Camı kır ve koş!".tr(), "aId": 66},
      {"title": "Camı kır ve saklan!".tr(), "aId": 67}
    ],
    "id": 64
  },
  {
    "history":
        "Şurada bir kutu görüyorum. Sanırım içine sığabilirim. Umarım beni bulamazlar."
            .tr(),
    "answers": [
      {"title": "Etrafın sakinleşmesini bekle.".tr(), "aId": 70},
      {"title": "Sakın ses yapma!".tr(), "aId": 70}
    ],
    "id": 65
  },
  {
    "history":
        "Camı kırdım ama tam çıkarken cam bacağımı yırttı. Sanırım kapağı kırdılar, çünkü bağırma sesleri geliyor. Burada neler dönüyor böyle? Çok fazla kanıyorum, bu yüzden koşamıyorum."
            .tr(),
    "answers": [
      {"title": "Durmak için vaktin yok uzaklaş!".tr(), "aId": 68},
      {"title": "Yarayı sar.".tr(), "aId": 69}
    ],
    "id": 66
  },
  {
    "history":
        "Camı kırdım ve kenardaki kutunun içine saklandım. Umarım burada beni bulamazlar."
            .tr(),
    "answers": [
      {"title": "Etrafın sakinleşmesini bekle.".tr(), "aId": 70},
      {"title": "Sakın ses yapma!".tr(), "aId": 70}
    ],
    "id": 67
  },
  {
    "history":
        "Adrenalin bütün vücudumu sardı ve kısa sürede izimi bulamayacakları kadar uzaklaştım. O insanlar katil! Kaçarken çoğu şeyi yazamadım ama orada gördüklerim hala gözlerimin önünde. Koridorlarda insan resimleri vardı; bunlar, öldürdükleri veya peşinde oldukları kişilere ait olmalı."
            .tr(),
    "answers": [
      {"title": "Ormandan kurtulmalısın.".tr(), "aId": 71},
      {"title": "Oraya geri dön ve gerçekleri öğren.".tr(), "aId": 72}
    ],
    "id": 68
  },
  {
    "history":
        "Tişörtümün kolunu yırttım ve yarayı sardım. Çok fazla vakit kaybettim. Hayır… geliyorlar! Sanırım buraya kadar."
            .tr(),
    "answers": [
      {"title": "Kaçmak zorundasın!".tr(), "aId": 1002},
      {"title": "Hayır pes edemezsin!".tr(), "aId": 1002}
    ],
    "id": 69
  },
  {
    "history":
        "Kalbim yerinden çıkmak üzere. Kapağı kırdılar! ‘Nasıl kaçar o?’ diye bağırıyor biri. Sanırım camdan kaçtığımı düşünüyorlar. Neden gülmeye başladılar? Adım sesleri bu tarafa doğru geliyor. Tanrım, hayır! Ayak izlerim!"
            .tr(),
    "answers": [
      {"title": "Seni bulmadıklarını söyle bana!".tr(), "aId": 1002},
      {"title": "Orada mısın?".tr(), "aId": 1002}
    ],
    "id": 70
  },
  {
    "history": "Denek 17 başarısız. Sinyal koptu.".tr(),
    "answers": [
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0}
    ],
    "id": 1002
  },
  {
    "history":
        "Koşarken farkında olmadan toprak yoldan geçtim. Takip edersem ana yola çıkabiliriz."
            .tr(),
    "answers": [
      {"title": "Başka şansımız yok.".tr(), "aId": 73},
      {"title": "Yolu takip et.".tr(), "aId": 73}
    ],
    "id": 71
  },
  {
    "history":
        "O insanlar katil! Her yer ceset kokuyordu ve hâlâ kendimde değilim. Oraya geri dönmek canımla sonuçlanabilir."
            .tr(),
    "answers": [
      {"title": "Haklısın, tuzak kurmalıyız.".tr(), "aId": 74},
      {"title": "Plan yapmalıyız.".tr(), "aId": 74}
    ],
    "id": 72
  },
  {
    "history":
        "Tamam, yolu takip ediyorum. Ne kadar süredir yürüdüğümü bilmiyorum; çok yoruldum. İleride demir çitler görüyorum, belki çıkış olabilir! Çitlerin üzerinde bir tabela var: ‘Kırmızı Kilise Alanı Giriş Yasaktır!’ Kırmızı Kilise mi? Neresi burası böyle? O da ne! Ağaçta bir kamera var ve tam da bana döndü! Kahretsin! İşte orada!"
            .tr(),
    "answers": [
      {"title": "Ne oldu? Söyle!".tr(), "aId": 1003},
      {"title": "Hey, orada mısın?".tr(), "aId": 1003}
    ],
    "id": 73
  },
  {
    "history":
        "Tek sahip olduğum şey elimde sımsıkı tuttuğum bu kanlı neşter ve işe yaramaz bu çanta. Bekle, daha fazla kurcalıyorum. Sana kötü bir haberim var: En başından beri izleniyoruz. Çantada bir takip cihazı var."
            .tr(),
    "answers": [
      {"title": "Çantayı yem olarak kullan.".tr(), "aId": 75},
      {"title": "Onları istediğimiz konuma getirmelisin.".tr(), "aId": 75}
    ],
    "id": 74
  },
  {
    "history":
        "Çantayı otların arasına sakladım ve uzaklaştım. Çok geçmedi, işte sanırım biri geliyor. Ağacın arkasındayım ve önümden geçmesini bekliyorum."
            .tr(),
    "answers": [
      {"title": "Bekle ve bitir işini.".tr(), "aId": 76},
      {"title": "Öldürme, konuşturmalıyız.".tr(), "aId": 78}
    ],
    "id": 75
  },
  {
    "history":
        "Demek ki sen beni öldürmeye geliyorsun, öyle mi? Son nefesini kesilmiş soluk borundan verdiğin için çok üzgünüm, yanlış kişinin hedefindeydin dostum! Sıra arkadaşına geldi."
            .tr(),
    "answers": [
      {"title": "Bunu yaptığına inanamıyorum.".tr(), "aId": 77},
      {"title": "Hala gerçekleri öğrenmemiz gerekli.".tr(), "aId": 77}
    ],
    "id": 76
  },
  {
    "history":
        "Hâlâ son katilden her şeyi öğrenebiliriz. Cesedi ortadan kaldırıyorum ve beklemeye başlıyorum. Gece oldu, sanırım biri geliyor! Gel bakalım, arkadaşını yalnız bırakma, değil mi, aptal!"
            .tr(),
    "answers": [
      {"title": "Öldürme onu!".tr(), "aId": 78},
      {"title": "Hayır dur!".tr(), "aId": 78}
    ],
    "id": 77
  },
  {
    "history":
        "İşte bu kadar yemi yutacağını biliyordum. Karnında neşterle kıvranıyor; konuşturmayı deneyeceğim. Bunları duymalısın! Üvey annem, kardeşimle beni öldürtmek için… Bize bunu neden yaptın?"
            .tr(),
    "answers": [
      {"title": "Üvey annen mi?".tr(), "aId": 79},
      {"title": "Bu da ne demek!".tr(), "aId": 79}
    ],
    "id": 78
  },
  {
    "history":
        "Evet, şimdi hatırlıyorum. En son, üvey annemin bizden kurtulmak istediğini duymuştum. Beni buraya o getirmiş olmalı. Son hatırladığım şey, arabayla beni eve götürürken kahve almıştı, ama devamını hatırlamıyorum. Beni zehirlemiş olmalı!"
            .tr(),
    "answers": [
      {"title": "Beklediğimizden zekiydin evlat.".tr(), "aId": 1004},
      {"title": "Tahmin ettiğimizden iyiydin.".tr(), "aId": 1004}
    ],
    "id": 79
  },
  {
    "history":
        "Kimsin sen! Anne, baba? Bunu bana neden yaptınız? Ne istediniz kardeşimden? Ne istediniz?! Kaçacak delik arayın çünkü artık…"
            .tr(),
    "answers": [
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi yeniden başlat.".tr(), "aId": 0}
    ],
    "id": 1004
  },
];
