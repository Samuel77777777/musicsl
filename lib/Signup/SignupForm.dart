import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/components/BottomBar.dart';

import '../HomePage.dart';
import '../Login/LoginScreen.dart';
import '../colors/colors.dart';
import '../components/auth_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isChecked = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // stop the loading circle when the user is signed up
      Navigator.pop(context);

      // Navigate to the homepage
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomeBottomBar(), // Replace YourHomePage with the actual homepage widget
        ),
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      // show specific error message
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == "email-already-in-use") {
        errorMessage =
            "This email is already in use. Please use a different email.";
      } else if (e.code == "weak-password") {
        errorMessage =
            "The password is too weak. Please use a stronger password.";
      }

      // show error dialog with the specific message
      showErrorMessage(errorMessage);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            //name field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Enter your username',
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
                  fillColor: Colors.grey[600], // Set the background color
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ), // Set the hint text color
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500, // Set the text color
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            //email field

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
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
                  fillColor: Colors.grey[600], // Set the background color
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ), // Set the hint text color
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500, // Set the text color
                ),
              ),
            ),

            //password field
            const SizedBox(
              height: 16,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
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
                  fillColor: Colors.grey[600], // Set the background color
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ), // Set the hint text color
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500, // Set the text color
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5.0), // Set the border radius for the checkbox
                      side: const BorderSide(
                          color: Colors.white), // Set the border color
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    checkColor: Colors.blue,
                    activeColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    }),

                //rich text
                RichText(
                  text: TextSpan(
                    text: 'I agree with the ',
                    style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Terms and condition',
                        style: TextStyle(color: mainHeading),
                      ),
                      TextSpan(text: ' and\n '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: mainHeading),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Button(text: "Create Account", onTap: signUserUp),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Do you have account?",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: whiteColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: mainHeading),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
