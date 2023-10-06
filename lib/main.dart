import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
initialRoute: "/",
routes: {
  "/": (context) => Loading(),
  "/home": (context) => Home(),
  "/location":(context) => ChooseLocation(),
},
));


