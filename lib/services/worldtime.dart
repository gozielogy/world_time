import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? localtime;
  String flag;
  String url;
  bool? isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      Response responseData =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map responseInfo = jsonDecode(responseData.body);
      // print(responseInfo);
      String datetime = responseInfo['datetime'];
      String offset = responseInfo['utc_offset'].substring(0,3);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      localtime = DateFormat.jm().format(now);

      // Set the isDaytime property
      isDaytime = now.hour > 6 && now.hour < 20;
    } catch (e) {
      print('caught error: $e');
      localtime = 'time data fetch error';
    }
  }
}
