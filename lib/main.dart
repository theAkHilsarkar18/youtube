
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/screens/homescreen/provider/homeprovider.dart';
import 'package:youtube/screens/homescreen/view/homescreen.dart';
import 'package:youtube/screens/spleshscreen/spleshscreen.dart';
import 'package:youtube/screens/videoscreen/provider/videoprovider.dart';
import 'package:youtube/screens/videoscreen/view/videoscreen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
        ChangeNotifierProvider(create: (context) => Videoprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Spleshscreen(),
          'home' : (context) => Homescreen(),
          'video' : (context) => Videoscreen(),
        },
      ),
    ),
  );
}