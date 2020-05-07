# README

Projeyi denemek icin oncelikle https://gorails.com/setup adresinden isletim
sisteminize uygun sekilde rbenv ve ruby ortamini kurmaniz gerekmektedir.


Daha sonra aynı yerden 'Configuring Git' ve 'Rails' kısmını atlayarak Postgresql database'i kurmamız gerekmektedir

Daha sonra bash ile projenin ana dizininde sırasıyla su komutları çalıştırıyoruz
```
bundle
rails db:create
rails db:migrate
rails server
```
Bütün adımları tek tek yaparak ilerlerseniz aradaki hataların (Genelde güncel olmayan paket hataları) nasıl çözüldüğü hatayla birlikte verilmekte onları çözerek ilerlerseniz düzgün bir şekilde sonuca ulaşabiliriz.

Eğer rails server adımına geldiyseniz ve yazdığınızda

=> Booting Puma
=> Rails 6.0.2.1 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.1 (ruby 2.6.5-p114), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://127.0.0.1:3000
* Listening on tcp://[::1]:3000

benzer bir ekran geldiyse artık browser'a girip 'localhost:3000' yazarak siteye ulaşabilirsiniz



Adim 2

Ilk olarak sifreleme algoritmalarini iceren bir kutuphane olan openssl'i kurmak icin
`bundle install` yaziyoruz dosya dizininde bulunan bir bash'te

Sonra database de degisiklik yaptigimiz icin `rails db:migrate` yaziyoruz artik sistem hazir serverimizi tekrar baslatip
devam edebiliriz.

Mail gonderme ekranina artik bir alan daha geldi eger bu alan doldurulursa
aes-256-cbc algoritmasina gore girdiginiz keye gore mailler sifrelenecek ve
alici keyi bilmiyor ise okuyamayacaktir.

Sabit kullanilan bir anahtar bulunmamaktadir gonderici anahtari kendisi belirlemektedir.

Anahtari kullanmak icin maili goster dediginizde onunuze cikan alana keyi girip formu
submitlediginizde mesaj cozulu halde size gosterilecektir.



Adim 3

Oncelikle yeni gelen özellikler için şu komutları sırasıyla çalıştırıyoruz

```shell script
bundle install
rails db:migrate
```

Daha sonra serverımızı durdurup yeniden başlatıyoruz. `rails s`
Browserımızdan `localhost:3000` linkine gidip login oluyoruz.
Eğer daha önce random 5 email oluşturulmamışsa veya databaseinizde
mevcut değilse (mailler silinirse) keyi title'ına iliştirilmiş 5 random mail üretir.

Ayrıca ana sayfada yer alan 'Compare Mails' linki ile 2 mailin adresini ve şifrelenmiş
keylerini girerek maillerin içeriklerini ve checksumlarını karşılaştırabilirsiniz.

Son olarak oluşturulmuş bir maili checksumı işaretlemeden içeriği güncellerseniz checksomlar eşleşmez


Adim 4 - 5 - 6

Ilk olarak yeni gelen paketler ve migration dosyalari icin `bundle` ve `rails db:migrate` ve daha sonnrasinda `rails db:reset` calistiriyoruz
Daha sonra 4. gorevin bolumunu incelemek icin yeni bir mail formuna gidiyoruz. sayfada da goruldugu gibi pkey rsa kullanilsin diye bir secenek
bulunmakta eger onu secerseniz mail private keye gore imzalanip public keye gore cozumlenebilen bir yapi maile dahil oluyor. Lakin karsidaki
kullanici sizin public keyinizi bilmek durumunda dir bunun icinde gecici sureligine bu public keyi cosole da bastirdik.

5. Adimda gerceklestirmemiz gereken gorev icin ruby de bir steganography kutuphanesi bulamadigim icin sadece watermark kism bulunmakta.
Onuda mail gonderirken sececeginiz ilk ana resim ve watermark resimiyle gerceklestirebilmektesiniz.

6. adimin gorevide aradaki adam ve brute force saldirisina karsi two step authentication uygulandi.
Bu sekilde verification kodu surekli degistigi icin bruteforce saldirisi da bir o kadar etkisiz kalacaktir. Ayrica herhangi bir sms api i kullanmamak icin su anda sms koduu cosole a basmaktadir.
