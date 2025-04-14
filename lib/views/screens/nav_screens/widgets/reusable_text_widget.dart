import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ReusableTextWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(
            title,
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF000000),
            ),
          ),
          
          Text(
            subtitle,
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
       
    );
  }
}