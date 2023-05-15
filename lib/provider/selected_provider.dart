import 'package:cruv_submission/models/seat_model.dart';
import 'package:cruv_submission/utils/seat_blocks.dart';
import 'package:flutter/material.dart';

class SelectedProvider with ChangeNotifier {
  List<SeatModel> seatModelList = seatDetails();
  int selectedseat = 1;

  selectedSeat(int chosenseat) {
    for (int i = 0; i < seatModelList.length; i++) {
      seatModelList[i].selected = (i + 1) == chosenseat;
    }
    seatModelList[chosenseat - 1].selected = true;
    selectedseat = chosenseat;
    notifyListeners();
  }

  void toggleBookingStatus() {
    SeatModel selectedSeatModel = seatModelList[selectedseat - 1];
    selectedSeatModel.available = !selectedSeatModel.available;
    notifyListeners();
  }

}
