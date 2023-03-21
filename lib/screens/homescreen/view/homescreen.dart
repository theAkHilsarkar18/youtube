import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/logo/logo.png",
                  height: 60,
                ),
                Spacer(),
                Icon(Icons.cast, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.notification_add_outlined, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.search, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/logo/person.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 32,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.explore_outlined),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text("All",
                      style: GoogleFonts.poppins(color: Colors.white)),
                ),
                SizedBox(
                  width: 10,
                ),
                customBox("News"),
                SizedBox(
                  width: 10,
                ),
                customBox("Music"),
                SizedBox(
                  width: 10,
                ),
                customBox("Mixes"),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                customVideoBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customBox(String name) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text("${name}", style: GoogleFonts.poppins(color: Colors.black)),
    );
  }

  Widget customVideoBox()
  {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset("assets/video/lela.jpg"),
    );
  }
}
