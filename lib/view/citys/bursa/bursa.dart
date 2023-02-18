import 'dart:convert';
import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// routers page
import 'package:weatherapp/theme/theme.dart';
import 'package:weatherapp/model/model.dart';
import 'package:weatherapp/service/service.dart';

// ignore: camel_case_types
class bursaWeatherScreen extends StatefulWidget {
  const bursaWeatherScreen({super.key});

  @override
  State<bursaWeatherScreen> createState() => _bursaWeatherScreenState();
}

// ignore: camel_case_types
class _bursaWeatherScreenState extends State<bursaWeatherScreen> {
  String bursaCity = "";
  List<WeatherBursa> weatherbursaList = [];

  @override
  void initState() {
    super.initState();
    getWeatherbursaData("Bursa");
  }

  void getWeatherbursaData(String citybursaData) async {
    ApiCityServices.getWeatheristanbulCity(citybursaData).then((data) {
      Map resultBody = jsonDecode(data.body);
      if (resultBody['success'] == true) {
        setState(() {
          bursaCity = resultBody['city'];
          Iterable result = resultBody['result'];
          weatherbursaList =
              result.map((weatherData) => WeatherBursa(weatherData)).toList();
        });
      }
    });
  }

  String buildWeatherListBursaText(String day) {
    switch (day.toLowerCase()) {
      case "pazartesi":
        return "Pazartesi";
      case "salı":
        return "Salı           ";
      case "çarşamba":
        return "Çarşamba";
      case "perşembe":
        return "Perşembe";
      case "cuma":
        return "Cuma        ";
      case "cumartesi":
        return "Cumartesi   ";
      case "pazar":
        return "Pazar          ";
      default:
        return "?";
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;

    if (weatherbursaList.isEmpty) {
      return errorLoadingScreen;
    } else {
      String durum = weatherbursaList[0].description;
      String sonuc = "";
      if (durum == "parçalı bulutlu") {
        sonuc =
            "https://i.pinimg.com/564x/c4/fd/0b/c4fd0b71a1ca00375a675e2bd3ce2cf3.jpg";
      } else if (durum == "rain and snow") {
        sonuc =
            "https://i.pinimg.com/564x/5a/90/70/5a907030775acc4b1660c4be44530c04.jpg";
      } else if (durum == "hafif kar yağışlı") {
        sonuc =
            "https://firebasestorage.googleapis.com/v0/b/blogdb-6ac10.appspot.com/o/4fc90d09-690f-4759-afec-7181a122e068.jpg?alt=media&token=09d7ea01-f4d3-40b6-9cb2-ccb04625e18d";
      } else if (durum == "parçalı az bulutlu") {
        sonuc =
            "https://i.pinimg.com/564x/e3/9e/7d/e39e7df3b5b86123fd11cef80d49ebe3.jpg";
      } else if (durum == "hafif yağmur") {
        sonuc =
            "https://i.pinimg.com/564x/78/b2/32/78b232ad14297dbbdb5cd09ef9c8d1bc.jpg";
      } else if (durum == "az bulutlu") {
        sonuc =
            "https://i.pinimg.com/564x/e3/9e/7d/e39e7df3b5b86123fd11cef80d49ebe3.jpg";
      } else if (durum == "açık") {
        sonuc =
            "https://i.pinimg.com/750x/bf/4a/b8/bf4ab8e641ba5942270a91247e623b63.jpg";
      } else if (durum == "kapalı") {
        sonuc =
            "https://i.pinimg.com/564x/53/f7/9d/53f79dcd723ffa00faad120ad7e6c5a0.jpg";
      } else {
        sonuc =
            "https://i.pinimg.com/564x/cb/b8/ed/cbb8edb225f3c95eb828e86ea9984950.jpg";
      }
      return Scaffold(
        body: CachedNetworkImageBuilder(
          url: sonuc.toString(),
          builder: (image) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              child: Column(
                children: <Widget>[
                  // top content
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      width: query.width,
                      height: query.height,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 75, left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              // location adress city & temperature value
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    // city name
                                    FadeInUp(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "Türkiye / $bursaCity",
                                          style: GoogleFonts.nunito(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                              color: Colors.white,
                                              shadows: [
                                                const Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.black,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // temperature value
                                    FadeInUp(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "${double.parse(weatherbursaList[0].degree).round().toString()}°C",
                                          style: GoogleFonts.ubuntu(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 105,
                                              shadows: [
                                                const Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.black,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // weather status text
                                    FadeInUp(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          weatherbursaList[0].description,
                                          style: GoogleFonts.nunito(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                              color: Colors.white,
                                              shadows: [
                                                const Shadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.black,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // footer content
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: FadeInUp(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) => SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: context.dynamicHeight(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: ListView.separated(
                                          itemCount:
                                              weatherbursaList.length - 1,
                                          itemBuilder: (context, index) {
                                            return // the day weather card
                                                Container(
                                              color: Colors.white,
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height:
                                                    context.dynamicHeight(0.11),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(4),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      // city name
                                                      Flexible(
                                                        fit: FlexFit.tight,
                                                        flex: 2,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          child: Text(
                                                            buildWeatherListBursaText(
                                                                weatherbursaList[
                                                                        index +
                                                                            1]
                                                                    .day),
                                                            style: GoogleFonts
                                                                .nunito(
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // weather status image & status text
                                                      Expanded(
                                                        flex: 5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Flexible(
                                                                fit: FlexFit
                                                                    .tight,
                                                                flex: 1,
                                                                child: // status image
                                                                    Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  child:
                                                                      CachedNetworkImageBuilder(
                                                                    url: weatherbursaList[
                                                                            index +
                                                                                1]
                                                                        .icon
                                                                        .toString(),
                                                                    builder: (image) =>
                                                                        Image.file(
                                                                            image),
                                                                    placeHolder: LoadingAnimationWidget.beat(
                                                                        color: themeData
                                                                            .colorScheme
                                                                            .background,
                                                                        size:
                                                                            25),
                                                                    errorWidget:
                                                                        const CircularProgressIndicator(),
                                                                    imageExtensions: const [
                                                                      "jpg",
                                                                      "png"
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // temperature value
                                                      Flexible(
                                                        fit: FlexFit.tight,
                                                        flex: 2,
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Flexible(
                                                                fit: FlexFit
                                                                    .tight,
                                                                flex: 1,
                                                                child: Text(
                                                                  "${double.parse(weatherbursaList[index + 1].min).round()}°",
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunito(
                                                                    textStyle: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyLarge!
                                                                        .copyWith(
                                                                          color:
                                                                              Colors.black54,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Flexible(
                                                                fit: FlexFit
                                                                    .tight,
                                                                flex: 1,
                                                                child: Text(
                                                                  "-5°C",
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunito(
                                                                    textStyle: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyLarge!
                                                                        .copyWith(
                                                                          color:
                                                                              Colors.black54,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const Divider(
                                              color: Colors.transparent,
                                            );
                                          },
                                        ),
                                      ),
                                    ));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color: Colors.black54.withOpacity(0.1),
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                "6 Günlük Hava Durumu",
                                style: GoogleFonts.nunito(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                    color: Colors.white,
                                    shadows: [
                                      const Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          placeHolder: Center(
            child: LoadingAnimationWidget.beat(
                color: themeData.colorScheme.background, size: 35),
          ),
          errorWidget: const CircularProgressIndicator(),
          imageExtensions: const ["jpg", "png"],
        ),
      );
    }
  }

  // error & loading screen
  Widget get errorLoadingScreen => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LoadingAnimationWidget.fourRotatingDots(
                  color: themeData.colorScheme.background, size: 80),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Hava Durumu Açılıyor...",
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Lütfen Bekleyiniz",
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
}
