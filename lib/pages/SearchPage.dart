import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/colors/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {

  final List<Map<String, String>> recInfo = [
    {'url': './assets/listen.png', 'text': "Drake"},
    {'url': './assets/listen.png', 'text': "Top shatta"},
    {'url': './assets/listen.png', 'text': "Wizkid"},
    {'url': './assets/listen.png', 'text': "Davido"},
    {'url': './assets/listen.png', 'text': "Burna Boy"},
    {'url': './assets/listen.png', 'text': "Drizilik"},
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 15, bottom: 20, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                      ),
                    ),
                    Image.asset("./assets/notification.png")
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 47, 44, 44)))),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recomendation",
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                child: ListView.builder(itemCount: recInfo.length, scrollDirection: Axis.horizontal,   itemBuilder:(BuildContext context, int index){ 
                  return(
                     Container(
                       decoration: BoxDecoration(
                         color: Color(0xFF1F2F2F),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       width: 142,
                       height: 23,
                       margin: EdgeInsets.all(8),
                       child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Image.asset(recInfo[index]['url']!, fit: BoxFit.cover, width: 15, height: 14,),
                         const SizedBox(width: 10,),
                         Text(recInfo[index]['text']!, style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF878787)

                          ),)
                         ],
                       
                       ),
                 )
                
                  );
                } ),
              ),

              const SizedBox(height: 20,),

              

             



            ],
          ),
        ),
      ),
    );
  }
}
