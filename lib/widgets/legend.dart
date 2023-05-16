import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
class legend extends StatelessWidget {
  const legend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf6f6f6),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Available: ', style: GoogleFonts.merriweather(color: kBlack, fontSize: 15), ),
            Container(width: 20, height: 20, decoration: BoxDecoration(
              color: kPrimaryWhite,
              borderRadius: BorderRadius.circular(5),
              border:Border.all(color: Colors.black, width: 2),
            ),),
            SizedBox(width: 10,),
            Text('Selected: ', style: GoogleFonts.merriweather(color: kBlack, fontSize: 15), ),
            Container(width: 20, height: 20, decoration: BoxDecoration(
              color: kPrimaryBlue,
              borderRadius: BorderRadius.circular(5),
              border:Border.all(color: Colors.black, width: 2),
            ),),
            SizedBox(width: 10,),
            Text('Booked: ', style: GoogleFonts.merriweather(color: kBlack, fontSize: 15), ),
            Container(width: 20, height: 20, decoration: BoxDecoration(
              color: kBookedGrey,
              borderRadius: BorderRadius.circular(5),
              border:Border.all(color: Colors.black, width: 2),
            ),),
          ],
        ),
      ),
    );
  }
}
