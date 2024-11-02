import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider =
      NotifierProvider<Bottomnavigator, int>(Bottomnavigator.new);

class Bottomnavigator extends Notifier<int>{
  int build(){
    return 0;
  }

  changeState(int changeValue){
    state = changeValue;
  }
}