import 'dart:convert' as convert;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';

part 'saveBookingNotifier.g.dart';

// save booking call to the api to save.
@riverpod
Future<bool> BookingSaveNotifier(Ref ref,{required String email,required List<YogaClassCombinedviewModel> YogaClassIds}) async{
  final shoppingNotifier = ref.read(ShoppingCartProvider.notifier);
  Uri uri = Uri.http("192.168.1.35:8080", "/api/book/save");
  var response = await http.post(
    uri,
    headers: {"content-type":"application/json; charset=utf-8"},
    body: convert.jsonEncode(<String, dynamic>{
      "email": email,
      "YogaClassIds": YogaClassIds.map((m) => m.yogaClassId).toList(),
    }),
  );
  if (response.statusCode == 200) {
    shoppingNotifier.reset();
    return true;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return false;
  }
}