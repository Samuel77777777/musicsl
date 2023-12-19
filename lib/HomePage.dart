import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/Login/LoginScreen.dart';
import 'package:musicsl/colors/colors.dart';
import 'package:musicsl/components/auth_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

   final user = FirebaseAuth.instance.currentUser;

  // Sign user out method
  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(), // Replace LoginScreen with your login page
      ),
    );
  }

  final List<Map<String, String>> imageInfo = [
    {'url': './assets/rounded.png', 'text': "Trending"},
    {'url': './assets/rounde.png', 'text': "Top Charts"},
    {'url': './assets/rounded1.png', 'text': "Weekly"},
    {'url': './assets/rounded2.png', 'text': "Favourite's"},
    {'url': './assets/rounded3.png', 'text': "Country side"},
    {'url': './assets/rounded.png', 'text': "Best"},
  ];

  final List<Map<String, String>> artistInfo = [
    {'url': './assets/jb.png', 'text': "Justin Bieber"},
    {'url': './assets/mash.png', 'text': "Marshmello"},
    {'url': './assets/dua.png', 'text': "Dua Lipa"},
    {'url': './assets/jb.png', 'text': "Justin Bieber"},
    {'url': './assets/mash.png', 'text': "Marshmello"},
    {'url': './assets/dua.png', 'text': "Dua lip"},
  ];

  final List<Map<String, String>> musicInfo = [
    {
      'image': './assets/trend1.png',
      'title': "Beliver",
      'subtitle': "image Dragons"
    },
    {
      'image': './assets/trend2.png',
      'text': "Cheap Thrills",
      "subtitle": "SIA"
    },
    {
      'image': './assets/trend3.png',
      'text': "Star Boy",
      'subtitle': "The Weekend"
    },
    {
      'image': './assets/trend1.png',
      'title': "Beliver",
      'subtitle': "image Dragons"
    },
    {
      'image': './assets/trend2.png',
      'text': "Cheap Thrills",
      "subtitle": "SIA"
    },
    {
      'image': './assets/trend3.png',
      'text': "Star Boy",
      'subtitle': "The Weekend"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("./assets/person.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome, Power",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: mainHeading),
                            ),
                            Text(
                              "Live your day with music",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset("./assets/notification.png")
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: textColor),
                    ),
                    Text(
                      "More >",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: mainHeading),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 95,
                            width: 95,
                            margin: EdgeInsets.all(8),
                            child: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  imageInfo[index]['url']!,
                                  fit: BoxFit.cover,
                                  height: 95,
                                  width: 95,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            imageInfo[index]['text']!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Artist",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: textColor),
                    ),
                    Text(
                      "More >",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: mainHeading),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: artistInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 131,
                            width: 142,
                            margin: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                artistInfo[index]['url']!,
                                fit: BoxFit.cover,
                                height: 131,
                                width: 142,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            artistInfo[index]['text']!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: musicInfo.length,
                      itemBuilder: (BuildContext context, int index) {
                          final musicItem = musicInfo[index];
                        return SingleChildScrollView(

                          child: (ListTile(
                            leading: CircleAvatar(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                             musicItem['image'] ?? 'default_image_path.png',
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            )),
                            title: Text( musicItem['title'] ?? 'Unknown Title',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor)),
                            subtitle: Text(
                                 musicItem['subtitle'] ?? 'Unknown Artist',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF878787)),
                            ),
                            trailing: const Icon(
                              Icons.play_circle,
                              color: Color(0XFF2DE0E0),
                              size: 30,
                            ),
                          )),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              // Text(
              //   // "Welcome back:" + user.email,
              //  style: GoogleFonts.poppins(fontSize: 20, color: textColor),
              //  ),
              Center(
                child: Button(text: "Logout", onTap:  () => signUserOut(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
