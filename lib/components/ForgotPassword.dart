import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/components/OtpScreen.dart';
import 'package:musicsl/components/auth_button.dart';

import '../colors/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isChecked = false;
  bool obsucreText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
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
                  'Forgot Password',
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
                  //name field
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
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

                  const SizedBox(height: 30),

                  Button(text: 'Continue', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
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
