import 'package:cruv_submission/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/selected_provider.dart';
final ValueNotifier<bool> _isValid = ValueNotifier<bool>(false);
class SeatSearchBar extends StatelessWidget {
  const SeatSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
    Provider.of<SelectedProvider>(context,listen: false);
    final TextEditingController _seatcontroller = TextEditingController();


      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.blue)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _seatcontroller,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Seat Number',
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.merriweather(color: Colors.black, fontSize: 15),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_seatcontroller.text.isEmpty ||
                          int.parse(_seatcontroller.text) > 32 ||
                          int.parse(_seatcontroller.text) < 1) {
                        _isValid.value = true;
                      } else {
                        _isValid.value = false;
                       provider.selectedSeat(int.parse(_seatcontroller.text));
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.blue),
                            color: kPrimaryBlue),
                        child: Row(
                          children: [
                            Text(
                              'Find',
                              style: GoogleFonts.merriweather(color: Colors.white, fontSize: 15),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _isValid,
              builder: (context, value, child) {
                return Visibility(
                  visible: _isValid.value,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Please enter a valid seat number between 1 and 32!',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                );
              }),
        ],
      );

  }
}
