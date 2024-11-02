import 'dart:convert' as convert;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';

class Yogaclassessearchnotifier extends  AutoDisposeAsyncNotifier<List<YogaClassCombinedviewModel>>{
  Yogaclassessearchnotifier();

  @override
  List<YogaClassCombinedviewModel> build(){
    return [];
  }

  void YogaClassSearchList({required String teacherName,required String DayOfWeek, required DateTime TimeOfDay , required String email}) async{
    late Uri uri ;

    if(email != ""){
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/find/${email}");
    }
    else{
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/find");
    }

    var response = await http.post(
      uri,
      headers: {"content-type":"application/json; charset=utf-8"},
      body: convert.jsonEncode(<String, dynamic>{
        "teacherName": teacherName,
        "dayOfWeek": DayOfWeek,
        "timeOfDay": TimeOfDay.toIso8601String()
      }),
    );
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<YogaClassCombinedviewModel> list = jsonResponse['model']
          .map<YogaClassCombinedviewModel>(
              (e) => YogaClassCombinedviewModel.toModel(e))
          .toList();
      state =  AsyncData(list);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      state = AsyncData([]);
    }
  }


}

final YogaclassessearchnotifierProvider = AutoDisposeAsyncNotifierProvider<Yogaclassessearchnotifier, List<YogaClassCombinedviewModel>>(() {
  return Yogaclassessearchnotifier();
});