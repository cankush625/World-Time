import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // checking if it's a day time

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(
          'https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(
          1, 3); // We dont want the + at the starting of the offset
      String minOffset = data['utc_offset'].substring(
          4, 6);
      String signOfOffset = data['utc_offset'].substring(
          0, 1);

      // Creating DateTime object
      DateTime now = DateTime.parse(datetime);
      // If the offset in negative then subtract it else add it in the now(the default time)
      if (signOfOffset == "-") {
        now = now.subtract(
            Duration(hours: int.parse(offset), minutes: int.parse(minOffset)));
      } else {
        now = now.add(
            Duration(hours: int.parse(offset), minutes: int.parse(minOffset)));
      }

      // Set the time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error encountered: $e');
      time = "Could not get time data";
    }
  }
}