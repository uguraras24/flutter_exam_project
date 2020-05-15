import 'package:flutter/material.dart';
import 'package:flutterexamproject/interfacepages/drawer.dart';

class Help extends StatefulWidget {
  @override
  HelpPageState createState() {
    // TODO: implement createState
    return new HelpPageState();
  }
}

class HelpPageState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.red, //change your color here
            ),
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/sss.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(elemanlar()),
          ),
        ],
      ),
    );
  }

  List<Widget> elemanlar() {
    List<String> questions = List();
    List<String> answers = List();
    questions.add("Sinavım Nedir");
    questions.add("Sinavim Uygulamasını Nasıl Kullanırım");
    questions.add("Sinavim Uygulamasını Kimler Kullanabilir");
    questions.add("Sınavlara nasıl katılabilirim");
    questions.add("Sınav sonuçlarımı ne zaman öğrenebilirim");
    questions.add("Exam Coin nasıl satın alabilirim");
    questions.add("Exam Coin nedir");
    questions.add("Program Coin nedir");
    questions.add("Nasıl Ders Programı oluşturabilirim");
    questions.add("Çekilişlere Nasıl Katılabilirim");
    questions.add("Cekilişi Kazandım ödülümü nasıl alabilirim");

    answers.add(
        "Sinavım Uygulaması tüm kullanıcılarının online sınavlara aynı andağa girdiği yardımcı bir uygulamadır");
    answers.add(
        "Sınavlarım ekranından kendine uygun sınava katılarak sınav zamanı burada olman yeterli");
    answers.add(
        "Uygulamayı kullanmak için bir kısıtla yoktur,sınava hazırlanan herekes aramııza katılabilir");
    answers.add(
        "ExamCoinnin olduğu sürece kendine uygun sınavım yanında ki KATIL butonu ile katılabilirsin");
    answers.add(
        "Sınav için belirtilen süre biter bitmez değerlendirmeye başlayım yaklaşık 2 saat içinde açıklamayı hedefliyoruz");
    answers.add(
        "Profil ekranından ExamCoin altında ki + simgesine tıklayarak satın alma ekranına ulaşabilirsiniz");
    answers
        .add("Sınavlara katılabilmeniz için gerekli hak miktarınızı belirtir");
    answers.add(
        "Sınav sonuçlarınıza göre size bir ders programı hazırlama hak miktarınızı belirtir");
    answers.add("Şimdilik aktif değildir yakında hizmetinizde olacaktır");
    answers.add(
        "İnstagramdan bizi takip ederek çekiliş detaylarına ulaşabilirsiniz");
    answers.add(
        "Çekiliş ekranından kullanıcı adınız yayınlandığı taktirde size ulaşacağız");

    return [
      for (int i = 0; i < questions.length; i++)
        elemanlaralt(questions[i], answers[i]),
    ];
  }

  Widget elemanlaralt(qs, as) {
    return ExpansionTile(
      title: Text(
        qs,
        style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold
        ),
      ),
      children: <Widget>[
        Container(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                as,
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
