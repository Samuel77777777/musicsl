import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicsl/colors/colors.dart';
import 'package:musicsl/components/auth_button.dart';
class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                "Your Account has\n been Created",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: mainHeading),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const Image(
              image: AssetImage("./assets/account.png"),
              width: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            Button(text: "Continue", onTap: () {})
          ],
        ),
      ),
    );
  }
}
