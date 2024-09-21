import 'package:easy_localization/easy_localization.dart';

List<Map<String, dynamic>> gravehurstDetail = [
  {
    "history":
        "Profesör, dediğiniz yere vardık. Gravehurst Akıl Hastanesi. Kapanmayan dosyayı ekibimle kapatmayı hedefliyoruz. Hastanenin kapatılma nedeninin teknik birkaç sebepten olmadığını sizler de biliyorsunuz."
            .tr(),
    "answers": [
      {
        "title":
            "Elbette Edwin. Hastalığımdan dolayı yanınızda olamadım ama hep burda sizi dinliyorum."
                .tr(),
        "aId": 1
      },
      {
        "title":
            "Haklısın Edwin. Gerçekleri ortaya çıkarmanızda sağlığımdan dolayı yanınızda bulunamayacağım ama her zaman buradayım."
                .tr(),
        "aId": 2
      }
    ],
    "id": 0
  },
  {
    "history":
        "Profesör, sizin sağlığınız şu an burada olmanızdan daha önemli. Bize uzaktan da yardım edebilirsiniz. Artık içeri girmemizin vakti geldi."
            .tr(),
    "answers": [
      {
        "title": "Edwin, bu gizemi kimseye bir şey olmadan çözün.".tr(),
        "aId": 3
      },
      {
        "title": "Çocuklar lütfen dikkatli olun. Her an her şey olabilir.".tr(),
        "aId": 3
      }
    ],
    "id": 1
  },
  {
    "history":
        "Profesör, sağlığınız bizim için daha önemli. Bize uzaktan bile yardım edebileceğinize hiç şüphemiz yok. Ekibimle içeri girmemizin vakti geldi."
            .tr(),
    "answers": [
      {"title": "Ben buradayım. Lütfen dikkatli olun.".tr(), "aId": 3},
      {"title": "Merak etmeyin çocuklar, sizi dinliyorum.".tr(), "aId": 3}
    ],
    "id": 2
  },
  {
    "history":
        "Profesör, Gravehurst Akıl Hastanesi'nin girişindeyiz. Hava ağır ve sessiz, içeride bir şeylerin bizi beklediğine dair içimizde güçlü bir his var. Siz olmadan buraya adım atmak riskli ancak rehberliğinize güveniyoruz. İçeri girmeden önce son bir kez talimatlarınızı bekliyoruz. Ne yapmamızı istersiniz?"
            .tr(),
    "answers": [
      {
        "title":
            "Dikkatli olun, tuhaf bir şey fark ederseniz hemen bildirin.".tr(),
        "aId": 4
      },
      {
        "title":
            "Birbirinize güvenin. İlk hedef resepsiyon, dikkatli ilerleyin."
                .tr(),
        "aId": 5
      }
    ],
    "id": 3
  },
  {
    "history":
        "Anlaşıldı, Profesör. İlerlemeye başlıyoruz. Herhangi bir anormallik gördüğümüzde sizi bilgilendireceğiz. İçerisi gerçekten rahatsız edici. Dikkatle hareket edeceğiz."
            .tr(),
    "answers": [
      {
        "title": "Anlaşıldı. İlk bulduğunuz şeyi hemen raporlayın.".tr(),
        "aId": 60
      },
      {"title": "Resepsiyona vardığınızda rapor verin.".tr(), "aId": 58}
    ],
    "id": 4
  },
  {
    "history":
        "Dikkatli bir şekilde resepsiyona doğru ilerliyoruz. İçerisi gerçekten çok rahatsız edici."
            .tr(),
    "answers": [
      {"title": "Resepsiyona vardığınızda rapor verin.".tr(), "aId": 58},
      {"title": "İlerlemeye devam edin. Gözlerinizi dört açın.".tr(), "aId": 6}
    ],
    "id": 5
  },
  {
    "history":
        "Anlaşıldı. Bir koridora girdik, burada karanlık odalar var. Nereye ilerlememizi önerirsiniz?"
            .tr(),
    "answers": [
      {
        "title":
            "Karanlık odalara dikkat edin. İlk önce ana koridoru takip edin."
                .tr(),
        "aId": 7
      },
      {
        "title": "Karanlık odalara girmeyin. Ana koridordan ilerleyin.".tr(),
        "aId": 7
      }
    ],
    "id": 6
  },
  {
    "history":
        "Anlaşıldı, ana koridoru takip ediyoruz. İleride bir kapı var, içeri giriyoruz. İçerisi tamamen karanlık, el fenerlerimiz hazır. İlerliyoruz."
            .tr(),
    "answers": [
      {"title": "Fenerlerinizi kapatmayın, gözünüzü dört açın.".tr(), "aId": 8},
      {"title": "İçeriyi hızlıca kontrol edin.".tr(), "aId": 8}
    ],
    "id": 7
  },
  {
    "history":
        "Kapıyı açtık, içeride eski tıbbi ekipmanlar ve kullanılmış ilaçlar var. Burada deneyler yapılmış olabilir. Karanlıkta hareket eden bir şey var gibi. Görüş alanımızı kaybetmek istemiyoruz."
            .tr(),
    "answers": [
      {
        "title":
            "Görüş alanınızı kaybetmeyin, etrafta aniden belirebilecek bir şey olabilir."
                .tr(),
        "aId": 9
      },
      {
        "title":
            "Bulduğunuz ekipmanları inceleyin. Bu deneylerin sonuçlarını anlamamız önemli."
                .tr(),
        "aId": 10
      }
    ],
    "id": 8
  },
  {
    "history":
        "Karanlıkta hareket eden bir şey fark ettik. Görüş alanımızı korumaya çalışıyoruz."
            .tr(),
    "answers": [
      {"title": "Keşifi iptal edin ve çıkın oradan!".tr(), "aId": 924},
      {
        "title":
            "Hareket eden şeyi gözlemlemeye çalışın, ancak çok yaklaşmayın. O şeyin ne olduğunu anlamadan müdahale etmeyin."
                .tr(),
        "aId": 26
      }
    ],
    "id": 9
  },
  {
    "history":
        "Ekipmanların çoğu bozulmuş. Ancak birkaç not bulduk, deneklerin durumu hakkında bilgi veriyor."
            .tr(),
    "answers": [
      {"title": "Bilgileri benimle paylaşın Edwin.".tr(), "aId": 11},
      {"title": "Ne tür bilgiler ED?".tr(), "aId": 11}
    ],
    "id": 10
  },
  {
    "history":
        "Bir maddeden bahsediyor sanırım. Deneklerin açıklanamayan bir şekilde kaybolduklarını söylüyor."
            .tr(),
    "answers": [
      {
        "title": "İşler gittikçe ilginçleşiyor. Başka ne görüyorsunuz?".tr(),
        "aId": 12
      },
      {"title": "Çok garip. Bize daha fazla ipucu lazım.".tr(), "aId": 12}
    ],
    "id": 11
  },
  {
    "history":
        "Daha fazla ipucu için odadan ayrılıyoruz. Buraya gelirken fark etmediğimiz bir kapı varmış ve kapı kolu yok. Kırıp içeriye girelim mi?"
            .tr(),
    "answers": [
      {"title": "Daha kolay seçeneklerden ilerleyelim.".tr(), "aId": 13},
      {"title": "İçeride işimize yarayan bir şey olabilir.".tr(), "aId": 14}
    ],
    "id": 12
  },
  {
    "history":
        "Haklısınız, Profesör. Diğer katlara çıkmamızın zamanı geldi.".tr(),
    "answers": [
      {"title": "Üst kattan başlayalım.".tr(), "aId": 15},
      {"title": "Alt kattan başlayalım.".tr(), "aId": 17}
    ],
    "id": 13
  },
  {
    "history":
        "Haklısınız, Profesör. Kapıyı kırmaya başladık. İçeride işe yarar bir şey göremiyoruz. Ama kapıyı kırarken aşağıdaki kattan sesler duyduk birisi koşuyor gibiydi, inelim mi?"
            .tr(),
    "answers": [
      {"title": "Her ne ise onu bulmalıyız, hızlıca inin.".tr(), "aId": 17},
      {"title": "Bu tehlikeli olabilir.".tr(), "aId": 16}
    ],
    "id": 14
  },
  {
    "history":
        "Üst katı inceledik, Profesör. Hasta odaları normal gözüküyor, sanki hiç kullanılmamış gibi. Bodruma iniyoruz."
            .tr(),
    "answers": [
      {"title": "Birbirinizden uzaklaşmayın.".tr(), "aId": 17},
      {"title": "Tamam, Ekip.".tr(), "aId": 17}
    ],
    "id": 15
  },
  {
    "history":
        "Bütün dosyanın geleceği bizim keşfimize bağlı, Profesör. Bunu yapmak zorundayız."
            .tr(),
    "answers": [
      {"title": "Peki ED. Lütfen dikkatli olun.".tr(), "aId": 17},
      {"title": "Temkinli ilerleyin.".tr(), "aId": 17}
    ],
    "id": 16
  },
  {
    "history": "Resepsiyonun yanındaki merdivenlerden aşağı iniyoruz.".tr(),
    "answers": [
      {"title": "Sizi dinliyorum.".tr(), "aId": 18},
      {"title": "Durum nedir?".tr(), "aId": 18}
    ],
    "id": 17
  },
  {
    "history":
        "Her şey normal gözüküyor gibi. Burası bomboş bir koridor, tek bir tane oda bile yok. Koridorun sonunda yerde bir şey var gibi. Oraya gidiyoruz."
            .tr(),
    "answers": [
      {"title": "Sizi dinliyorum Ed?".tr(), "aId": 19},
      {"title": "Ne buldunuz?".tr(), "aId": 19}
    ],
    "id": 18
  },
  {
    "history":
        "Burada bir delik var ve içinde de tahtadan bir merdiven var. Sonu gözükmüyor ve çok derin duruyor. İnmeli miyiz?"
            .tr(),
    "answers": [
      {"title": "Telefon çekmeyebilir, ekip insin".tr(), "aId": 20},
      {"title": "Sen dışarıda bekle Edwin, ekip kontrol etsin.".tr(), "aId": 20}
    ],
    "id": 19
  },
  {
    "history": "Ekibi gönderdim, Profesör. Gelmelerini bekliyorum.".tr(),
    "answers": [
      {"title": "Beni meraklandırma.".tr(), "aId": 21},
      {"title": "Tamamdır Ed. Haber bekliyorum.".tr(), "aId": 21}
    ],
    "id": 20
  },
  {
    "history":
        "Profesör, tam 2 saat oldu ve ne gelen var ne de bir ses. Sizce inmeli miyim?"
            .tr(),
    "answers": [
      {"title": "Aşağıya in ve ekibi bul.".tr(), "aId": 22},
      {
        "title": "Çabuk o hastaneden çık ve gelen destek ekibini bekle.".tr(),
        "aId": 23
      }
    ],
    "id": 21
  },
  {
    "history":
        "İniyorum, Profesör. Eğer uzun süre içinde dönmezsem sakın bizi aramaya gelmeyin yoksa siz de-"
            .tr(),
    "answers": [
      {"title": "Sizde ne?".tr(), "aId": 933},
      {"title": "Edwin orda mısın?".tr(), "aId": 933}
    ],
    "id": 22
  },
  {
    "history":
        "Anlaşıldı. Hastanenin bahçesine geri döndüm ve gelecek olan ekibi beklemeye başladım."
            .tr(),
    "answers": [
      {"title": "Destek geldi mi?".tr(), "aId": 24},
      {"title": "Ulaştılar mı?".tr(), "aId": 24}
    ],
    "id": 23
  },
  {
    "history":
        "Evet, Profesör. Onları görebiliyorum. Birlikte içeri girdik, beraber aşağı iniyoruz. Bekleyin bir dakika! Koridor çok farklı bu nasıl olur?"
            .tr(),
    "answers": [
      {"title": "Doğru yere gittiğinden emin misin?".tr(), "aId": 25},
      {"title": "Nasıl yani? Tünel nerede?".tr(), "aId": 25}
    ],
    "id": 24
  },
  {
    "history":
        "Aşağıya indiğimizde koridorda odalar vardı ve koridorun sonundaki kapı mühürlüydü. Polislerin söylediğine göre burası yıllardır bu şekildeymiş"
            .tr(),
    "answers": [
      {"title": "Bu mümkün değil!".tr(), "aId": 932},
      {"title": "Ekip nerede Ed?".tr(), "aId": 932}
    ],
    "id": 25
  },
  {
    "history":
        "Profesör, inanmayacaksınız ama koridorun ışıkları soluk bir şekilde yanıp sönmeye başladı, etrafı seçebiliyoruz ama yalnız olmadığımızdan eminim. Tanrım o da ne!"
            .tr(),
    "answers": [
      {"title": "Ne gördün??".tr(), "aId": 27},
      {"title": "ED! İyi misiniz?".tr(), "aId": 27}
    ],
    "id": 26
  },
  {
    "history":
        "Asansör! Asansörün kapısı açıldı. Profesör burada neler oluyor! Bir şey bizi istediği yere çekmeye çalışıyor gibi."
            .tr(),
    "answers": [
      {"title": "Edwin bu bir tuzak olabilir.".tr(), "aId": 28},
      {
        "title":
            "Çocuklar bu hiç de iyiye işaret değil. Geri dönmenizi istiyorum."
                .tr(),
        "aId": 931
      }
    ],
    "id": 27
  },
  {
    "history":
        "Sanırım öyle, Profesör. Bizi daha derinlere sürüklemek istiyor ya da biz artık deliriyoruz!"
            .tr(),
    "answers": [
      {"title": "Merdivenle inin.".tr(), "aId": 29},
      {"title": "Asansörü kullanmayın.".tr(), "aId": 29}
    ],
    "id": 28
  },
  {
    "history":
        "Sanırım buradaki olaylar, düşündüğümüzden çok daha derin. Bodrum kata iniyoruz. Kapı çok eski, ama açmayı başardık. Tanrım! Burada eski bir askeri laboratuvar var. Duvarlarda deneylerin detayları yazılı, tüm ekipmanlar yerinde duruyor. Sanki burası terk edilmemiş gibi."
            .tr(),
    "answers": [
      {
        "title": "Çocuklar hızlı olun ve işe yarar şeyler arayın.".tr(),
        "aId": 30
      },
      {"title": "Kimse gelmeden bir şeyler bulun.".tr(), "aId": 30}
    ],
    "id": 29
  },
  {
    "history":
        "Profesör! Burada sadece bir laboratuvar değil, aynı zamanda askeri belgeler ve haritalar da var. Belgelerde 'Deney-042' kod adlı bir projeden bahsediliyor. Görünüşe göre burada, insan vücudu üzerinde deneyler yapılmış. Bir kapı daha bulduk, ama bu kapının ardında ne olduğunu bilmiyoruz. Sanki bir şey bizi izliyor. Ne yapalım, Profesör?"
            .tr(),
    "answers": [
      {"title": "Devam edin, Edwin.".tr(), "aId": 31},
      {"title": "Görevi iptal ediyorum hemen orayı terk edin!".tr(), "aId": 930}
    ],
    "id": 30
  },
  {
    "history":
        "Profesör, burada durmak istemiyoruz ancak kapının ardında ne olduğunu bilmeden geri çekilmek de doğru gelmiyor. Belgelerde bir şeyden bahsediliyor: 'Son aşama'. Sanki burada çok tehlikeli bir şeyin son aşaması gerçekleştirilmiş."
            .tr(),
    "answers": [
      {"title": "Deneyi öğrenin.".tr(), "aId": 32},
      {"title": "Detayları bulun.".tr(), "aId": 32}
    ],
    "id": 31
  },
  {
    "history":
        "Profesör, kapıyı açtık. İçeride devasa bir kontrol odası var. Her yer monitörlerle dolu ve ekranda deneylerin görüntüleri oynuyor. Deneylerin hepsi insanlar üzerinde yapılmış! Deneklerin bazıları hâlâ yaşıyor olabilir mi? Kayıtlarda 'Son aşama' denilen şey, insan bilinci ve makinelerin birleşimi gibi görünüyor. Ne yapmamız gerekiyor?"
            .tr(),
    "answers": [
      {
        "title":
            "Akıl hastalarından daha zekilerine ihtiyacımız vardı :).".tr(),
        "aId": 928
      },
      {"title": "Hoş geldiniz çocuklar :).".tr(), "aId": 929}
    ],
    "id": 32
  },
  {
    "history": "Bütün ekibin gözleri yanılmış olamaz değil mi, Profesör?".tr(),
    "answers": [
      {
        "title":
            "Belki de haklı olabilirsiniz. Her şeyi bilmek istiyorum.".tr(),
        "aId": 34
      },
      {
        "title": "Bilemiyorum çocuklar, sadece paniğe kapılmayın.".tr(),
        "aId": 34
      }
    ],
    "id": 33
  },
  {
    "history":
        "Bu nasıl olabilir? Arkamızdaki ışıklar yanmaya başladı. Bu duyduğum gerçek mi yoksa gerçekten de az önceki resepsiyondaki eski telefon mu çalıyor!?"
            .tr(),
    "answers": [
      {"title": "Edwin, bu gerçek olamaz!".tr(), "aId": 1},
      {"title": "Bu da ne!".tr(), "aId": 1}
    ],
    "id": 34
  },
  {
    "history":
        "Hemen koşarak oraya gidiyoruz. Önemli bir haberim var, Profesör. Çalan telefondu ve biz gelince çalması durdu. İlginç olan şey, telefona bağlı bir kablo bile yok!"
            .tr(),
    "answers": [
      {"title": "Ciddi olamazsın ED!".tr(), "aId": 29},
      {"title": "Bir şey sizi yanına çekmeye çalışıyor.".tr(), "aId": 29}
    ],
    "id": 35
  },
  {
    "history":
        "Profesör buna inanmayacaksınız çünkü tarihler bugünü gösteriyor. Bu nasıl mümkün olabilir? Karanlık maddenin hapsedilmeye çalışıldığı ama planın ters gittiğinden bahsediyor. Devamı okunamayacak şekilde yıpranmış."
            .tr(),
    "answers": [
      {"title": "Her şeye bu madde sebep olmuş gibi.".tr(), "aId": 37},
      {"title": "Geleceğimizi biliyor olmalılar.".tr(), "aId": 38}
    ],
    "id": 36
  },
  {
    "history":
        "Şu anki bulduğumuz ipuçları öyle gösteriyor, Profesör. Daha fazla ipucu için etrafı araştırmaya devam ediyoruz."
            .tr(),
    "answers": [
      {"title": "Aşağıya inmenizin vakti geldi".tr(), "aId": 39},
      {"title": "Dosyada asıl olayın bodrumda olduğu yazıyor.".tr(), "aId": 40}
    ],
    "id": 37
  },
  {
    "history":
        "Evet. Bir şeyler bizimle oyun oynamak istiyor. Artık korkmaya başladım, Profesör! Ne yapmalıyız?"
            .tr(),
    "answers": [
      {"title": "Dosyada asıl olayın bodrumda olduğu yazıyor.".tr(), "aId": 40},
      {
        "title": "Çocuklar sizi tehlikeye atamam. Korkmaya başladım.".tr(),
        "aId": 925
      },
    ],
    "id": 38
  },
  {
    "history":
        "Biz de öyle düşünüyoruz, Profesör. Ekiple birlikte aşağıya iniyoruz. Duvarların kenarları yosun tutmuş. Merdiven de neredeyse harabeye dönmüş olsa da başarılı bir şekilde aşağı indik."
            .tr(),
    "answers": [
      {"title": "Dosyada geçen kayıt cihazını bulmalısınız.".tr(), "aId": 41},
      {
        "title": "Deneylerin yapıldığı odada kayıt cihazı olmalı.".tr(),
        "aId": 41
      }
    ],
    "id": 39
  },
  {
    "history":
        "Sizlerle hemfikiriz, Profesör. O maddenin aşağıda olduğundan eminim. Aşağıya indik."
            .tr(),
    "answers": [
      {"title": "Dosyada geçen kayıt cihazını bulmalısınız.".tr(), "aId": 41},
      {
        "title": "Deneylerin yapıldığı odada kayıt cihazı olmalı.".tr(),
        "aId": 41
      }
    ],
    "id": 40
  },
  {
    "history":
        "Profesör, burada çok ağır bir koku var. Herhangi bir oda görmüyoruz sadece ileride demir bir duvar ve kapı görüyoruz, tıpkı hapishanelerdeki gibi. Ekibimle kapıyı açmaya çalışıyoruz."
            .tr(),
    "answers": [
      {"title": "Kırabildiniz mi?".tr(), "aId": 42},
      {"title": "Son durum ne Edwin?".tr(), "aId": 42}
    ],
    "id": 41
  },
  {
    "history":
        "Çok uzun sürdü, Profesör. Sonunda açtık! Aman tanrım! Koridor boyunca tavandan asılmış cesetlerle dolu burası. Ekip arkadaşlarım kusmaya başladı. Tanrım burayı nasıl olur da kimse bulamaz?"
            .tr(),
    "answers": [
      {"title": "Bu gerçekten inanılmaz!".tr(), "aId": 43},
      {"title": "Maskelerinizi takın hemen.".tr(), "aId": 43}
    ],
    "id": 42
  },
  {
    "history":
        "Önlemlerimizi aldık, Profesör. İlerliyoruz. Cesetlerin hastanedeki akıl hastaları olduğu aşikar. Hepsinin elleri arkadan bağlı, beyaz önlükleri var ve üstlerinde aynı şey yazıyor! (Arkana bakma)"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsunuz?".tr(), "aId": 1},
      {"title": "Ed! Cevap ver! Neler oluyor?".tr(), "aId": 1}
    ],
    "id": 43
  },
  {
    "history":
        "Profesör, damarlarımdaki kan akışının durduğunu hissediyorum. Yazıyı okuyup arkamızı döndüğümüzde arkamızdaki kapının yerinde ayna vardı. Profesör! Aynada hiçbirimizin yansıması yok!!!"
            .tr(),
    "answers": [
      {"title": "Oradan hemen çıkın! Görev iptal!".tr(), "aId": 1},
      {"title": "Bu nasıl olur? Etrafı hızlıca kontrol edin.".tr(), "aId": 1}
    ],
    "id": 44
  },
  {
    "history":
        "Çıkabiliceğimiz bir yer bulamadık, Profesör. Geri dönemiyoruz! Lütfen bize yardım edin!"
            .tr(),
    "answers": [
      {
        "title": "Polisi çağıramam, Edwin. Hepimizi hapise alırlar.".tr(),
        "aId": 47
      },
      {"title": "Cam?".tr(), "aId": 47}
    ],
    "id": 45
  },
  {
    "history":
        "Kapı aynanın arkasındadır diye aynayı kırdık, Profesör. Kapı yoktu ama bir not bulduk"
            .tr(),
    "answers": [
      {"title": "Ne yazıyor notta?".tr(), "aId": 48},
      {"title": "Notu oku Edwin!".tr(), "aId": 48}
    ],
    "id": 46
  },
  {
    "history": "(System: Sinyal kesildi.)".tr(),
    "answers": [
      {"title": "Mesajlarımı görmüyor musunuz?".tr(), "aId": 49},
      {"title": "ED! Orada mısın?".tr(), "aId": 49}
    ],
    "id": 47
  },
  {
    "history":
        "Not: Bakma arkana görünmez ölüler, bak arkana dirilsin deliler!".tr(),
    "answers": [
      {"title": "Nasıl yani? Bu ne şimdi?".tr(), "aId": 50},
      {"title": "Lütfen bakmadık diyin EDD!!".tr(), "aId": 50}
    ],
    "id": 48
  },
  {
    "history":
        "Profesör! Havalandırmadan sesler geliyor! Sanırım bir gaz yayılıyor!"
            .tr(),
    "answers": [
      {"title": "Maskeleriniz!!!".tr(), "aId": 926},
      {"title": "Sakın solumayın!".tr(), "aId": 926}
    ],
    "id": 49
  },
  {
    "history": "Galiba bir sorunumuz var, Profesör. Onlar-".tr(),
    "answers": [
      {"title": "Onlar ne? Neler oldu?".tr(), "aId": 51},
      {"title": "Canlandılar mı yoksa?".tr(), "aId": 51}
    ],
    "id": 50
  },
  {
    "history": "Hayır, tavanda hiçbir şey yok. Bütün cesetler kaybolmuş.".tr(),
    "answers": [
      {"title": "Yoksa sorun sizde mi?".tr(), "aId": 52},
      {"title": "Bu mümkün değil!".tr(), "aId": 52}
    ],
    "id": 51
  },
  {
    "history":
        "Profesör, biz hayal görüyor olabilir miyiz bilmiyorum ama şu an delirmek üzereyiz. Galiba bu koku bir tür gaz ve biz bundan dolayı böyle şeyler görüyoruz emin değilim. Profesör, sanırım köşede bir şey var. Evet bir kamera ve ışığı yanıp sönüyor, tam da bize bakıyor!"
            .tr(),
    "answers": [
      {"title": "Demek başından beri biliyorlardı.".tr(), "aId": 53},
      {"title": "Yalnız olmadığımızı biliyordum.".tr(), "aId": 53}
    ],
    "id": 52
  },
  {
    "history":
        "Profesör, kamerayı inceledik. Ekranda bizi izleyen bir görüntü var ama izleyen sizsiniz! Ekranda siz varsınız! Sanki her hareketimizi çok önceden biliyormuşsunuz gibi. Profesör, bu nasıl mümkün olabilir? Tam anlam veremiyoruz ama burada bizimle mi yoksa bize karşı mı çalışıyorsunuz? Tüm bu deneylerin ardında siz mi varsınız?"
            .tr(),
    "answers": [
      {"title": "Sizi tanımak güzeldi.".tr(), "aId": 1},
      {"title": "Üzgünüm çocuklar.".tr(), "aId": 1}
    ],
    "id": 53
  },
  {
    "history":
        "Bir odada karanlık bir gölge gördük, aniden kayboldu. Bunun varlıkla bir ilgisi olabilir."
            .tr(),
    "answers": [
      {
        "title": "Sakin kalmaya çalışın. Gözünüz yanılmış olabilir.".tr(),
        "aId": 33
      },
      {"title": "Tehlikedesiniz Ed! Keşfi iptal edin.".tr(), "aId": 924}
    ],
    "id": 54
  },
  {
    "history":
        "Bir eski not defteri bulduk. İçinde, varlıkla ilgili yapılan bazı deneylerin notları var."
            .tr(),
    "answers": [
      {
        "title":
            "Varlıkla ilgili olayların ne zaman başladığını anlamamız gerek."
                .tr(),
        "aId": 1
      },
      {
        "title":
            "Notlarda tuzaklar veya sakınmamız gereken noktalar belirtilmiş mi?"
                .tr(),
        "aId": 1
      }
    ],
    "id": 55
  },
  {
    "history":
        "Bu varlıkla ilgili başka hiçbir bilgi yok. Sanırım hayal ürünü olabilir ama yine de dikkatli olacağız. Bulduğumuz diğer ipuçlarını da toplayıp analiz edeceğiz."
            .tr(),
    "answers": [
      {"title": "Varlıkla ilgili daha fazla bilgi arayın.".tr(), "aId": 55},
      {
        "title":
            "Diğer odaları kontrol edin, varlıkla ilgili izler olabilir.".tr(),
        "aId": 54
      }
    ],
    "id": 56
  },
  {
    "history":
        "Günlükteki son yazı, içeride 'karanlık bir varlık' olduğundan bahsediyor. Daha fazla detay yok."
            .tr(),
    "answers": [
      {
        "title": "Karanlık varlık mı? Tehlikeye karşı hazırlıklı olun.".tr(),
        "aId": 56
      },
      {
        "title": "Varlığın ne olduğunu bilmiyoruz, dikkatli olun.".tr(),
        "aId": 56
      }
    ],
    "id": 57
  },
  {
    "history":
        "Profesör, resepsiyon güvenli görünüyor. Burada garip bir günlük var, okumaya başlıyoruz."
            .tr(),
    "answers": [
      {
        "title": "Günlüğü hızlıca inceleyin. Vakit kaybetmek istemiyoruz.".tr(),
        "aId": 59
      },
      {
        "title": "Günlükteki detaylar tehlikeli olabilir. Hazır olun.".tr(),
        "aId": 57
      },
    ],
    "id": 58
  },
  {
    "history":
        "Günlükte, hastaların zihinsel durumlarını daha da kötüleştirmek için deneyler yapıldığı yazıyor. Birkaç hasta tuhaf sesler duyduğundan bahsetmiş."
            .tr(),
    "answers": [
      {"title": "Bu bilgiler önemli. Not ediyorum.".tr(), "aId": 62},
      {
        "title": "Tuhaf seslere dikkat edin. Sizi yanıltabilirler.".tr(),
        "aId": 62
      }
    ],
    "id": 59
  },
  {
    "history":
        "Profesör, resepsiyona ulaştık. Burada bazı eski dosyalar ve bir anahtar bulduk."
            .tr(),
    "answers": [
      {
        "title": "Anahtarı saklayın. Dosyaları hızlıca inceleyin.".tr(),
        "aId": 119
      },
      {
        "title": "Dosyalarda bir harita veya plan varsa bana iletin.".tr(),
        "aId": 61
      }
    ],
    "id": 60
  },
  {
    "history":
        "Bir harita bulduk. Bodrum katına inen gizli bir geçitten bahsediyor. Giriş noktası koridorun sonunda gibi görünüyor."
            .tr(),
    "answers": [
      {
        "title": "Geçidi dikkatlice inceleyin, ancak hemen girmeyin.".tr(),
        "aId": 90
      },
      {"title": "Bodrum tehlikeli olabilir. Hazırlıklı olun.".tr(), "aId": 90}
    ],
    "id": 61
  },
  {
    "history":
        "Kulağımıza garip fısıltılar geliyor, sanki uzak bir yerden. Ekibin morali düşmeye başladı."
            .tr(),
    "answers": [
      {
        "title": "Moralinizi yüksek tutun, ilerlemeye devam edin.".tr(),
        "aId": 63
      },
      {"title": "Fısıltıların kaynağını bulmaya çalışın.".tr(), "aId": 63}
    ],
    "id": 62
  },
  {
    "history":
        "Fısıltıların kaynağına ulaşmaya çalışıyoruz. Ekip sıkı bir şekilde birbirine bağlı. Fısıltılar, koridorun sonundaki bir odaya odaklanıyor gibi. Oraya yaklaşırken dikkatli olacağız."
            .tr(),
    "answers": [
      {"title": "Fısıltılar bir insan fısıltısı gibi mi?".tr(), "aId": 64},
      {"title": "Fısıltılar anlaşılabiliyor mu?".tr(), "aId": 64}
    ],
    "id": 63
  },
  {
    "history":
        "Daha çok cinsiyeti olmayan bir uğultu gibi. Sanırım bazı kelimeler söyleniyor. Ama hala uzak olduğumuz için sesi anlayamıyoruz. Ne yapalım?"
            .tr(),
    "answers": [
      {"title": "Sese doğru ilerleyin.".tr(), "aId": 65},
      {"title": "Bu kadar yeter. Geri dönün.".tr(), "aId": 923}
    ],
    "id": 64
  },
  {
    "history":
        "Anlaşıldı, Profesör. Koridorun sonundaki odaya yaklaşıyoruz. Fakat, bir dakika. Burada garip bir şey var. Zeminde büyük bir metal kapak var. Üzerinde 'Dikkat: Yetkisiz Giriş Yasaktır' yazıyor. Askeri bir sembol de var."
            .tr(),
    "answers": [
      {"title": "İlginç. Akıl hastanesinde askeri bir giriş?".tr(), "aId": 66},
      {"title": "Kapağı açabilir misiniz?".tr(), "aId": 67}
    ],
    "id": 65
  },
  {
    "history": "Hem de çok ilginç, Profesör. Ne yapmamızı istersiniz?".tr(),
    "answers": [
      {"title": "Kapağı analiz edebilir misiniz?".tr(), "aId": 67},
      {"title": "Kapağı açabilir misiniz?".tr(), "aId": 67}
    ],
    "id": 66
  },
  {
    "history":
        "Deniyoruz ama oldukça ağır bir malzeme. Biraz zorlamayı deneyeceğiz. Güzel, kapak açılmaya başladı!"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsunuz?".tr(), "aId": 68},
      {"title": "İçeride ne var?".tr(), "aId": 68}
    ],
    "id": 67
  },
  {
    "history":
        "Aşağı doğru inen metal bir merdiven var. Derinlere gidiyor gibi görünüyor. Ve aşağıdan hafif bir uğultu geliyor."
            .tr(),
    "answers": [
      {"title": "Çok dikkatli olun.".tr(), "aId": 69},
      {
        "title": "İnmeden önce gerekli ekipmanlarınızı kontrol edin.".tr(),
        "aId": 69
      }
    ],
    "id": 68
  },
  {
    "history":
        "Tamamdır, indik. Vay canına! Burası devasa bir askeri yeraltı tesisi!"
            .tr(),
    "answers": [
      {"title": "Neler görüyorsunuz?".tr(), "aId": 70},
      {"title": "Detaylı anlatın.".tr(), "aId": 70}
    ],
    "id": 69
  },
  {
    "history":
        "Geniş bir salon, her yerde bilgisayarlar ve tıbbi ekipmanlar var. Ama bunlar normal hastane ekipmanlarına benzemiyor. Çok daha gelişmiş görünüyorlar.\n\nDuvarda büyük bir levha var: 'Proje DeVast - Sınırlı Erişim'. Profesör, bu ne olabilir?"
            .tr(),
    "answers": [
      {
        "title": "Proje DeVast... Bu isim bana bir şeyler çağrıştırıyor.".tr(),
        "aId": 71
      },
      {
        "title":
            "Gizli bir askeri proje olabilir. Etrafta başka ne görüyorsunuz?"
                .tr(),
        "aId": 71
      }
    ],
    "id": 70
  },
  {
    "history":
        "Profesör, burası kesinlikle bir askeri tesis. Her yerde askeri semboller ve teçhizat var. Duvarlarda 'Savunma Bakanlığı Gizli Projesi' yazıyor."
            .tr(),
    "answers": [
      {"title": "Başka ne var?".tr(), "aId": 72},
      {
        "title":
            "Bu tür tesisler genellikle sıkı güvenlik önlemleriyle donatılmıştır."
                .tr(),
        "aId": 72
      }
    ],
    "id": 71
  },
  {
    "history":
        "Evet, her yerde güvenlik kameraları ve sensörler görüyoruz. Ama çoğu devre dışı gibi görünüyor. Tesis terk edilmiş olabilir mi?"
            .tr(),
    "answers": [
      {"title": "Olabilir ama tetikte olun.".tr(), "aId": 73},
      {"title": "Ne tür askeri ekipmanlar görüyorsunuz?".tr(), "aId": 74}
    ],
    "id": 72
  },
  {
    "history": "Tamamdır, Profesör. Şimdi ne yapmamızı istersiniz?".tr(),
    "answers": [
      {"title": "Askeri olarak ne var?".tr(), "aId": 74},
      {"title": "Etrafınızdakileri yaz.".tr(), "aId": 74}
    ],
    "id": 73
  },
  {
    "history":
        "Burada birkaç kapalı konteyner var. Üzerlerinde 'Dikkat: Biyolojik Materyal' yazıyor. Vay canına! Bir dizi yüksek teknolojili silah prototipini andıran şeyler görüyoruz."
            .tr(),
    "answers": [
      {"title": "İçine bakın bakalım.".tr(), "aId": 919},
      {
        "title": "Uzak durun. Herhangi bir belge veya bilgisayar var mı?".tr(),
        "aId": 75
      }
    ],
    "id": 74
  },
  {
    "history":
        "Evet, bir kontrol odasına benzer bir yer bulduk. İçeride aktif bir bilgisayar var."
            .tr(),
    "answers": [
      {"title": "Bilgisayarı alın ve operasyonu bitirin.".tr(), "aId": 918},
      {"title": "İçerisine erişmeye çalışın.".tr(), "aId": 76}
    ],
    "id": 75
  },
  {
    "history":
        "Bilgisayara erişim sağladık. Burada 'Operasyon DeVast' adlı bir dosya var. Açıyorum.\n\nProfesör, bir şey oluyor! Sanırım tesis uyanıyor!"
            .tr(),
    "answers": [
      {
        "title":
            "Hızlıca Operasyon DeVast dosyasından önemli bilgileri alın.".tr(),
        "aId": 77
      },
      {"title": "Hemen ordan çıkın. Araştırma bitti.".tr(), "aId": 917}
    ],
    "id": 76
  },
  {
    "history":
        "Tamam, dosyayı tarıyoruz. Bu bir DARPA projesi gibi görünüyor. İleri düzey protez ve eksoskeleton geliştirme üzerine çalışmışlar. Yaralı askerlerin rehabilitasyonu için tasarlanmış. Anlaşılan o ki Gravehurst Akıl Hastanesi bunun için mükemmel bir örtü sağlamış. Proje 5 yıl önce durdurulmuş. Bütçe kesintileri ve etik kaygılar nedeniyle. Son kayıtlara göre, tüm ekipmanlar ve veriler güvenli bir şekilde taşınmış ve tesis kapatılmış."
            .tr(),
    "answers": [
      {"title": "Demek ki bu yüzden kapatılmış tesis.".tr(), "aId": 78},
      {"title": "Yine hükümetin gizli işleri yüzünden.".tr(), "aId": 78}
    ],
    "id": 77
  },
  {
    "history":
        "Evet, maalesef. Bu arada uzaktan bir gıcırtı sesi geliyor, Profesör. Ne yapacağız!?"
            .tr(),
    "answers": [
      {"title": "Çıkış yolunu hatırlıyor musunuz?".tr(), "aId": 80},
      {
        "title": "Endişelenmeyin. Muhtemelen eski bir havalandırma ızgarasıdır."
            .tr(),
        "aId": 79
      }
    ],
    "id": 78
  },
  {
    "history":
        "Evet, öyleymiş. Sanırım sadece eski jeneratörler ve havalandırma sistemleri, Profesör. Tesis uzun zamandır kapalı olduğu için, sistemler tekrar çalışmaya başlayınca bu sesleri çıkarıyor olabilir."
            .tr(),
    "answers": [
      {"title": "Oradan çıkmanız gerek.".tr(), "aId": 80},
      {"title": "Çıkışa doğru ilerleyin.".tr(), "aId": 81}
    ],
    "id": 79
  },
  {
    "history":
        "Evet. Buradan çıkıyoruz. Biraz daha bilgi toplayıp ve bunları fotoğraflayıp çıkıyoruz. Ama ışık az olduğu için çok net değiller. "
            .tr(),
    "answers": [
      {
        "title": "Sorun yok. Orayı sessiz bir şekilde terk edin.".tr(),
        "aId": 81
      },
      {"title": "Elimizden geleni yapıyoruz. Tesisten ayrılın.".tr(), "aId": 81}
    ],
    "id": 80
  },
  {
    "history":
        "Çıkışa doğru ilerliyoruz. Burada bir merdiven var. Profesör, şu an bir ses duyuyoruz. Ayak sesleri gibi! Yukarıdan geliyor!"
            .tr(),
    "answers": [
      {"title": "Güvenlik görevlisidir.".tr(), "aId": 82},
      {"title": "Sakin. Kedi olabilir.".tr(), "aId": 82}
    ],
    "id": 81
  },
  {
    "history":
        "Şu an merdivenin tepesindeyiz. Burada iki kişi var. Sivil kıyafetli."
            .tr(),
    "answers": [
      {"title": "Saldırın onlara!".tr(), "aId": 915},
      {"title": "Kim olduklarını sorun.".tr(), "aId": 83}
    ],
    "id": 82
  },
  {
    "history":
        "Tamam. Bunlar olurken size ses kaydı atacağım. Bekleyin.\n\nEkip: Özür dileriz, siz kimsiniz?\n\nBilinmeyen Kişiler: Biz de size aynı soruyu soracaktık. Buraya nasıl girdiniz?\n\nEkip: Biz bir araştırma ekibiyiz. Peki siz?\n\nBilinmeyen Kişiler: Biz de eski askeri tesisleri inceleyen tarihçileriz. Buraya giriş izniniz var mı?"
            .tr(),
    "answers": [
      {"title": "Kimliklerinizi gösterin ve durumu açıklayın.".tr(), "aId": 84},
      {"title": "Bunlar tarihçi değil. Ateş edin!".tr(), "aId": 913}
    ],
    "id": 83
  },
  {
    "history":
        "Tamamdır, Profesör. Onlar da kimliklerini gösterdiler. Gerçekten de tarihçi gibi görünüyorlar."
            .tr(),
    "answers": [
      {"title": "Onlara ne gördüğünüzü KISACA anlatın.".tr(), "aId": 85},
      {"title": "Onlara ne gördüğünüzü DETAYLICA anlatın.".tr(), "aId": 912}
    ],
    "id": 84
  },
  {
    "history":
        "Tamamdır, Profesör. Tekrar ses kaydı alıyorum.\n\nEkip: Aşağıda eski bir askeri araştırma tesisi bulduk. DARPA ile ilgili bazı belgeler var.\n\nTarihçi: Evet, biz de bunun peşindeydik. Bu tesisi belgelemek için buradayız. Siz ne kadarını gördünüz aşağıda?\n\nAdamlar bana bakıyor. Ne diyeyim Profesör?"
            .tr(),
    "answers": [
      {"title": "Onlara genel bilgiler verin.".tr(), "aId": 86},
      {"title": "Onlara her şeyi anlatın.".tr(), "aId": 911}
    ],
    "id": 85
  },
  {
    "history":
        "Tamam. Tekrar ses kaydı alıyorum.\n\nEkip: Protez ve eksoskeleton araştırmaları hakkında bazı bilgiler bulduk. Proje yaklaşık 5 yıl önce kapatılmış.\n\nTarihçi: Bu çok ilginç. Acaba bulgularınızı bizimle paylaşmayı düşünür müsünüz?\n\nProfesör, ne yapalım? Bulgularımızı paylaşalım mı?"
            .tr(),
    "answers": [
      {"title": "Hayır. Genel bilgiler sadece.".tr(), "aId": 87},
      {"title": "Evet, paylaşın.".tr(), "aId": 910}
    ],
    "id": 86
  },
  {
    "history":
        "[Ses Kaydı]\n\nEkip: Anlaşıldı. Elbette, genel bilgileri sizinle paylaşabiliriz. Ancak, detaylı raporumuzu önce kendi kurumumuza sunmamız gerekiyor.\n\nTarihçi: Anlıyoruz. Peki, aşağıda başka ne gördünüz? Herhangi bir ilginç ekipman veya belge?\n\nEkip: Çoğunlukla boş odalar ve eski bilgisayarlar gördük. Birkaç belge bulduk, ama çoğu rutin raporlar gibiydi.\n\nTarihçi: İlginç. Biz de bunlara benzer şeyler olduğunu biliyoruz. Bu tesisin tam olarak ne için kullanıldığını biliyor musunuz?"
            .tr(),
    "answers": [
      {"title": "Dikkatli olun, çok fazla bilgi vermeyin.".tr(), "aId": 88},
      {"title": "Belgelerle ilgili detaylı bilgileri vermeyin.".tr(), "aId": 88}
    ],
    "id": 87
  },
  {
    "history":
        "[Ses Kaydı]\n\nEkip: Tam olarak emin değiliz. Protez teknolojileri üzerine çalışıldığını gördük, ama detaylar belirsiz.\n\nTarihçi: Anlıyorum. Bu konu hakkında daha fazla araştırma yapmayı düşünüyor musunuz?\n\nProfesör, ne diyeyim?"
            .tr(),
    "answers": [
      {"title": "Genel yanıtlara devam.".tr(), "aId": 89},
      {"title": "Kesin bir cevap vermeyin.".tr(), "aId": 89}
    ],
    "id": 88
  },
  {
    "history":
        "[Ses Kaydı]\n\nEkip: Şu an için planlarımız belirsiz. Bulgularımızı değerlendireceğiz ve sonra karar vereceğiz.\n\nTarihçi: Peki, teşekkür ederiz. Belki ileride bilgi alışverişinde bulunabiliriz. İşte kartvizitim.\n\nEkip: Teşekkürler. Biz de lazım oldukça size ulaşırız."
            .tr(),
    "answers": [
      {"title": "Şimdi nazikçe ayrılın oradan.".tr(), "aId": 908},
      {"title": "Tesisi terk edin.".tr(), "aId": 908}
    ],
    "id": 89
  },
  {
    "history":
        "Geçidin girişini bulduk, ancak içeriden soğuk bir rüzgar geliyor. İçeride neler olduğunu bilmiyoruz. Geçit beklediğimizden daha derin. Bodruma inmeden önce ekipmanlarımızı kontrol ediyoruz."
            .tr(),
    "answers": [
      {
        "title":
            "Geçidin derinliğini belirleyin. Anormal bir şey var mı kontrol edin."
                .tr(),
        "aId": 91
      },
      {"title": "Ekipmanlarınız tamamsa geçide girin.".tr(), "aId": 91}
    ],
    "id": 90
  },
  {
    "history":
        "Geçide girdik. Duvarlarda çizikler ve eski tıbbi ekipmanlar görüyoruz. Sanki burada bir şeyler saklanmış. Geçidin sonunda büyük bir metal kapı var. Üzerinde tuhaf işaretler var."
            .tr(),
    "answers": [
      {"title": "İşaretler size bir şeyler çağrıştırıyor mu? ".tr(), "aId": 92},
      {"title": "İşaretler mi?.".tr(), "aId": 92}
    ],
    "id": 91
  },
  {
    "history":
        "Evet fakat kapının üzerindeki işaretler silik. Sadece renginin kırmızı olduğunu görebiliyoruz. Tam ne olduğu anlaşılmıyor. Kapı kilitli, zorlamayı denedik ama açılmadı. Ne yapalım?"
            .tr(),
    "answers": [
      {"title": "Etrafta başka bir mekanizma olmalı.".tr(), "aId": 93},
      {
        "title": "Duvarlarda veya zeminde anormal bir şey var mı?".tr(),
        "aId": 93
      }
    ],
    "id": 92
  },
  {
    "history":
        "Evet var, Profesör. Burada, kapının yanında küçük bir panel var. Üzerinde beş adet renkli düğme bulunuyor: kırmızı, mavi, yeşil, sarı ve beyaz."
            .tr(),
    "answers": [
      {
        "title": "İlginç. Etrafta bu renklerle ilgili bir ipucu var mı?".tr(),
        "aId": 94
      },
      {"title": "Bir tür şifre mekanizması olabilir.".tr(), "aId": 95}
    ],
    "id": 93
  },
  {
    "history":
        "Çevreyi kontrol ettik, Profesör. Karşı duvarda soluk bir yazı var. 'Gökkuşağının sırrı çözülmeli' diyor."
            .tr(),
    "answers": [
      {"title": "Gökkuşağı mı? Saçma.".tr(), "aId": 96},
      {"title": "Renk sırası önemli olmalı.".tr(), "aId": 97}
    ],
    "id": 94
  },
  {
    "history":
        "Evet, Profesör. Tam olarak karşı duvarımızda soluk bir yazı var. 'Gökkuşağının sırrı çözülmeli' diyor."
            .tr(),
    "answers": [
      {"title": "Gökkuşağı mı? Saçma.".tr(), "aId": 96},
      {"title": "Renk sırası önemli olmalı.".tr(), "aId": 97}
    ],
    "id": 95
  },
  {
    "history":
        "Renklerin sırası ile alakalı bir mekanizma var sanırım, Profesör."
            .tr(),
    "answers": [
      {"title": "Sanmıyorum. Rastgele bir tuşa basın.".tr(), "aId": 921},
      {"title": "İlk olarak kırmızıya basın.".tr(), "aId": 97}
    ],
    "id": 96
  },
  {
    "history":
        "Sanırım, Profesör. Düğmelere gökkuşağındaki renk sırasına göre basacağız. Kırmızı, turuncu, sarı, yeşil, mavi, mor... Ama panelde turuncu ve mor yok."
            .tr(),
    "answers": [
      {"title": "Var olan renklerin sırasına göre basın.".tr(), "aId": 98},
      {"title": "Maviye basın.".tr(), "aId": 922}
    ],
    "id": 97
  },
  {
    "history":
        "Tamam, deniyoruz. Kırmızı, sarı, yeşil, mavi... Ama beyazı nereye koyacağız?"
            .tr(),
    "answers": [
      {"title": "İlk önce ona basın.".tr(), "aId": 920},
      {"title": "Beyaz tüm renkleri içerir. En sona koyun.".tr(), "aId": 99}
    ],
    "id": 98
  },
  {
    "history":
        "Anlaşıldı. Sırasıyla kırmızı, sarı, yeşil, mavi ve beyaz butonlara bastık. Kapı açıldı!"
            .tr(),
    "answers": [
      {"title": "Ne görüyorsunuz?".tr(), "aId": 100},
      {"title": "İçeriyi inceleyin.".tr(), "aId": 100}
    ],
    "id": 99
  },
  {
    "history":
        "İçerisi karanlık. Fenerlerimizi yaktık. Burası büyük bir oda, Profesör. Her yerde aynalar var! Duvarlar, tavan, hatta zemin bile aynalarla kaplı."
            .tr(),
    "answers": [
      {"title": "Sadece ayna mı?".tr(), "aId": 101},
      {"title": "Odada başka bir şey var mı?".tr(), "aId": 102}
    ],
    "id": 100
  },
  {
    "history":
        "Hayır. Büyük bir masa da var burada. Üzerinde bir projeksiyon cihazı duruyor ve yanında bir not var."
            .tr(),
    "answers": [
      {"title": "Ne yazıyor notta?".tr(), "aId": 103},
      {"title": "Oku bakalım.".tr(), "aId": 103}
    ],
    "id": 101
  },
  {
    "history":
        "Evet, ortada büyük bir masa var. Üzerinde bir projeksiyon cihazı duruyor. Ve yanında bir not."
            .tr(),
    "answers": [
      {"title": "Ne yazıyor notta?".tr(), "aId": 103},
      {"title": "Oku bakalım.".tr(), "aId": 103}
    ],
    "id": 102
  },
  {
    "history":
        "Okuyorum: 'Zihin Aynası Deneyi - 23. Gün. Sonuçlar beklenmedik yönde ilerliyor. Hastalar kendi bilinçaltlarıyla yüzleşiyor, ancak bazıları geri dönemiyor. Deneyi sonlandırmalıyız, ama... çok geç olabilir.', yazıyor."
            .tr(),
    "answers": [
      {"title": "Bu çok endişe verici.".tr(), "aId": 104},
      {"title": "Başka detaylar var mı?".tr(), "aId": 105}
    ],
    "id": 103
  },
  {
    "history":
        "Evet öyle, Profesör. Bir de burada el yazısıyla eklenmiş bir not daha var: 'Eğer bunu okuyorsanız, lütfen bizi kurtarın. Aynalara bakmayın!', yazıyor."
            .tr(),
    "answers": [
      {"title": "Bu iş daha da derinleşti şimdi.".tr(), "aId": 106},
      {"title": "Bu da ne demek?".tr(), "aId": 106}
    ],
    "id": 104
  },
  {
    "history":
        "Evet, notun altında el yazısıyla eklenmiş bir not daha var: 'Eğer bunu okuyorsanız, lütfen bizi kurtarın. Aynalara bakmayın!, yazıyor."
            .tr(),
    "answers": [
      {"title": "Bu iş daha da derinleşti şimdi.".tr(), "aId": 106},
      {"title": "Bu da ne demek?".tr(), "aId": 106}
    ],
    "id": 105
  },
  {
    "history":
        "Profesör! Aynalar! Aynalar hareket ediyor gibi! Ne yapacağız?".tr(),
    "answers": [
      {
        "title": "Gözlerinizi kapatın ve odadan çıkmaya çalışın!".tr(),
        "aId": 107
      },
      {"title": "Projeksiyon cihazını hemen çalıştırın!".tr(), "aId": 916}
    ],
    "id": 106
  },
  {
    "history":
        "Anlaşıldı! Gözlerimizi kapatıyoruz ama yönümüzü bulmak çok zor! Her yer ayna!\n\nProfesör bir şey oluy-"
            .tr(),
    "answers": [
      {"title": "Ekip?".tr(), "aId": 108},
      {"title": "Yazdıklarımı görüyor musunuz?".tr(), "aId": 108}
    ],
    "id": 107
  },
  {
    "history":
        "Profesör, bağlantı kesildi. Şimdi tekrar iletişim kurabildik.".tr(),
    "answers": [
      {"title": "Neler oldu?".tr(), "aId": 109},
      {"title": "Hepiniz iyi misiniz?".tr(), "aId": 110}
    ],
    "id": 108
  },
  {
    "history":
        "Bilmiyoruz. Bir şeyler çok yanlış. Aynalar durdu ama yansımalarımız! Çok farklılar! Ben kendimi daha yaşlı görüyorum. Sarah ise bir hastane yatağında. Bu imkansız!"
            .tr(),
    "answers": [
      {"title": "Sakin olun. Halüsinasyon olabilir.".tr(), "aId": 111},
      {"title": "Sakin olun. Odadan çıkabilir misiniz?".tr(), "aId": 111}
    ],
    "id": 109
  },
  {
    "history":
        "İyiyiz ancak bir şeyler çok yanlış. Aynalar durdu ama yansımalarımız! Çok farklılar! Ben kendimi daha yaşlı görüyorum. Sarah ise bir hastane yatağında. Bu imkansız!"
            .tr(),
    "answers": [
      {"title": "Sakin olun. Halüsinasyon olabilir.".tr(), "aId": 111},
      {"title": "Sakin olun. Odadan çıkabilir misiniz?".tr(), "aId": 111}
    ],
    "id": 110
  },
  {
    "history":
        "Hayır! Kapıyı göremiyoruz.\n\nProfesör! Yansımalarımız! Yansımalarımız bize bakıyor ve gülümsüyorlar."
            .tr(),
    "answers": [
      {
        "title":
            "Hemen gözlerinizi kapatın! Bu etki geçene kadar açmayın.".tr(),
        "aId": 112
      },
      {"title": "Sorun yok. Kapıyı bulun hemen!".tr(), "aId": 914}
    ],
    "id": 111
  },
  {
    "history":
        "Gözlerim kısık şekilde yazmak çok zor. Sesler duyuyoruz. Kendi seslerimiz bize fısıldamaya başladı."
            .tr(),
    "answers": [
      {"title": "Ne duyuyorsunuz?".tr(), "aId": 113},
      {"title": "Ne diyorlar?".tr(), "aId": 113}
    ],
    "id": 112
  },
  {
    "history":
        "'Gerçeği görmek için hazır mısın? diyorlar.' Profesör! bu deney sizinle mi ilgili?"
            .tr(),
    "answers": [
      {"title": "...".tr(), "aId": 114},
      {"title": "...".tr(), "aId": 114}
    ],
    "id": 113
  },
  {
    "history": "Profesör? Orada mısınız?".tr(),
    "answers": [
      {"title": "Evet. İtiraf vakti geldi.".tr(), "aId": 115},
      {"title": "...".tr(), "aId": 116}
    ],
    "id": 114
  },
  {
    "history": "NE? NE DEMEK BU?".tr(),
    "answers": [
      {"title": "Tamam. Her şeyi açıklıyorum.".tr(), "aId": 117},
      {"title": "İtiraf vakti.".tr(), "aId": 117}
    ],
    "id": 115
  },
  {
    "history":
        "LANET HERİF! ORADA OLDUĞUNU BİLİYORUM! CEVAP VER! NE OLUYOR!".tr(),
    "answers": [
      {"title": "Tamam. Her şeyi açıklıyorum.".tr(), "aId": 117},
      {"title": "İtiraf vakti.".tr(), "aId": 117}
    ],
    "id": 116
  },
  {
    "history": "ÇABUK OL!!! SENİ LANET OLASI!".tr(),
    "answers": [
      {
        "title":
            "Bu deney benim. Sizi oraya göndererek her şeyi düzeltebileceğimi sandım."
                .tr(),
        "aId": 118
      },
      {
        "title":
            "Bu deney benim. Sizi oraya göndererek her şeyi düzeltebileceğimi sandım."
                .tr(),
        "aId": 118
      }
    ],
    "id": 117
  },
  {
    "history":
        "NE? NASIL YANİ? BİZ DENEKLER MİYİZ?\n\nSistem Mesajı: DİKKAT! ZİHİN AYNASI PROTOKOLÜ AKTİVE EDİLDİ. TÜM KATILIMCILAR HAZIRLANDI."
            .tr(),
    "answers": [
      {"title": "Deneyi Başlat.".tr(), "aId": 909},
      {"title": "Deneyi Başlat.".tr(), "aId": 909}
    ],
    "id": 118
  },
  {
    "history":
        "Profesör, dosyaları inceledik. İçeride bir hasta listesi var. Bazılarının yanında tuhaf semboller bulunuyor."
            .tr(),
    "answers": [
      {
        "title":
            "Sembolleri not alın. Bu, onların geçmiş deneylerle ilişkisi olabilir."
                .tr(),
        "aId": 120
      },
      {
        "title":
            "Sembolleri ve listede belirtilen hastaları dikkatle inceleyin."
                .tr(),
        "aId": 120
      }
    ],
    "id": 119
  },
  {
    "history":
        "Sembolleri kaydettik, profesör. Görünüşe göre bu semboller belirli hücrelerdeki hastaları işaret ediyor. Listedeki hastalardan bazıları için 'kayboldu' notu düşülmüş. Bu durum tuhaf görünüyor."
            .tr(),
    "answers": [
      {
        "title":
            "Hastaların hücrelerine gidin, sembollerle eşleşen ipuçları olabilir."
                .tr(),
        "aId": 121
      },
      {
        "title":
            "Hastaların hücrelerinde sembollerle ilgili herhangi bir iz arayın."
                .tr(),
        "aId": 121
      }
    ],
    "id": 120
  },
  {
    "history":
        "Hasta hücrelerinde sembollerle bağlantılı notlar bulduk. Bazılarının duvarlarında çizimler var."
            .tr(),
    "answers": [
      {
        "title":
            "Bize yardımcı olabilecek herhangi bir bilgi içeriyor mu?".tr(),
        "aId": 122
      },
      {"title": "Önemli bir şey var mı?".tr(), "aId": 122}
    ],
    "id": 121
  },
  {
    "history":
        "Duvardaki çizimlerde ve notlarda ortak olan anlam veremediğimiz bir şey var.\n\n'ADIĞAŞA'\n\nBu sana bir şey çağırıştırıyor mu, Profesör?"
            .tr(),
    "answers": [
      {"title": "TERSTEN OKUYUN!".tr(), "aId": 125},
      {"title": "Şimdilik hayır. Araştırmaya devam edin.".tr(), "aId": 124}
    ],
    "id": 122
  },
  {
    "history":
        "Doğru! 'Aşağıda' yazıyor. Yerlere bakarken burda altı yığınla kaplı bir yatak bulduk. Yatağın altındakileri incelemek için kaldırdığımızda ise yuvarlak bir tahta parçasıyla karşılaştık. Profesör! Burada gizli bir geçit kapısı var."
            .tr(),
    "answers": [
      {
        "title": "Geçidi dikkatlice inceleyin, ancak hemen girmeyin.".tr(),
        "aId": 127
      },
      {"title": "Tehlikeli olabilir ama girin.".tr(), "aId": 127}
    ],
    "id": 125
  },
  {
    "history":
        "Tamam. Burada bir yatak var. Sanırım altında bir şeyler var. İncelemeye başlıyoruz Profesör."
            .tr(),
    "answers": [
      {"title": "Hepsini inceleyin ve bana rapor verin.".tr(), "aId": 126},
      {
        "title": "Yatağın altından bir şey çıkacağını sanmıyorum.".tr(),
        "aId": 126
      }
    ],
    "id": 124
  },
  {
    "history":
        "Yatağın altındakileri incelemek için kaldırdığımızda yuvarlak bir tahta parçasıyla karşılaştık. Profesör! Burada gizli bir geçit kapısı var."
            .tr(),
    "answers": [
      {
        "title": "Geçidi dikkatlice inceleyin, ancak hemen girmeyin.".tr(),
        "aId": 127
      },
      {"title": "Tehlikeli olabilir ama girin.".tr(), "aId": 127}
    ],
    "id": 126
  },
  {
    "history":
        "Profesör, geçidi açtık. Karanlık bir merdiven aşağı iniyor. Hafif bir esinti ve garip bir koku var."
            .tr(),
    "answers": [
      {
        "title": "Bu iş iyice garipleşti. Aşağıya bakın bakalım.".tr(),
        "aId": 128
      },
      {"title": "Tamam, şimdi merdivenlerden aşağıya inin.".tr(), "aId": 128}
    ],
    "id": 127
  },
  {
    "history":
        "Aşağıdayız. Demir bir kapı var fakat kilitli. Arkadaşlarım kilidi kırmaya çalışıyorlar. Duvarlarda bazı hesaplamalar ve ilaç kutuları görüyorum. Profesör burası çok garip bir yer."
            .tr(),
    "answers": [
      {"title": "Kapıyı açtığınızda bana hemen rapor verin.".tr(), "aId": 129},
      {"title": "İlaçlar çok eski olabilir, dokunmayın.".tr(), "aId": 129}
    ],
    "id": 128
  },
  {
    "history":
        "Tamam. Kapıyı açıyoruz. Oh tanrım! Profesör, burası bir laboratuvar! İçerisi çok kötü kokuyor. Arkadaşlarımdan bazıları kusmaya başladı. Her yerde tıbbi ekipmanlar var ve sedyeler! Sedyelerde insanlar var!"
            .tr(),
    "answers": [
      {"title": "Sakin. Kaç sedye görüyorsunuz?".tr(), "aId": 130},
      {"title": "Durumları nasıl?".tr(), "aId": 131}
    ],
    "id": 129
  },
  {
    "history":
        "Beş sedye sayıyorum. Üç kişi hareketsiz yatıyor. İkisi kıpırdanıyor. Profesör, bu insanlar çok kötü görünüyor. Zayıf ve solgunlar. Kollarında ve boyunlarında iğne izleri var."
            .tr(),
    "answers": [
      {
        "title": "İnsanlara yaklaşmadan önce etrafı rapor edin.".tr(),
        "aId": 132
      },
      {"title": "Herhangi bir tehlike işareti var mı?".tr(), "aId": 132}
    ],
    "id": 130
  },
  {
    "history":
        "Üç kişi hareketsiz yatıyor. İkisi kıpırdanıyor. Profesör, bu insanlar çok kötü görünüyor. Zayıf ve solgunlar. Kollarında ve boyunlarında iğne izleri var."
            .tr(),
    "answers": [
      {
        "title": "İnsanlara yaklaşmadan önce etrafı rapor edin.".tr(),
        "aId": 132
      },
      {"title": "Herhangi bir tehlike işareti var mı?".tr(), "aId": 132}
    ],
    "id": 131
  },
  {
    "history":
        "Odada kimse yok ama bir bilgisayar çalışıyor. Ekranda bir takım veriler akıyor ve bilgisayarda bir not açık. Burada ayrıca bir sesli kayıt cihazı var, ışığı yanıp sönüyor."
            .tr(),
    "answers": [
      {"title": "Sesli kaydı dinleyin.".tr(), "aId": 133},
      {"title": "Bilgisayardaki notu okuyun.".tr(), "aId": 134}
    ],
    "id": 132
  },
  {
    "history":
        "Tamam, kaydı başlatıyorum.\n\n'Deney günü 23. Denekler üzerindeki yeni serum testleri beklenmedik sonuçlar verdi. Halüsinasyonlar ve paranoya seviyeleri artıyor. İki denek... kontrol edilemez hale geldi. Karantinaya alındılar. Diğerleri hâlâ gözlem altında. Bu deneyi sonlandırmalıyız ama üstlerimiz devam etmemiz konusunda ısrarcı. Tanrı yardımcımız olsun."
            .tr(),
    "answers": [
      {"title": "Orada yasadışı deneyler yapılmış demek ki.".tr(), "aId": 135},
      {"title": "Hastaların yanına gidin.".tr(), "aId": 136}
    ],
    "id": 133
  },
  {
    "history":
        "Tamam, notu okumaya başlıyorum.\n\n'Deney günü 23. Denekler üzerindeki yeni serum testleri beklenmedik sonuçlar verdi. Halüsinasyonlar ve paranoya seviyeleri artıyor. İki denek... kontrol edilemez hale geldi. Karantinaya alındılar. Diğerleri hâlâ gözlem altında. Bu deneyi sonlandırmalıyız ama üstlerimiz devam etmemiz konusunda ısrarcı. Tanrı yardımcımız olsun."
            .tr(),
    "answers": [
      {"title": "Orada yasadışı deneyler yapılmış demek ki.".tr(), "aId": 135},
      {"title": "Hastaların yanına gidin.".tr(), "aId": 136}
    ],
    "id": 134
  },
  {
    "history":
        "Evet öyle görünüyor, Profesör. Sedyelere yaklaşıyoruz şimdi. İki hasta gözlerini açtı ama tepki vermiyorlar. Gözbebekleri aşırı genişlemiş. Nabızları çok yüksek, Profesör. Vücutları titriyor."
            .tr(),
    "answers": [
      {
        "title":
            "Onlara dokunmayın. Bilinmeyen bir maddeye maruz kalmış olabilirler."
                .tr(),
        "aId": 137
      },
      {
        "title":
            "Çevrelerinde başka bir şey görüyor musunuz? İlaç şişeleri, notlar?"
                .tr(),
        "aId": 138
      }
    ],
    "id": 135
  },
  {
    "history":
        "Tamamdır, Profesör. Sedyelere yaklaşıyoruz. İki hasta gözlerini açtı ama tepki vermiyorlar. Gözbebekleri aşırı genişlemiş. Nabızları çok yüksek, Profesör. vücutları titriyor."
            .tr(),
    "answers": [
      {
        "title":
            "Onlara dokunmayın. Bilinmeyen bir maddeye maruz kalmış olabilirler."
                .tr(),
        "aId": 137
      },
      {
        "title":
            "Çevrelerinde başka bir şey görüyor musunuz? İlaç şişeleri, notlar?"
                .tr(),
        "aId": 138
      }
    ],
    "id": 136
  },
  {
    "history":
        "Kesinlikle dokunmuyoruz. Anlaşıldı. Ne yapmamızı istersiniz? Aman Allahım! Arkadaşlarımdan biri hastaya yakından bakmak istemiş. Bir kargaşa var burada. DİĞER HASTA BANA DOĞRU KO-"
            .tr(),
    "answers": [
      {"title": "Rapor ver!".tr(), "aId": 907},
      {"title": "Ne oluyor??".tr(), "aId": 907}
    ],
    "id": 137
  },
  {
    "history":
        "Evet, her sedyenin yanında küçük bir masa var. Üzerlerinde şırıngalar ve ilaç şişeleri var. Etiketlerinde ise 'Proje DeVast - Faz 3' yazıyor. Bir de bu masanın üstünde bir kayıt cihazı var."
            .tr(),
    "answers": [
      {"title": "Dinleyin ve rapor verin.".tr(), "aId": 139},
      {"title": "Dinleyin. İpuçlarına dikkat edin.".tr(), "aId": 139}
    ],
    "id": 138
  },
  {
    "history":
        "Tamam, dinliyorum.\n\n[SES KAYDI]\n\n'Proje DeVast başarısız oldu. Serum, deneklerin sinir sistemini beklenmedik şekilde etkiledi. Aşırı duyarlılık, halüsinasyonlar ve sonrasında katatoni (katatoni: kişinin motor hareketlerinin ciddi derecede yavaşlaması veya tamamen durması durumuyla karakterize edilen bir psikiyatrik durum.). İki denek saldırganlaştı. Tanrım, üç güvenlik görevlisini öldürdüler. Onları ayrı bir hücreye kilitled-'\n\nProfesör, ses burada kesiliyor!"
            .tr(),
    "answers": [
      {"title": "Düşünmeme izin verin.".tr(), "aId": 140},
      {"title": "Hemen oradan çıkmanız gerek.".tr(), "aId": 140}
    ],
    "id": 139
  },
  {
    "history":
        "[SES KAYDI]\n\nProf- Profesör!! Biri geliyor. Koridordan ayak sesleri duyuyoruz!!!"
            .tr(),
    "answers": [
      {"title": "Kapıyı kilitleyin hemen!".tr(), "aId": 141},
      {"title": "Hemen saklanın!".tr(), "aId": 142}
    ],
    "id": 140
  },
  {
    "history":
        "PROFESÖR! YETİŞEMEDİK BİZİ YAKALADILAR. TELEFONU KIRIYORUM! SİZİ YAKALAMALARINA MÜSAADE EDEMEM."
            .tr(),
    "answers": [
      {"title": "DUR!".tr(), "aId": 906},
      {"title": "BEKLE! KİM ONLAR?".tr(), "aId": 906}
    ],
    "id": 141
  },
  {
    "history":
        "Anlaşıldı! Büyük bir dolabın arkasına geçtik. Biri kapıyı açıyor, Profesör! DURUN. İki kişi girdi içeri. Beyaz önlüklüler. Biri kadın, diğeri erkek. Hastalara doğru ilerliyorlar."
            .tr(),
    "answers": [
      {"title": "Sessiz kal.".tr(), "aId": 143},
      {"title": "Konuşmaları dinle. Rapor ver.".tr(), "aId": 143}
    ],
    "id": 142
  },
  {
    "history":
        "Tamam. Size ses kaydı atacağım.\n\n[SES KAYDI]\n\nKadın: Lanet olsun, durum kötüye gidiyor. Üçüncü faz tam bir fiyasko oldu!\n\nErkek: Sakin ol. Sadece birkaç gün daha dayanmamız gerek. Sonra tüm verileri sileceğiz.\n\nKadın: Ya hastalar? Onları ne yapacağız?\n\nErkek: Onlar için yapabileceğimiz bir şey kalmadı. Protokolü biliyorsun.\n\nEkip: Profesör, sanırım hastaları öldürmeyi planlıyorlar! Ne yapacağız?"
            .tr(),
    "answers": [
      {"title": "Hemen müdahale edin ve onları durdurun!".tr(), "aId": 144},
      {
        "title": "Bekleyin ve daha fazla bilgi toplamaya çalışın.".tr(),
        "aId": 145
      }
    ],
    "id": 143
  },
  {
    "history": "Tamam. Dışarı çıkıp müdahale edeceğiz hemen!".tr(),
    "answers": [
      {"title": "Ne oldu?".tr(), "aId": 905},
      {"title": "Son durum ne?".tr(), "aId": 905}
    ],
    "id": 144
  },
  {
    "history":
        "Hemen bilgi toplamaya çalışıyoruz Profesör. Profesör, acil durum! Erkek olan bir şırınga hazırlıyor! Aralarında şöyle bir konuşma geçti.\n\n[SES KAYDI]\n\nKadın: Gerçekten bunu yapacak mısın? Başka bir yol olmalı.\n\nErkek: Başka seçeneğimiz yok. Eğer bunlar dışarı çıkarsa, hepimiz hapsi boylarız. Hatta daha kötüsü.\n\nEkip: Profesör, adam hastalardan birine yaklaşıyor! Bir şey yapmalıyız!"
            .tr(),
    "answers": [
      {"title": "Hemen müdahale edin!".tr(), "aId": 146},
      {"title": "Son ana kadar bekleyin.".tr(), "aId": 147}
    ],
    "id": 145
  },
  {
    "history":
        "Hemen müdahale etmek için saklandığımız yerden ayrılıyoruz!".tr(),
    "answers": [
      {"title": "Ne oldu?".tr(), "aId": 904},
      {"title": "Son durum ne?".tr(), "aId": 904}
    ],
    "id": 146
  },
  {
    "history":
        "Anlaşıldı, Profesör. Adam hastaya yaklaştı. Şırıngayı kaldırdı ve.. Tanrım! Tam enjekte edecekken hasta gözlerini açtı! Aralarındaki konuşma:\n\n[SES KAYDI]\n\nKadın: John, dur! Hareket etti!\n\nJohn:İmkansız! Bu dozda hâlâ nasıl...?\n\nHasta: [Boğuk bir sesle] 'Lütfen... yardım edin...'\n\nEkip: Profesör, hasta konuştu! Ne yapmalıyız?"
            .tr(),
    "answers": [
      {"title": "Dikkatleri dağıldı. Şimdi harekete geçin!".tr(), "aId": 148},
      {"title": "Kendinizi belli edin ve onları durdurun!".tr(), "aId": 148}
    ],
    "id": 147
  },
  {
    "history":
        "Profesör, uzun uğraşlar sonucu durumu kontrol altına aldık. İki şüpheliyi etkisiz hale getirdik."
            .tr(),
    "answers": [
      {
        "title": "İyi iş çıkardınız. Hastaları güvence altına alın.".tr(),
        "aId": 149
      },
      {"title": "Harikasınız. Şimdi tıbbi yardım çağırın.".tr(), "aId": 149}
    ],
    "id": 148
  },
  {
    "history":
        "Anlaşıldı. Ambulans ve takviye ekip çağırıyoruz. Hastalar... hâlâ kritik durumda ama hayattalar."
            .tr(),
    "answers": [
      {"title": "Laboratuvardaki tüm kanıtları toplayın.".tr(), "aId": 150},
      {"title": "Önce şüphelileri sorgulayın.".tr(), "aId": 151}
    ],
    "id": 149
  },
  {
    "history":
        "Hemen başlıyoruz, Profesör. Bu arada John denen adam konuşmak istedi.\n\n[SES KAYDI]\n\nJohn:[Panik içinde] Siz anlamıyorsunuz! Bu sadece bir deney değildi. Arkasında çok daha büyük şeyler var. Eğer konuşursam, hepimiz tehlikede oluruz!"
            .tr(),
    "answers": [
      {"title": "Bu kadar mı?".tr(), "aId": 152},
      {"title": "Diğer şüpheli kadın ne diyor?".tr(), "aId": 153}
    ],
    "id": 150
  },
  {
    "history":
        "Hemen başlıyoruz, Profesör. Bu arada John denen adam konuşmak istedi.\n\n[SES KAYDI]\n\nJohn:[Panik içinde] Siz anlamıyorsunuz! Bu sadece bir deney değildi. Arkasında çok daha büyük şeyler var. Eğer konuşursam, hepimiz tehlikede oluruz!"
            .tr(),
    "answers": [
      {"title": "Bu kadar mı?".tr(), "aId": 152},
      {"title": "Diğer şüpheli kadın ne diyor?".tr(), "aId": 153}
    ],
    "id": 151
  },
  {
    "history":
        "Şimdilik bu kadar. Profesör, bu adam neyden bahsediyor? Daha büyük bir komplo mu var?"
            .tr(),
    "answers": [
      {
        "title": "John'u dinleyin ama söylediklerini hemen kabul etmeyin.".tr(),
        "aId": 154
      },
      {
        "title": "Bilmiyorum. Kanıt toplamaya ve dinlemeye devam edin.".tr(),
        "aId": 154
      }
    ],
    "id": 152
  },
  {
    "history":
        "Konuşmadı. Çok garip. Profesör, bu adam neyden bahsediyor? Daha büyük bir komplo mu var?"
            .tr(),
    "answers": [
      {
        "title": "John'u dinleyin ama söylediklerini hemen kabul etmeyin.".tr(),
        "aId": 154
      },
      {
        "title": "Bilmiyorum. Kanıt toplamaya ve dinlemeye devam edin.".tr(),
        "aId": 154
      }
    ],
    "id": 153
  },
  {
    "history":
        "Anlaşıldı, Profesör.\n\n[SES KAYDI]\n\nJohn, neyden bahsediyorsun? Arkasında kim var?\n\nJohn: [Endişeli bir sesle] Sadece bir araştırma değildi bu. Hükümetin gizli bir projesi. İnsan zihnini kontrol etmek ve süper askerler yaratmak için akıl hastalarını kullanıyorlar! Ama kontrolden çıktı. Bazı denekler beklenmedik yetenekler geliştirdi.\n\nEkip: Ne tür yetenekler?\n\nJohn: Telekinezi, düşünce okuma... Ama yan etkileri korkunçtu. Çoğu deneğin zihni parçalandı. Diğerleri ise tehlikeli hale geldi.\n\nKadın: John, sus! Bizi öldürecekler!\n\nProfesör, bu iddialar çok ciddi. Ne yapmalıyız?"
            .tr(),
    "answers": [
      {"title": "İşin içinde hükümet varmış demek.".tr(), "aId": 155},
      {"title": "Bunlar sadece iddia. Şüpheci kalın.".tr(), "aId": 155}
    ],
    "id": 154
  },
  {
    "history":
        "Profesör! Burada elektrikler kesildi! Bir şey oluyor! Patlama sesleri geliyor!\n\n[SES KAYDI]\n\nJohn: İşte geldiler! Bizi susturmaya geldiler!\n\nProfesör, şimdi ne yapacağız? Binayı tahliye mi edelim yoksa burada mı kalalım?"
            .tr(),
    "answers": [
      {
        "title": "Hemen binayı hastalar ve şüphelilerle tahliye edin!".tr(),
        "aId": 156
      },
      {
        "title": "Bulunduğunuz yerde kalın ve savunma pozisyonu alın.".tr(),
        "aId": 157
      }
    ],
    "id": 155
  },
  {
    "history":
        "Anlaşıldı! Hastaları taşımaya başlıyoruz. John ve diğer şüpheli de bizimle geliyor. Ama Profesör, koridordan sesler geliyor!\n\n[SES KAYDI]\n\nJohn: Çok geç bizi buldular."
            .tr(),
    "answers": [
      {"title": "Sadece kaçın.".tr(), "aId": 902},
      {"title": "Alternatif bir çıkış yolu bulun.".tr(), "aId": 158}
    ],
    "id": 156
  },
  {
    "history": "Tamam, Profesör. Söylediğinizi yapacağız.".tr(),
    "answers": [
      {"title": "Ne oldu?".tr(), "aId": 903},
      {"title": "Son durumu rapor verin!".tr(), "aId": 903}
    ],
    "id": 157
  },
  {
    "history":
        "[SES KAYDI]\n\nEkip: John! Başka bir çıkış var mı?\n\nJohn: Evet, acil durum tüneli! Laboratuvarın arkasında gizli bir geçit var.\n\nEkip: Anlaşıldı. Hızlıca hareket ediyoruz. Hastaları ve kanıtları alıyoruz.\n\nGeçidi bulduk, Profesör. Karanlık bir tünele açılıyor. Arkamızdan silah sesleri duyuyoruz!"
            .tr(),
    "answers": [
      {"title": "Hemen girin!".tr(), "aId": 159},
      {"title": "Peşinizdekiler yaklaşıyor! HIZLI OLUN!".tr(), "aId": 159}
    ],
    "id": 158
  },
  {
    "history":
        "Tünele girdik. Zar zor ilerliyoruz. İçerisi çok dar. Çıktığımızda tekrar yazacağım."
            .tr(),
    "answers": [
      {"title": "Bekliyorum.".tr(), "aId": 160},
      {"title": "Çabuk olun.".tr(), "aId": 160}
    ],
    "id": 159
  },
  {
    "history": "Dışarı çıktık. Ormandayız, Profesör. Etraf çok sessiz.".tr(),
    "answers": [
      {"title": "Tetikte olun. Uzaklaşın oradan.".tr(), "aId": 161},
      {"title": "Hemen güvenli bir bölgeye geçin.".tr(), "aId": 161}
    ],
    "id": 160
  },
  {
    "history":
        "[SES KAYDI]\n\nProfesör! Üzerimizde helikopterler var. Silahlı adamlar bizi çevrelemeye başladı!"
            .tr(),
    "answers": [
      {"title": "Teslim olmak zorundasınız.".tr(), "aId": 901},
      {"title": "Kanıtları koruyun.".tr(), "aId": 901}
    ],
    "id": 161
  },
  {
    "history":
        "Hükümet Askeri: Hepiniz gözaltına alınıyorsunuz. Bu olay hiçbir zaman yaşanmadı. Anlıyor musun Profesör?\n\n(6 Ay Sonra)\n\nHaber Spikeri: 'Bugün şok edici bir gelişme yaşandı. Aylardır kayıp olan bir araştırma ekibinin üyeleri, beklenmedik bir şekilde ortaya çıktı. Ekip üyeleri, yaşadıkları olaylar hakkında hiçbir şey hatırlamadıklarını iddia ediyor. Ancak, anonim bir kaynaktan sızan belgeler, büyük bir skandalı işaret ediyor. Hükümet yetkilileri ise tüm iddiaları reddediyor...'\n\nAnonim: 'İşimiz henüz bitmedi, Profesör. Gerçek yakında ortaya çıkacak :)'"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 901
  },
  {
    "history":
        "(Ekip hükümet tarafından yakalandı. Mesajlaşmaları gören hükümet seni de yakaladı.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 902
  },
  {
    "history":
        "(İçeri giren askerler ekibi etkisiz hale getirdi.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 903
  },
  {
    "history":
        "(Erkek onlara dönük olduğu için silahla etkisiz hale getirildiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 904
  },
  {
    "history":
        "(Erkek onlara dönük olduğu için silahla etkisiz hale getirildiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 905
  },
  {
    "history": "(BAĞLANTI KOPTU...)".tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 906
  },
  {
    "history":
        "(HASTALAR EKİBİ ETKİSİZ HÂLE GETİRDİ.)\n\n(BAĞLANTI KOPTU...)".tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 907
  },
  {
    "history":
        "[SON]\n\n(Profesör, bulguları kontrol ederek basına bildirdi. Bu olayın açığa çıkması hükümetin hiç hoşuna gitmese de yurtdışından Profesöre gerçekleri ortaya çıkardığı için övgüler yağdı.)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 908
  },
  {
    "history":
        "(BAĞLANTI KESİLDİ.)\n\n(ZİHİN AYNASI DENEYİ BAŞLATILDI...)".tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 909
  },
  {
    "history":
        "(Ekipten bütün istediklerini alan tarihçiler ekibi etkisiz hale getirdiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 910
  },
  {
    "history":
        "(Ekipten bütün istediklerini alan tarihçiler ekibi etkisiz hale getirdiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 911
  },
  {
    "history":
        "(Ekipten bütün istediklerini alan tarihçiler ekibi etkisiz hale getirdiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 912
  },
  {
    "history":
        "(Ekip o saatten sonra yazmadı.)\n\n(Etkisiz hâle getirildiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 913
  },
  {
    "history":
        "(Ekip hipnozdan dolayı akli dengelerini kaybetti.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 914
  },
  {
    "history":
        "(Ekip o saatten sonra yazmadı.)\n\n(Etkisiz hâle getirildiler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 915
  },
  {
    "history":
        "(Hem projeksiyon cihazının ışığı hem de aynaların hareketi ekibin başlarını döndürdü ve her yere çarptılar. Hepsi kırılan aynalardan dolayı kan kaybından öldüler.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 916
  },
  {
    "history":
        "(Ekibi geri çektiniz.\n\n(Olayı çözemediniz.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 917
  },
  {
    "history":
        "(Ekibi geri çektiniz.)\n\n(Olayı çözemediniz.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 918
  },
  {
    "history": "(Ekip radyasyondan dolayı öldü.)\n\n(BAĞLANTI KOPTU...)".tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 919
  },
  {
    "history":
        "(Yanlış tuşa basıldı! Düzeneğin arkasında bulunan patlayıcı patladı.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 920
  },
  {
    "history":
        "(Yanlış tuşa basıldı! Düzeneğin arkasında bulunan patlayıcı patladı.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 921
  },
  {
    "history":
        "(Yanlış tuşa basıldı! Düzeneğin arkasında bulunan patlayıcı patladı.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 922
  },
  {
    "history":
        "(Ekip geri döndü.)\n\n(Olayı çözemediniz.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 923
  },
  {
    "history":
        "(Keşfi iptal ettiniz.)\n\n(Ekip geri döndü, dosya gizemiyle kapandı.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 924
  },
  {
    "history":
        "(Görevi iptal ettiniz.)\n\n(Ekibi yasaklı bölgeden çektiniz. Paranormal olaylar gizemini koruyor.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 925
  },
  {
    "history":
        "Çok geç! Ekibime söyleyemeden hepsi yere yığıldı profesör. ORDA! Tam karşımda maskeli bir asker var...\n\n(Bir daha iletişim kurulamadı muhtemelen asker tarafından vuruldu.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 926
  },
  {
    "history":
        "Profesör... bu gerçek mi? Gerçekten bizi buraya bir deney için mi getirdiniz? Sadece birer piyon muyduk? Buradan kurtulmanın bir yolu yok mu? Kameralardan kaçış yok gibi görünüyor... Ne yapacağız? Bu gaz... başımız dönmeye başladı... Profesör, lütfen bize yardım edin!\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 927
  },
  {
    "history":
        " Profesör, bir şeyler ters gidiyor... Gaz veriliyor! Havada yoğun bir kimyasal koku var. Gözlerimiz ağırlaşıyor, hareket edemiyoruz. Bu... bir tuzak mıydı? Ekranda bir mesaj belirdi şu an: 'Deneyler başlıyor.' ŞİMDİ ANLADIM. Biz sadece birer piyonduk. Karanlık madde deneyleri için burada olduğumuzu çok geç fark ettik. Bizi bilerek buraya çektin!\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 928
  },
  {
    "history":
        "(Gizli askeri laboratuvarın müdürü olduğunuz için yeni denekler olarak ekibinizi kullandınız ve askerler ekibinizi etkisiz hale getirdi.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 929
  },
  {
    "history":
        "(Dosyanın gizemini çözebilecek detayları bırakıp görevi iptal ettiniz. Ekibinizin ruh sağlığı bozuldu ve dosyayı kapatmak zorunda kaldınız.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 930
  },
  {
    "history":
        "(Keşfi iptal ettiniz. Dosya hala gizemini koruyor fakat görevden alındınız ve yetkinliğinizi kaybettiniz.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 931
  },
  {
    "history":
        "Profesör! Polisler beni götürüyorlar! Lütfen ekibimi bulun, kimse sizin peşinize düşmeden. Sohbeti siliyorum yoksa sizi de yakalayacaklar!\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 932
  },
  {
    "history":
        "(Bir anda parazitlenen şebeke önemli bir mesajı görmene engel oldu ve ekibe bir daha ulaşamadın.)\n\n(BAĞLANTI KOPTU...)"
            .tr(),
    "answers": [
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0},
      {"title": "Hikayeyi Yeniden Başlat.".tr(), "aId": 0}
    ],
    "id": 933
  },
];
