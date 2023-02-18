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
import 'package:weatherapp/view/citys/mardin/mardin.dart';
import '../../../service/service.dart';
import '../../../theme/theme.dart';

// ignore: camel_case_types
class mardinMinCard extends StatefulWidget {
  const mardinMinCard({super.key});

  @override
  State<mardinMinCard> createState() => _mardinMinCardState();
}

// ignore: camel_case_types
class _mardinMinCardState extends State<mardinMinCard> {
  String mardinCity = "";
  List<WeatherMardin> weathermardinList = [];

  @override
  void initState() {
    super.initState();
    getWeathermardinData("Mardin");
  }

  void getWeathermardinData(String citymardinData) async {
    ApiCityServices.getWeatherMardinCity(citymardinData).then((data) {
      Map resultBody = jsonDecode(data.body);
      if (resultBody['success'] == true) {
        setState(() {
          mardinCity = resultBody['city'];
          Iterable result = resultBody['result'];
          weathermardinList =
              result.map((weatherData) => WeatherMardin(weatherData)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (weathermardinList.isEmpty) {
      return errorLoadingScreen;
    } else {
      return mardinMinCardWidget;
    }
  }

  // error & loading screen
  Widget get errorLoadingScreen => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: context.dynamicHeight(0.1),
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
              color: themeData.colorScheme.background, size: 35),
        ),
      );

  // mardin min card widget
  Widget get mardinMinCardWidget => Card(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const mardinWeatherScreen(),
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
                        mardinCity,
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
                                url: weathermardinList[0].icon.toString(),
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
                              weathermardinList[0].description,
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
                        "${double.parse(weathermardinList[0].degree).round().toString()}°C",
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
