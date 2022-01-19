import 'package:flutter/material.dart';
import 'package:fsk/domain/motorkasar/motorkasar.dart';
//import 'home.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderMotorKasar extends StatefulWidget {
  @override
  _IntroSliderMotorKasarState createState() => _IntroSliderMotorKasarState();
}

class _IntroSliderMotorKasarState extends State<IntroSliderMotorKasar> {
  List<Slide> slides = List<Slide>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      new Slide(
        title: "Penilaian Aktiviti Kehidupan Harian Kanak-Kanak",
        description: " ",
        // pathImage: "assets/(ori)use.png",
      ),
    );
    slides.add(
      new Slide(
        title: " ",
        description:
            "Penilaian ini merangkumi item di bawah domain aktiviti \nkehidupan harian kanak-kanak berumur 0 hingga 6 tahun. \nItem yang disenaraikan di bawah merupakan antara kemahiran yang secara umumnya sudah boleh dijalankan \natau sudah mula muncul dalam skala kemahiran kanak-kanak pada tahap usia yang dinyatakan. \nArahan: Ibu bapa/penjaga diminta untuk menilai kemahiran/keupayaan anak dan meletakkan indikasi pada ruangan “Tanda” berdasarkan indikasi yang disenaraikan dibawah.",
        // pathImage: "assets/(ori)use.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Indikasi ",
        centerWidget: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.white, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: [
                Text('Indikasi', style: TextStyle(fontSize: 20.0))
              ]),
              Column(children: [
                Text('Butiran', style: TextStyle(fontSize: 20.0))
              ]),
              // Column(children: [
              //   Text('Review', style: TextStyle(fontSize: 20.0))
              // ]),
            ]),
            TableRow(children: [
              Column(children: [Text('/')]),
              Column(children: [Text('Capai')]),
              //Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('X')]),
              Column(children: [Text('Belum tercapai')]),
              //Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('-')]),
              Column(children: [Text('Tidak Pasti/Tidak Dapat Dinilai')]),
              //Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('TB')]),
              Column(children: [Text('Tidak Berkenaan')]),
              //Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('DEF')]),
              Column(children: [Text('default')]),
              //Column(children: [Text('5*')]),
            ]),
          ],
        ),
        //widgetTitle: Text("Indikasi"),

        description: " ",
        // pathImage: "assets/(ori)use.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List.empty(growable: true);
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  //            child: Image.asset(
                  //                currentSlide.pathImage!,
                  //                matchTextDirection: true,
                  //                height: 60,
                  ////                 ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title!,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 10,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
                Container(child: currentSlide.centerWidget),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Color(0XFF40E0D0),
      renderSkipBtn: Text(
        "Skip",
        style: TextStyle(color: Colors.white),
      ),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(color: Colors.white),
      ),
      renderDoneBtn: Text(
        "Done",
        style: TextStyle(color: Colors.white),
      ),
      colorDot: Colors.white,
      colorActiveDot: Colors.amber,
      sizeDot: 8.0,
      showDoneBtn: true,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      showDotIndicator: true,

      //shouldHideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => soalanmotorkasar(),
        ),
      ),
    );
  }
}
