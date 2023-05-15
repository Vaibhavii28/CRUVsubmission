class SeatModel {
  int number;
  bool selected;
  bool available;
  String type;
  bool upperBlock;
  @override
  String toString() {
    return 'SeatModel{number: $number, selected: $selected, available: $available, type: $type, upperBlock: $upperBlock}';
  }

  SeatModel({
     required this.number,required this.available, required this.selected, required this.type, required this.upperBlock,
  });


}