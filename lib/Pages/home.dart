import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  void updateTime() async {
    WorldTime instance = WorldTime(
        location: data['location'], flag: data['flag'], url: data['url']);
    instance.getTime;
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
          padding: const EdgeInsets.only(top: 150),
          child: Center(
            child: Column(
              children: [
                Text(
                  data['location'],
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      if (result != null) {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                          'url': result['url'],
                        };
                      }
                    });
                  },
                  icon: const Icon(CupertinoIcons.location_solid,
                      color: Colors.white),
                  label: const Text(
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
