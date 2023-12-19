import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/components/AccountCreatedScreen.dart';
import 'package:musicsl/components/auth_button.dart';

import '../colors/colors.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Image(
                image: AssetImage("./assets/mail.png"),
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Enter Otp',
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: mainHeading),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'It was popularised in the 1960s with the release of\n Letraset sheetscontaining Lorem Ipsum.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              //the social logins

              Form(
                  child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Otp ',
                        hintText: 'Enter your new Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                          horizontal: 18.0,
                        ),
                        filled: true,
                        fillColor: Colors.grey[700], // Set the background color
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ), // Set the hint text color
                      ),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500, // Set the text color
                      ),
                    ),
                  ),

                  //password

                  const SizedBox(height: 50),

                  Button(text: "Continue", onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountCreatedScreen() ));
                  })
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
