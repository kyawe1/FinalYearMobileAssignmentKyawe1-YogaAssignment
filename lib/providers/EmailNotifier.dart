import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailNotifier extends AutoDisposeNotifier<String>{
  @override
  String build() {
    // TODO: implement build
    return "";
  }

  void setEmail(String email){
    state = email;
  }

  bool checkEmail(){
    if(state.trim() == "" || state == ""){
      return false;
    }
    return true;
  }

  String getEmail(){
    return state;
  }
}

final EmailProvider = AutoDisposeNotifierProvider<EmailNotifier,String>(EmailNotifier.new);