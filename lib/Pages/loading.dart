import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime sample = WorldTime(
        location: 'Denver', flag: 'nigeria.jpg', url: 'America/Denver');
    await sample.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': sample.location,
      'time': sample.localtime,
      'flag': sample.flag,
      'isDaytime': sample.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF6F35A5),
      body: Center(
          child: SpinKitSpinningLines(
              color: Colors.white, lineWidth: 5, size: 100)),
    );
  }
}
