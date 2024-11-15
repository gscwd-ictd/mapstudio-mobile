import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = "${dotenv.env['OPENROUTESERVICE_URL']}";
// String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";
// "https://api.openrouteservice.org/v2/directions/driving-car";

String apiKey = "${dotenv.env['ORS_API_KEY']}";
// String apiKey = "5b3ce3597851110001cf6248adb31645e1ef47e29cbe272663035a6b";

getRouteUrl(String startPoint, String endPoint) {
  // print('$baseUrl?api_key=$apiKey&start=$startPoint&endPoint');
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
