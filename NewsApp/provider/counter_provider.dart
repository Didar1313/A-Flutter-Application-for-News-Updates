import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  var count=0;

  void incrementCount(){
    count+=1;
    notifyListeners();   //this is a build in function, when it execute, it rebuild the ui or update the data.
  }

  void decrementCount(){
    count-=1;
    notifyListeners();   //this is a build in function, when it execute, it rebuild the ui or update the data.
  }
}