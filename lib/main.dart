import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

// routers page
import 'package:weatherapp/view/home/home.dart';
import 'package:weatherapp/view/citys/ankara/ankara.dart';
import 'package:weatherapp/view/citys/antalya/antalya.dart';
import 'package:weatherapp/view/citys/bursa/bursa.dart';
import 'package:weatherapp/view/citys/canakkale/canakkale.dart';
import 'package:weatherapp/view/citys/corum/corum.dart';
import 'package:weatherapp/view/citys/erzurum/erzurum.dart';
import 'package:weatherapp/view/citys/istanbul/istanbul.dart';
import 'package:weatherapp/view/citys/izmir/izmir.dart';
import 'package:weatherapp/view/citys/kars/kars.dart';
import 'package:weatherapp/view/citys/kirikkale/kirikkale.dart';
import 'package:weatherapp/view/citys/konya/konya.dart';
import 'package:weatherapp/view/citys/mardin/mardin.dart';
import 'package:weatherapp/view/citys/samsun/samsun.dart';
import 'package:weatherapp/view/citys/trabzon/trabzon.dart';
import 'package:weatherapp/view/citys/yozgat/yozgat.dart';

void main() {
  runApp(
    const buildRouteScreen(),
  );
}

// ignore: camel_case_types
class buildRouteScreen extends StatefulWidget {
  const buildRouteScreen({super.key});

  @override
  State<buildRouteScreen> createState() => _buildRouteScreenState();
}

// ignore: camel_case_types
class _buildRouteScreenState extends State<buildRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/main",
      routes: {
        "/main": (context) => const buildMain(), // first screen
        "/home": (context) => const home(), // home screen
        "/ankaraWeather": (context) => const ankaraWeatherScreen(),
        "/antalyaWeather": (context) => const antalyaWeatherScreen(),
        "/bursaWeather": (context) => const bursaWeatherScreen(),
        "/canakkaleWeather": (context) => const canakkaleWeatherScreen(),
        "/corumWeather": (context) => const corumWeatherScreen(),
        "/erzurumWeather": (context) => const erzurumWeatherScreen(),
        "/istanbulWeather": (context) => const istanbulWeatherScreen(),
        "/izmirWeather": (context) => const izmirWeatherScreen(),
        "/karsWeather": (context) => const karsWeatherScreen(),
        "/kirikkaleWeather": (context) => const kirikkaleWeatherScreen(),
        "/konyaWeather": (context) => const konyaWeatherScreen(),
        "/mardinWeather": (context) => const mardinWeatherScreen(),
        "/samsunWeather": (context) => const samsunWeatherScreen(),
        "/trabzonWeather": (context) => const trabzonWeatherScreen(),
        "/yozgatWeather": (context) => const yozgatWeatherScreen(),
      },
    );
  }
}

// ignore: camel_case_types
class buildMain extends StatefulWidget {
  const buildMain({super.key});

  @override
  State<buildMain> createState() => _buildMainState();
}

// ignore: camel_case_types
class _buildMainState extends State<buildMain> with mainSetting {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const home(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody,
    );
  }

  // build body content
  Widget get buildBody => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/background_img/background_img.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // main body
              buildMainBody,
              // footer body
              buildFooterBody,
            ],
          ),
        ),
      );

  // main body top
  Widget get buildMainBody => Expanded(
        flex: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // logo & loading animation widget
            Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  // loading animation
                  LoadingAnimationWidget.discreteCircle(
                    color: Colors.white,
                    secondRingColor: Colors.lightBlueAccent,
                    thirdRingColor: Colors.lightBlue,
                    size: 75,
                  ),
                  // logo
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                          "assets/images/logo/icons8-weather-65.png"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.dynamicHeight(0.05),
            ),
            // application title
            Text(
              "Hava Durumu?",
              style: GoogleFonts.ubuntu(
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // application title
            Text(
              "Lütfen Bekleyiniz...",
              style: GoogleFonts.ubuntu(
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      );

  // body footer
  Widget get buildFooterBody => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // icon
            const Icon(
              Icons.favorite,
              color: Colors.redAccent,
              size: 21,
            ),
            const SizedBox(
              width: 5,
            ),
            // text
            GestureDetector(
              onTap: () {
                _launchUrl();
              },
              child: Text(
                "Github: NuhcanATAR",
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      );
}

// ignore: camel_case_types
class mainSetting {
  final Uri _url = Uri.parse("https://github.com/NuhcanATAR");

  // ignore: unused_element
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Url Adresi Bulunamadı: $_url');
    }
  }
}
