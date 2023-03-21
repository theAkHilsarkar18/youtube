import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube/screens/homescreen/provider/homeprovider.dart';
import 'package:youtube/screens/videoscreen/provider/videoprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeprovider;
  Videoprovider? videoprovider;

  @override
  Widget build(BuildContext context) {
    homeprovider = Provider.of(context, listen: false);
    videoprovider = Provider.of(context, listen: false);
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
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {

                          Provider.of<Videoprovider>(context,listen: false).initVideo(videoprovider!.videoPath[index]);
                          Navigator.pushNamed(context, 'video',arguments: index);

                        },
                        child: customVideoBox(
                          homeprovider!.videoImgList[index],
                          homeprovider!.channelLogoList[index],
                          homeprovider!.channelNameList[index],
                          homeprovider!.videoNameList1[index],
                          homeprovider!.videoNameList2[index],
                          homeprovider!.videoViewList[index],
                          homeprovider!.videoTimingList[index],
                        ),
                      ),
                      itemCount: homeprovider!.videoImgList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                    ))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.electric_bolt,
                  color: Colors.black,
                ),
                label: "Shorts"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_settings,
                  color: Colors.black,
                ),
                label: "Subscription"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection,
                  color: Colors.black,
                ),
                label: "Library"),
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

  Widget customVideoBox(
      String thumbnail,
      String logo,
      String channelName,
      String videoname1,
      String videoname2,
      String videoview,
      String videotime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset("${thumbnail}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("${logo}"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${videoname1}",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  Text("${videoname2}",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${channelName} . ${videoview} . ${videotime}",
                    style: TextStyle(color: Colors.black38, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
