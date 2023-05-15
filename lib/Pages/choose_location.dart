import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Port Harcourt', flag: 'nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(
        location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
    WorldTime(
        location: 'Casablanca', flag: 'morocco.png', url: 'Africa/Casablanca'),
    WorldTime(location: 'Qatar', flag: 'qatar.png', url: 'Asia/Qatar'),
    WorldTime(
        location: 'Maldives', flag: 'maldives.png', url: 'Indian/Maldives'),
    WorldTime(
        location: 'Brisbane', flag: 'australia.png', url: 'Australia/Brisbane'),
    WorldTime(location: 'Jerusalem', flag: 'israel.png', url: 'Asia/Jerusalem'),
    WorldTime(
        location: 'Cape Verde',
        flag: 'cape_verde.png',
        url: 'Atlantic/Cape_Verde'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Rome', flag: 'italy.png', url: 'Europe/Rome'),
    WorldTime(location: 'Madrid', flag: 'spain.png', url: 'Europe/Madrid'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate back to home page
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.localtime,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
      'url': instance.url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Set location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }),
    );
  }
}
