import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'choose_location.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        updateTime() {}
      });
    });
  }

  void updateTime() async {
    WorldTime instance = WorldTime(
        location: data['location'], flag: data['flag'], url: data['url']);
    await instance.getTime;
    print(instance.localtime);
  }

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    print(data);
    String bgImage = data['isDaytime'] ? 'assets/day.png' : 'assets/night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                        'url': result['url'],
                      };
                    });
                  },
                  icon:
                      Icon(CupertinoIcons.location_solid, color: Colors.white),
                  label: Text(
                    "Change location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
