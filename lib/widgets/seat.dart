import 'package:cruv_submission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cruv_submission/models/seat_model.dart';
import 'package:google_fonts/google_fonts.dart';

class Seat extends StatelessWidget {
  Seat({super.key, required this.seatModel});
    SeatModel seatModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: seatModel.upperBlock? AlignmentDirectional.topCenter: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height/20,
          width: MediaQuery.of(context).size.width/5,
          decoration: const BoxDecoration(
            color: kDarkGrey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            //
            Container(
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.height/15,
              decoration: BoxDecoration(
                color: seatModel.selected ? kPrimaryBlue : (seatModel.available ? kPrimaryWhite : kBookedGrey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${seatModel.number}',
                  style: GoogleFonts.lato(color: seatModel.selected ? kPrimaryWhite  : (seatModel.available ? kBlack: kBookedText), fontSize: 12, )
                  ),
                Text(
                  seatModel.type,
                  style: GoogleFonts.lato(color: seatModel.selected ? kPrimaryWhite  : (seatModel.available ? kBlack: kBookedText), fontSize: 10, )  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
