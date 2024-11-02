import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/models/YogaClassDetailModel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class YogaClassDetailNotifier
    extends AutoDisposeAsyncNotifier<YogaClassDetailModel?> {
  YogaClassDetailNotifier();

  @override
  YogaClassDetailModel? build() {
    return null;
  }

  void YogaClassDetailList(
      {required String yogaClassId, required String email}) async {
    late Uri uri;
    if(email != ""){
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/detail/${yogaClassId}/${email}" );
    }
    else{
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/detail/${yogaClassId}" );
    }

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        YogaClassDetailModel? model = YogaClassDetailModel.toModel(jsonResponse['model']);
        state = AsyncData(model);
        return;
      } else {
        throw Exception('Failed to fetch data with status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to process data: ${e.toString()}');
    }
    
    
    // await Future.delayed(Duration(seconds:1));
    // state = AsyncValue.data(YogaClassDetailModel(
    //     "yogaClassId",
    //     "Date",
    //     "TeacherName",
    //     "YogaId",
    //     "YogaTitle",
    //     "DayOfWeek",
    //     "TimeOfDay",
    //     false,
    //     100,
    //     "Description",
    //     "Name",
    //     100.10,
    //     "Level",
    //     "TypeOfClass",
    //     5));
  }
}

final YogaClassDetailNotifierProvider = AutoDisposeAsyncNotifierProvider<
    YogaClassDetailNotifier, YogaClassDetailModel?>(() {
  return YogaClassDetailNotifier();
});
