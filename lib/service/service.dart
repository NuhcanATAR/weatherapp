import 'dart:io';

// pub dev
import 'package:http/http.dart' as http;

class ApiCityServices {
  // çorum service
  static Future getWeatherCorumCity(String corumCity) async {
    return await http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$corumCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey', // api key
          HttpHeaders.contentTypeHeader: 'application/json' // tpye
        });
  }

  // ankara service
  static Future getWeatherAnkaraCity(String ankaraCity) async {
    return await http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$ankaraCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }

  // kırıkkale service
  static Future getWeatherKirikkaleCity(String kirikkaleCity) async {
    return await http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$kirikkaleCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }

  // İstanbul service
  static Future getWeatheristanbulCity(String istanbulCity) async {
    return await http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$istanbulCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }

  // antalya service
  static Future getWeatherAntalyaCity(String antalyaCity) async {
    return await http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$antalyaCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // konya service
  static Future getWeatherKonyaCity(String konyaCity) async {
    return http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$konyaCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }

  // samsun service
  static Future getWeatherSamsunCity(String samsunCity) async {
    return http.get(
        Uri.parse(
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$samsunCity"),
        headers: {
          HttpHeaders.authorizationHeader: 'apiKey',
          HttpHeaders.contentTypeHeader: 'application/json',
        });
  }

  // bursa service
  static Future getWeatherBursaCity(String bursaCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$bursaCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // izmir service
  static Future getWeatherizmirCity(String izmirCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$izmirCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // çanakkale service
  static Future getWeatherCanakkaleCity(String canakkaleCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$canakkaleCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // Trabzon service
  static Future getWeatherTrabzonCity(String trabzonCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$trabzonCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // Mardin service
  static Future getWeatherMardinCity(String mardinCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$mardinCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // Erzurum service
  static Future getWeatherErzurumCity(String erzurumCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$erzurumCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // Kars Service
  static Future getWeatherKarsCity(String karsCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$karsCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }

  // Yozgat service
  static Future getWeatherYozgatCity(String yozgatCity) async {
    return http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$yozgatCity"),
      headers: {
        HttpHeaders.authorizationHeader: 'apiKey',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
  }
}
