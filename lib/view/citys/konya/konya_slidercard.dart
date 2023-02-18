import 'dart:convert';
import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// routers page
import 'package:weatherapp/theme/theme.dart';
import 'package:weatherapp/view/citys/konya/konya.dart';
import '../../../model/model.dart';
import '../../../service/service.dart';

// ignore: camel_case_types
class konyaSliderCardWidget extends StatefulWidget {
  const konyaSliderCardWidget({super.key});

  @override
  State<konyaSliderCardWidget> createState() => _konyaSliderCardWidgetState();
}

// ignore: camel_case_types
class _konyaSliderCardWidgetState extends State<konyaSliderCardWidget> {
  String konyaCity = "";
  List<WeatherKonya> weatherKonyaList = [];

  @override
  void initState() {
    super.initState();
    getWeatherKonyaData("Konya");
  }

  void getWeatherKonyaData(String cityKonyaData) async {
    ApiCityServices.getWeatherKonyaCity(cityKonyaData).then((data) {
      Map resultBody = jsonDecode(data.body);
      if (resultBody['success'] == true) {
        setState(() {
          konyaCity = resultBody['city'];
          Iterable result = resultBody['result'];
          weatherKonyaList =
              result.map((weatherData) => WeatherKonya(weatherData)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weatherKonyaList.isEmpty) {
      return errorLoadingScreen;
    } else {
      return konyaSliderCardWidget;
    }
  }

  // error & loading screen
  Widget get errorLoadingScreen => Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const konyaWeatherScreen(),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Center(
              child: LoadingAnimationWidget.beat(
                  color: themeData.colorScheme.background, size: 35),
            ),
          ),
        ),
      );

  // konya slider card widget
  Widget get konyaSliderCardWidget => Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const konyaWeatherScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  themeData.colorScheme.background,
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              children: <Widget>[
                // left weather status image
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CachedNetworkImageBuilder(
                      url: weatherKonyaList[0].icon.toString(),
                      builder: (image) => Image.file(image),
                      placeHolder: LoadingAnimationWidget.beat(
                          color: themeData.colorScheme.background, size: 25),
                      errorWidget: const CircularProgressIndicator(),
                      imageExtensions: const ["jpg", "png"],
                    ),
                  ),
                ),
                // right weather information content
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // city
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              konyaCity,
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // temperature value
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "${double.parse(weatherKonyaList[0].degree).round().toString()}°C",
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    // ignore: deprecated_member_use
                                    .headline3!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                          // weather status
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              weatherKonyaList[0].description,
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
