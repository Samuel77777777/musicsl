import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/Signup/SignupScreen.dart';
import 'package:musicsl/colors/colors.dart';
import 'package:musicsl/components/BottomBar.dart';
import 'package:musicsl/components/ForgotPassword.dart';

import '../components/auth_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isChecked = false;
  bool obscureText = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      
      // stop the loading circle when the user is logged in
      Navigator.pop(context);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const HomeBottomBar(), // Replace YourHomePage with the actual homepage widget
        ),
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      // show specific error message
      showErrorMessage(e.code);
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
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //name field
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.01,
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.height * 0.035,
                    horizontal: size.width * 0.03,
                  ),
                  filled: true,
                  fillColor: Colors.grey[600],
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[900],
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.001),
            //password field
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.01,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.height * 0.035,
                    horizontal: size.width * 0.04,
                  ),
                  filled: true,
                  fillColor: Colors.grey[600],
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[900],
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Forgot Password
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: size.width * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.04,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Sign In Button
            Button(
              onTap: signInUser,
              text: "Sign In",
            ),
            SizedBox(height: size.height * 0.0001),
            // Sign Up Linkrr
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Do you have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: textColor,
                    ),
                  ),
                  SizedBox(width: size.width * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: mainHeading,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
