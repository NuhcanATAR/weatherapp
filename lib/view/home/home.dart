import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:carousel_slider/carousel_slider.dart';

// routers page
import 'package:weatherapp/theme/theme.dart';
import 'package:weatherapp/view/citys/ankara/ankara_mincard.dart';
import 'package:weatherapp/view/citys/ankara/ankara_slidercard.dart';
import 'package:weatherapp/view/citys/antalya/antalya_mincard.dart';
import 'package:weatherapp/view/citys/antalya/antalya_slidercard.dart';
import 'package:weatherapp/view/citys/bursa/bursa_mincard.dart';
import 'package:weatherapp/view/citys/bursa/bursa_slidercard.dart';
import 'package:weatherapp/view/citys/canakkale/canakkale_mincard.dart';
import 'package:weatherapp/view/citys/canakkale/canakkale_slidercard.dart';
import 'package:weatherapp/view/citys/erzurum/erzurum_mincard.dart';
import 'package:weatherapp/view/citys/erzurum/erzurum_slidercard.dart';
import 'package:weatherapp/view/citys/istanbul/istanbul_mincard.dart';
import 'package:weatherapp/view/citys/istanbul/istanbul_slidercard.dart';
import 'package:weatherapp/view/citys/izmir/izmir_mincard.dart';
import 'package:weatherapp/view/citys/izmir/izmir_slidercard.dart';
import 'package:weatherapp/view/citys/kars/kars_mincard.dart';
import 'package:weatherapp/view/citys/kars/kars_slidercard.dart';
import 'package:weatherapp/view/citys/kirikkale/kirikkale_mincard.dart';
import 'package:weatherapp/view/citys/kirikkale/kirikkale_slidercard.dart';
import 'package:weatherapp/view/citys/konya/konya_mincard.dart';
import 'package:weatherapp/view/citys/konya/konya_slidercard.dart';
import 'package:weatherapp/view/citys/mardin/mardin_mincard.dart';
import 'package:weatherapp/view/citys/mardin/mardin_slidercard.dart';
import 'package:weatherapp/view/citys/samsun/samsun_mincard.dart';
import 'package:weatherapp/view/citys/samsun/samsun_slidercard.dart';
import 'package:weatherapp/view/citys/trabzon/trabzon_mincard.dart';
import 'package:weatherapp/view/citys/trabzon/trabzon_slidercard.dart';
import 'package:weatherapp/view/citys/yozgat/yozgat_mincard.dart';
import 'package:weatherapp/view/citys/yozgat/yozgat_slidercard.dart';
import '../citys/corum/corum_mincard.dart';
import '../citys/corum/corum_slidercard.dart';

void main() {
  runApp(
    const MaterialApp(
      home: home(),
    ),
  );
}

// ignore: camel_case_types
class darkModeClass {
  bool _darkMode = false;
}

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> with darkModeClass {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Hava Durumu?',
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: _darkMode == true
                        ? Colors.white
                        : themeData.colorScheme.background,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [
            Switch(
              activeThumbImage: const AssetImage(
                  'assets/images/switch_img/icons8-light-mode-78.png'),
              inactiveThumbImage: const AssetImage(
                  'assets/images/switch_img/icons8-dark-mode-67.png'),
              activeColor: _darkMode == true
                  ? Colors.white
                  : themeData.colorScheme.background,
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            // top slider
            _buildTopSliderWidget,
            SizedBox(
              height: context.dynamicHeight(0.04),
            ),
            // body citys lists
            _buildBodyCitysListCardWidget,
          ],
        ),
      ),
    );
  }

  // top slider sub widget
  Widget get _buildTopSliderWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: context.dynamicHeight(0.28),
        child: CarouselSlider(
          items: const [
            // corum card
            corumSliderCardWidget(),
            // istanbul card
            istanbulSliderCardWidget(),
            // ankara card
            ankaraSliderCardWidget(),
            // bursa card
            bursaSliderCardWidget(),
            // antalya card
            antalyaSliderCardWidget(),
            // samsun card
            samsunSliderCardWidget(),
            // Trabzon card
            trabzonSliderCardWidget(),
            // Çanakkale card
            canakkaleSliderCardWidget(),
            // konya card
            konyaSliderCardWidget(),
            // izmir card
            izmirSliderCardWidget(),
            // kırıkkale card
            kirikkaleSliderCardWidget(),
            // Erzurum card
            erzurumSliderCardWidget(),
            // Mardin card
            mardinSliderCardWidget(),
            // Kars card
            karsSliderCardWidget(),
            // Yozgat card
            yozgatSliderCardWidget(),
          ],
          options: CarouselOptions(
            autoPlay: false,
            reverse: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
          ),
        ),
      );

  // body citys lists
  Widget get _buildBodyCitysListCardWidget => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: const <Widget>[
            // corum city card
            corumMinCard(),
            // istanbul city card
            istanbulMinCard(),
            // antalya card
            antalyaMinCard(),
            // ankara city card
            ankaraMinCard(),
            // bursa city card
            bursaMinCard(),
            // Çanakkale city card
            canakkaleMinCard(),
            // samsun city card
            samsunMinCard(),
            // Trabzon city card
            trabzonMinCard(),
            // izmir city card
            izmirMinCard(),
            // konya city card
            konyaMinCard(),
            // kırıkkale city card
            kirikkaleMinCard(),
            // Erzurum city card
            erzurumMinCard(),
            // Mardin city card
            mardinMinCard(),
            // Kars city card
            karsMinCard(),
            // Yozgat city card
            yozgatMinCard(),
          ],
        ),
      );
}

//

