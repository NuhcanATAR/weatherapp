// ignore: camel_case_types
import 'dart:convert';
import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// routers page
import 'package:weatherapp/model/model.dart';
import 'package:weatherapp/view/citys/antalya/antalya.dart';
import '../../../service/service.dart';
import '../../../theme/theme.dart';

// ignore: camel_case_types
class antalyaMinCard extends StatefulWidget {
  const antalyaMinCard({super.key});

  @override
  State<antalyaMinCard> createState() => _antalyaMinCardState();
}

// ignore: camel_case_types
class _antalyaMinCardState extends State<antalyaMinCard> {
  String antalyaCity = "";
  List<WeatherAntalya> weatherantalyaList = [];

  @override
  void initState() {
    super.initState();
    getWeatherantalyaData("Antalya");
  }

  void getWeatherantalyaData(String cityantalyaData) async {
    ApiCityServices.getWeatherAntalyaCity(cityantalyaData).then((data) {
      Map resultBody = jsonDecode(data.body);
      if (resultBody['success'] == true) {
        setState(() {
          antalyaCity = resultBody['city'];
          Iterable result = resultBody['result'];
          weatherantalyaList =
              result.map((weatherData) => WeatherAntalya(weatherData)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weatherantalyaList.isEmpty) {
      return errorLoadingScreen;
    } else {
      return antalyaMinCardWidget;
    }
  }

  // loading & error screen
  Widget get errorLoadingScreen => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: context.dynamicHeight(0.1),
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
              color: themeData.colorScheme.background, size: 35),
        ),
      );

  // antalya min card weather widget
  Widget get antalyaMinCardWidget => Card(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const antalyaWeatherScreen(),
              ),
            );
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: context.dynamicHeight(0.11),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        antalyaCity,
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  // weather status image & status text
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: // status image
                                Padding(
                              padding: const EdgeInsets.all(15),
                              child: CachedNetworkImageBuilder(
                                url: weatherantalyaList[0].icon.toString(),
                                // "https://firebasestorage.googleapis.com/v0/b/blogdb-6ac10.appspot.com/o/icons8-rainy-64.png?alt=media&token=50a626e0-603b-48a5-862c-07afdc346b08"
                                builder: (image) => Image.file(image),
                                placeHolder: LoadingAnimationWidget.beat(
                                    color: themeData.colorScheme.background,
                                    size: 25),
                                errorWidget: const CircularProgressIndicator(),
                                imageExtensions: const ["jpg", "png"],
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: // statu text
                                Text(
                              weatherantalyaList[0].description,
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.black54,
                                    ),
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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "${double.parse(weatherantalyaList[0].degree).round().toString()}°C",
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black54,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
