import 'package:cruv_submission/models/seat_model.dart';

seatDetails(){
  String type='';
  bool upperBlock=true;
  List<SeatModel> seatModel=[];

  for(int i=1; i<=32; i++)
    {
      if(i%8== 0)
        {
          type= 'S UPPER';
          upperBlock= false;
        }
      else if(i%8==1 || i%8==4)
        {
          type='LOWER';
          if(i%8==1)
            {
              upperBlock=true;
            }
          else
            upperBlock=false;
        }
      else if(i%8==2 || i%8==5)
        {
          type='MIDDLE';
          if(i%8==2)
            {
              upperBlock=true;
            }
          else
            upperBlock=false;
        }
      else if(i%8==3 || i%8==6)
        {
          type='UPPER';
          if(i%8==3)
            {
              upperBlock=true;
            }
          else
            upperBlock=false;
        }
      else if(i%8==7)
        {
          type='S LOWER';
          upperBlock=true;
        }
      seatModel.add(SeatModel(number: i, available: true, selected: false, type: type, upperBlock: upperBlock));
    }
  return seatModel;
}

