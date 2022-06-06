import 'package:flutter/material.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import '../utilities/icon_utilities.dart';

class GizlilikPage extends StatefulWidget {
  const GizlilikPage({Key? key}) : super(key: key);

  @override
  State<GizlilikPage> createState() => _GizlilikPageState();
}

class _GizlilikPageState extends State<GizlilikPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Gizlilik Sözleşmesi',
            style: baslikStyleBold,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: backButton()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Gizlilik Politikası ve Kullanım Koşulları \nBurada belirtilen gizlilik politikası ve kullanım koşulları; MENTOR WİSE’ ın Google Play Store ve IOS App Store' da yayınlanan bütün mobil uygulamaları için geçerlidir. Bu uygulamaları mobil cihazınıza yükleyerek, bu metinde yer alan gizlilik politikasını ve kullanım koşullarını kabul etmiş sayılırsınız. Bu koşulları kabul etmiyorsanız bu uygulamaları mobil cihazınıza yüklemeyiniz."),
                Text("\nUygulamalarımızda, Girilen Veriler şifreli sunucularda sadece sizlerin görebileceği şekilde depolanır ve 3. şahıs ya da kurumlar ile paylaşılmaz."),
                Text("\nTelefon Kullanım izinleri, uygulamımızda bulunan kısayol arama işlemi için gerekli olan izinlerin tarafınızdan sağlanmış olması gerekir. Verilen bu izin sadece uygulamada kayıtlı olan müşterilerinizin kısayol aramalarında kullanılmaktadır ve müşterilerinize ait kişisel veriler sadece size özel veri tabanlarında şifreli olarak saklanır."),
                Text("\nİnternet Kullanım izinleri, uygulamımızdan verilerin şifreli sunuculara gönderilebilmesi için gerekli olan izindir ve kullanıcıların bunu tanımlaması gerekir. Bu izinler telefonunuzdan isteğiniz dışında bir bilgiyi transfer etmek için kullanılmaz. Verilen internet erişim izni sadece uygulama içerisinde dolduracağınız formlara ait veri ve fotoğraf transferi için kullanılmaktadır."),
                Text("\nKamera Kullanımı: Mobil Uygulamalarımızda kamera kullanımı sadece uygulama içerisinden çekilen fotoğraflar ve mentorlerimizle görüntülü konuşmalar için kullanılmaktadır. Kullanıcı bilgisi dışında kullanımı söz konusu değildir. Mobil uygulamada çekilen fotoğraflar ve yapılan görüntülü görüşmeler kullanıcıya ait şifreli ortamda saklanır ve sadece kendisinin ve bağlı olduğu kurumun erişimine açıktır. Fotoğraflar 3. şahıs ya da kurumlar ile kullanıcı bilgisi dışında paylaşılmaz."),
                Text("\nUygulamalarımız, size ait herhangi bir kişisel bilgiyi toplamaz ve sizden bu yönde bir talepte bulunmaz."),
                Text("\nMENTOR WİSE, kaliteli ve yararlı uygulamalar yayınlamak için her zaman gereken özeni ve duyarlılığı gösterecektir. Buna rağmen, uygulamalarımızda yer alan içeriklerin beklentilerinizi karşılayacağı, size yararlı olacağı veya kesin doğru bilgiler içereceğine dair hiçbir taahhütte bulunmamaktayız. Uygulamaları olduğu gibi sunmaktayız. Bu sebeple, uygulamalarımızdan kaynaklı yaşanacak herhangi bir olumsuz durum için MENTOR WİSE’ ın sorumlu tutamayacağınızı kabul etmektesiniz. "),
                Text("\nMENTOR WİSE, bu uygulamaların güvenliği konusunda alınabilecek tüm önlemleri almak için gereken ölçüde çaba sarf eder ve Google Play Geliştirici Programı Politikaları sözleşmesi kapsamındaki yükümlülüklerini yerine getirir. Bununla birlikte; internet ve dijital ortamlar yeterli düzeyde güvenli alanlar değildir. Bu yüzden size yüzde yüz güvenli bir hizmet sunacağımız konusunda herhangi bir garantide bulunmamaktayız. Uygulamalarımız sadece Google Play Store ve IOS App Store'da yer almaktadır. Bu uygulamaların bizim bilgimiz dışında başka bir android ya da IOS mağazasında yer alması durumunda, buradan yapılacak yüklemelerden MENTOR WİSE sorumlu tutulamaz."),
                Text("\nBu uygulamalarda, üçüncü taraflara ait reklamlar ve linkler yer alabilir. Bu üçüncü taraflara ait reklamların ve linklerin niteliğinden, içeriğinden, güvenliğinden veya bunlardan kaynaklı oluşabilecek zararlardan MENTOR WİSE’ ı sorumlu tutamayacağınızı kabul etmektesiniz. Google tarafından yayınlanan reklamlara ilişkin ayarlarınızı nasıl düzenleyeceğinizi, reklam ayarları sayfasından öğrenebilirsiniz."),
                Text("\nBu uygulamalarda yer alan sesli, yazılı ve görsel öğelerden ve yazılımlardan oluşan bütün içeriğe ilişkin her türlü telif hakkı MENTOR WİSE’ a aittir. Herhangi bir uygulamamızı veya bu uygulamaların telif haklarıyla korunan içeriğini; kopyalama, çoğaltma, yeniden yayımlama, parçalarına ayırma, tekrar kamuya sunma vb. eylemlerde bulunmayacağınızı kabul etmektesiniz."),
                Text("\nBurada belirtilen koşullarla ilgili görüş ve önerilerinizi, bootcamp161@gmail.com mail adresinden bize iletebilirsiniz."),
                Text("\nMENTOR WİSE; bu Gizlilik Politikası ve Kullanım Koşulları metninde değişiklik yapabilir. Yapılan değişiklikler anında yürürlüğe girecektir. Değişiklik yaptığımız tarihi, son güncelleme tarihi olarak en alt kısımda belirtiriz. "),
                Text("\nSon güncelleme tarihi: \n05.06.2022")
              ],
            ),
          ),
        ),
      ),
    );
  }
}