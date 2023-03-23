import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube/screens/homescreen/provider/homeprovider.dart';
import 'package:youtube/screens/videoscreen/provider/videoprovider.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({Key? key}) : super(key: key);

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<Videoprovider>(context,listen: false).initVideo();
  //   super.initState();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<Videoprovider>(context, listen: false).stopVideo();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    Provider.of<Videoprovider>(context, listen: false).stopVideo();
  }

  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context)!.settings.arguments as int;

    Videoprovider videoprovider = Provider.of(context, listen: false);
    Homeprovider homeprovider = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              child: Chewie(
                controller: videoprovider.chewieController!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 492,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      "${homeprovider.videoNameList1[i]}",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    Text(
                      "${homeprovider.videoNameList2[i]}",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${homeprovider.videoViewList[i]} . ${homeprovider.videoTimingList[i]}",
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage("${homeprovider.channelLogoList[i]}"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Text(
                              "${homeprovider.channelNameList[i]}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text("Subscribe",style: GoogleFonts.poppins(color: Colors.white,fontSize: 13)),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            height: 35,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.notification_add_outlined,color: Colors.black,),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.thumb_up_alt_rounded,color: Colors.black,),
                              Text("12M",style: GoogleFonts.poppins(color: Colors.black)),
                              Icon(Icons.thumb_down_alt_outlined,color: Colors.black,),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.share,color: Colors.black,),
                              Text("Share",style: GoogleFonts.poppins(color: Colors.black)),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.electric_bolt_outlined,color: Colors.black,),
                              Text("Remix",style: GoogleFonts.poppins(color: Colors.black)),
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comments  46K",style: GoogleFonts.poppins(color: Colors.black),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("assets/logo/person.jpg"),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 35,
                                width: 270,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade300,
                                ),
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text("Add a comment . . .",style: GoogleFonts.poppins(color: Colors.grey)),
                                // Text("Add a comment . . .",style: GoogleFonts.poppins(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    commentBox(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget commentBox()
  {
    return Container(
      height: 85,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/logo/p2.jpg"),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TheAkhilSarkar",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500)),
              Text("Nice App Dude ! Keep it Up. . .",style: GoogleFonts.poppins(color: Colors.black,fontSize: 12)),
              SizedBox(height: 4,),
              Row(
                children: [
                  Icon(Icons.thumb_up_off_alt_rounded,size: 15),
                  SizedBox(width: 5,),
                  Icon(Icons.thumb_down_alt_outlined,size: 15),
                  SizedBox(width: 5,),
                  Icon(Icons.favorite,size: 15),
                  SizedBox(width: 10,),
                  Text("Reply",style: GoogleFonts.poppins(color: Colors.black,fontSize: 9)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

}
