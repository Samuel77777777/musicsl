import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/Login/LoginForm.dart';
import 'package:musicsl/components/SocialSignIn.dart';
import 'package:musicsl/components/auth_service.dart';
import '../colors/colors.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Image(
                image: const AssetImage("./assets/multimedia.png"),
                width: size.width * 0.2,
                height: size.width * 0.2,
              ),
              SizedBox(height: size.height * 0.04),
              Center(
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.1,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: mainHeading,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Text(
                  'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.04,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              // Social Logins

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                SocialSignIn(imagePath: "./assets/facebook.png",  onTap: () => AuthService().signInWithFacebook(), text: "FaceBook"),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    // Google Container

                    SocialSignIn(
                        imagePath: "./assets/google.png",
                        onTap: () => AuthService().signInWithGoogle(),
                        text: "Google")
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              // Line

              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: size.width * 0.36,
                      color: Color(0xFFE0E5EC),
                    ),
                    Text(
                      'Or',
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFE0E5EC),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: size.width * 0.36,
                      color: Color(0xFFE0E5EC),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.015,
              ),

              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
