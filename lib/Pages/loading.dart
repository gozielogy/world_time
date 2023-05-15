import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void SetupWorldTime() async {
    WorldTime sample = WorldTime(
        location: 'Port Harcourt', flag: 'nigeria.jpg', url: 'Africa/Lagos');
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
    SetupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
          child: SpinKitSpinningLines(
              color: Colors.white, lineWidth: 5, size: 100)),
    );
  }
}
