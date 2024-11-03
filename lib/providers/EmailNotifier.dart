import 'package:flutter_riverpod/flutter_riverpod.dart';

/// global email handler for user entered email
class EmailNotifier extends AutoDisposeNotifier<String>{
  @override
  String build() {
    // TODO: implement build
    return "";
  }
  // set the state
  void setEmail(String email){
    state = email;
  }
  // check is empty or not
  bool checkEmail(){
    if(state.trim() == "" || state == ""){
      return false;
    }
    return true;
  }
  // get the state
  String getEmail(){
    return state;
  }
}

// define email provider
final EmailProvider = AutoDisposeNotifierProvider<EmailNotifier,String>(EmailNotifier.new);