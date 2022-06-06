import 'package:flutter/material.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';

class KullanimPage extends StatelessWidget {
  const KullanimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Kullanım Koşulları',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Text(
                  "Uygulama ve İlgili Şartlar \nİndirdiğiniz Uygulamanın sürümüne bağlı olarak, bu Uygulama Şartları AppleIın veya Google Android’in şartlar ve koşullarını ve gizlilik politikalarını (“Platform Şartları”) içerir. Bu Uygulama Şartları ile Platform Şartları arasında herhangi bir çakışma olursa, bu Uygulama Şartları geçerli olacaktır. \nZaman zaman bu Uygulama Şartlarını değiştirebiliriz. Tarafımızdan yapılan değişikliklerin farkında olduğunuzdan emin olmak için lütfen bu Uygulama Şartlarını düzenli olarak kontrol edin. Bu uygulamayı kullanmaya devam ederseniz, bu tür varyasyonları kabul etmiş sayılırsınız. Bu tür varyasyonları kabul etmiyorsanız, Uygulamayı kullanmamalısınız.",
                ),
                Text(
                    "\nUygulamanın Kullanımı \nMentor Wise bu vesileyle Uygulamayı kişisel, ticari olmayan kullanımınız için ve geçerli Platform Koşullarının izin verdiği şekilde ve yalnızca bir Apple veya Android cihazında (“Cihaz”) kullanmanız için münhasır olmayan, devredilemez, iptal edilebilir bir lisans verir, bu Uygulama Şartları ile ('Kullanıcı Lisansı'). App diğer tüm hakları Mentor Wise tarafından saklıdır. Bu Uygulama Şartlarını ihlal etmeniz durumunda, Kullanıcı Lisansını derhal feshetme hakkına sahip olacağız. \nMobil ağ sağlayıcınız ('Mobil Sağlayıcı') ile yaptığınız sözleşmenin Uygulamayı kullanımınız için geçerli olacağını kabul edersiniz. Uygulamanın belirli özelliklerini veya oluşabilecek üçüncü taraf ücretlerini kullanırken Mobil Hizmet Sağlayıcı tarafından veri hizmetleri için ücretlendirilebileceğinizi kabul edersiniz ve bu tür ücretler için sorumluluk kabul edersiniz. Uygulamaya erişmek için kullanılan Cihazın fatura ödeyicisi değilseniz, Uygulamayı kullanmak için fatura ödeyiciden izin almış olduğunuz varsayılır. \nUygulamayı kullanımınızla bağlantılı olarak Apple veya Google (veya başka herhangi bir üçüncü taraf) tarafından sağlanan hizmetleri kullandığınızda, Apple'ın, Google'ın (veya ilgili üçüncü tarafın) hüküm ve koşullarına ve gizlilik politikasına tabi olacağınızı ve bu tür şartları okuduğunuzdan emin olmalısınız."),
                Text(
                    "\nYasaklı Kullanımlar \nUygulamayı şu şekilde kullanmamayı kabul edersiniz:\n- Yasadışı veya yetkisiz; \n- Herhangi bir kişinin hakareti;\n-Müstehcen veya saldırgan;\n-Irk, cinsiyet, din, milliyet, engellilik, cinsel yönelim veya yaşa dayalı ayrımcılığı teşvik eder;\n- Herhangi bir kişinin telif hakkını, veri tabanı hakkını veya ticari markasını ihlal etmek;\n- Bir kişiyi taciz etme, üzme, utandırma, alarm verme veya rahatsız etme olasılığı;\n-Hizmetimizi herhangi bir şekilde bozması muhtemeldir; veya(yalnızca örnek olarak) telif hakkı ihlali veya bilgisayarın kötüye kullanılması gibi yasa dışı eylemleri savunur, teşvik eder veya yardımcı olur.\nTazminat\nBu Uygulama Şartlarının herhangi bir ihlali için Mentor Wise’ ı tazmin etmeyi kabul edersiniz. Mentor Wise, bu Uygulama Koşulları kapsamında Mentor Wise’ ı tazmin ettiğiniz herhangi bir üçüncü taraf talebinin savunmasını ve çözümünü kontrol etme hakkını saklı tutar ve bu hakların kullanılmasında bize yardımcı olursunuz."),
                Text(
                    "\nSöz vermiyorum \nMentor Wise, açık veya zımni herhangi bir vaat veya beyanda bulunmaksızın Uygulamayı 'olduğu gibi' ve 'kullanılabilir' temelinde sağlar. Özellikle Mentor Wise, Uygulamanın veya içeriğinin geçerliliği, doğruluğu, güvenilirliği veya kullanılabilirliği konusunda herhangi bir beyanda bulunmaz. \nGeçerli yasaların izin verdiği azami ölçüde, Mentor Wise, Uygulamanın amaca uygun, tatmin edici nitelikte, hak ihlalinde bulunmayan, kusurlardan arınmış olduğu herhangi bir söz dahil olmak üzere, açık veya zımni tüm vaatleri hariç tutar. Uygulamanın sizin tarafınızdan kullanımının yasalara uygun olduğunu veya bu Uygulama ile bağlantılı olarak ilettiğiniz herhangi bir bilginin başarılı, doğru veya güvenli bir şekilde iletileceğini kesintisiz olarak belirtir."),
                Text(
                    "\nMentor Wise Sorumluluğunun Dışlanması \nBu Uygulama Koşullarındaki hiçbir şey, Mentor Wise’ ın ihmali ve sahtekarlığı veya başka herhangi bir yükümlülüğü nedeniyle ortaya çıkan yükümlülüğünü, hukuk meselesi olarak dışlanamayacak veya sınırlandırılamayacak ölçüde dışlamaz veya herhangi bir şekilde sınırlamaz. \nGeçerli yasalar uyarınca izin verilen azami ölçüde, hiçbir durumda Mentor Wise Uygulamanın kullanımı ile ilgili olarak size karşı sorumlu olmayacak ve / veya herhangi bir doğrudan, dolaylı, özel veya sonuçta ortaya çıkan yanlış bilgi için size karşı yükümlü olmayacaktır. Bu Uygulama Koşulları Türkiye yasalarına tabidir ve taraflar, bu Uygulama Koşulları kapsamında veya bu Uygulama Koşulları ile bağlantılı olarak ortaya çıkan anlaşmazlıkları çözmek için Türkiye mahkemelerinin münhasır yargı yetkisine tabidir. \nBu Uygulama Koşullarının herhangi bir hükmünün (veya hükmünün bir kısmının) yetkili bir mahkeme veya yetkili makam tarafından geçersiz, uygulanamaz veya yasadışı olduğu tespit edilirse, bu süre, şart veya hüküm kalan koşullardan ayrılacaktır, yasaların izin verdiği ölçüde geçerli olmaya devam edecek koşullar ve hükümlerdir."),
                Text("\nBize Ulaşın \nApp ile ilgili herhangi bir sorunuz varsa, bize e-posta gönderebilirsiniz: bootcamp161@gmail.com ")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
