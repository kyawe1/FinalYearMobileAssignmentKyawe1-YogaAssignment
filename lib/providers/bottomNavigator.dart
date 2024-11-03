import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider =
      NotifierProvider<Bottomnavigator, int>(Bottomnavigator.new);

/// global state handler for tabnavigater
class Bottomnavigator extends Notifier<int>{
  int build(){
    return 0;
  }

  changeState(int changeValue){
    state = changeValue;
  }
}