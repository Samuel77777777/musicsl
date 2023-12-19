import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialSignIn extends StatefulWidget {
  const SocialSignIn({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.text,
  });

  final String imagePath;
  final VoidCallback onTap;
  final String text;

  @override
  State<SocialSignIn> createState() => _SocialSignInState();
}

class _SocialSignInState extends State<SocialSignIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          width: size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Color(0xFFF5F9FE),
          ),
          child: GestureDetector(
            child: Row(
              children: [
                Image(
                  image: AssetImage(widget.imagePath),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  widget.text,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.04,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
