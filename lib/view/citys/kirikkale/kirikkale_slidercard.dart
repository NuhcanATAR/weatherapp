import 'dart:convert';
import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// routers page
import 'package:weatherapp/theme/theme.dart';
import 'package:weatherapp/view/citys/kirikkale/kirikkale.dart';
import '../../../model/model.dart';
import '../../../service/service.dart';

// ignore: camel_case_types
class kirikkaleSliderCardWidget extends StatefulWidget {
  const kirikkaleSliderCardWidget({super.key});

  @override
  State<kirikkaleSliderCardWidget> createState() =>
      _kirikkaleSliderCardWidgetState();
}

// ignore: camel_case_types
class _kirikkaleSliderCardWidgetState extends State<kirikkaleSliderCardWidget> {
  String kirikkaleCity = "";
  List<WeatherKirikkale> weatherKirikkaleList = [];

  @override
  void initState() {
    super.initState();
    getWeatherKirikkaleData("Kırıkkale");
  }

  void getWeatherKirikkaleData(String cityKirikkaleData) async {
    ApiCityServices.getWeatherKirikkaleCity(cityKirikkaleData).then((data) {
      Map resultBody = jsonDecode(data.body);
      if (resultBody['success'] == true) {
        setState(() {
          kirikkaleCity = resultBody['city'];
          Iterable result = resultBody['result'];
          weatherKirikkaleList = result
              .map((weatherData) => WeatherKirikkale(weatherData))
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weatherKirikkaleList.isEmpty) {
      return errorLaodingScreen;
    } else {
      return kirikkaleSliderCardWidget;
    }
  }

  // error & loading screen
  Widget get errorLaodingScreen => Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const kirikkaleWeatherScreen(),
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

  // kırıkkale slider card widget
  Widget get kirikkaleSliderCardWidget => Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const kirikkaleWeatherScreen(),
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
                      url: weatherKirikkaleList[0].icon.toString(),
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
                              kirikkaleCity,
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
                              "${double.parse(weatherKirikkaleList[0].degree).round().toString()}°C",
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
                              weatherKirikkaleList[0].description,
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
