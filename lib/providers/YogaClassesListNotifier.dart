import 'dart:convert' as convert;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';



Future<List<YogaClassCombinedviewModel>> fetchYogaClasses(bool internet, String email) async {
  if (internet) {
    late Uri uri;
    if(email != ""){
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/all/${email}" );
    }
    else{
      uri = Uri.http("192.168.1.35:8080", "/api/yoga/all" );
    }

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return List<YogaClassCombinedviewModel>.from(
            jsonResponse['model'].map((e) => YogaClassCombinedviewModel.toModel(e))
        );
      } else {
        throw Exception('Failed to fetch data with status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to process data: ${e.toString()}');
    }
  }
  // Fallback data, if no internet is available
  await Future.delayed(Duration(seconds: 2)); // simulate delay
  return List<YogaClassCombinedviewModel>.generate(10, (index) => YogaClassCombinedviewModel(
      "yogaClassId$index",
      DateTime.now().toUtc().toIso8601String(),
      "TeacherName$index",
      "YogaId$index",
      "YogaTitle$index",
      "DayOfWeek$index",
      "TimeOfDay$index",
      null
  ));
}

final yogaClassListProvider = FutureProvider.autoDispose<List<YogaClassCombinedviewModel>>((ref) {
  final email = ref.watch(EmailProvider);
  return fetchYogaClasses(true, email);
});