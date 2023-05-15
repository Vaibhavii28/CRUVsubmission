import 'package:cruv_submission/provider/selected_provider.dart';
import 'package:cruv_submission/utils/constants.dart';
import 'package:cruv_submission/widgets/SearchBar.dart';
import 'package:cruv_submission/widgets/seat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/seat_model.dart';

class SeatsGrid extends StatelessWidget {
  SeatsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryBlue,
          title: Text(
            'Seat Finder',
            style: GoogleFonts.cookie(fontSize: 50),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SeatSearchBar(),
            Consumer<SelectedProvider>(builder: (context, value, child) {
              return Container(
                color: const Color(0xFFf6f6f6),
                child: ListView.builder(
                    itemCount: (value.seatModelList.length) ~/ 32,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            seatRows(0, value.seatModelList),
                            seatRows(1, value.seatModelList),
                            seatRows(2, value.seatModelList),
                            seatRows(3, value.seatModelList),
                          ],
                        ),
                      );
                    }),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<SelectedProvider>(
                    builder: (context, selectedProvider, child) {
                  SeatModel selectedSeatModel = selectedProvider
                      .seatModelList[selectedProvider.selectedseat - 1];
                  return Center(
                    child: Row(
                      children: [
                        Text(
                            'Seat Status: ${selectedSeatModel.available ? 'Available' : 'Booked'}', style: GoogleFonts.merriweather(color: kBlack, fontSize: 15),),
                        const SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            selectedProvider.toggleBookingStatus();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: kPrimaryBlue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                selectedSeatModel.available ? 'Book' : 'Unbook',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                })
              ],
            ),
          ]),
        ));
  }

  seatRows(int row, List seats) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Seat(seatModel: seats[8 * row]),
                Seat(seatModel: seats[8 * row + 1]),
                Seat(seatModel: seats[8 * row + 2]),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Seat(seatModel: seats[8 * row + 6]),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Seat(seatModel: seats[8 * row + 3]),
                Seat(seatModel: seats[8 * row + 4]),
                Seat(seatModel: seats[8 * row + 5]),
              ],
            ),
            Seat(seatModel: seats[8 * row + 7]),
          ],
        )
      ],
    );
  }
}
