import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:yoga_assignment1/models/BookingModel.dart';



final bookingListProvider = FutureProvider.autoDispose.family<List<BookingModel>, String>((ref, email) async {
  Uri uri = Uri.http("192.168.1.35:8080", "/api/yoga/all", {'email': email});
  try {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<BookingModel> list = (jsonResponse['model'] as List)
          .map<BookingModel>((e) => BookingModel.toModel(e))
          .toList();
      return list;
    } else {
      ref.invalidateSelf();
      throw Exception('Failed to load bookings with status code: ${response.statusCode}');
    }
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to load data: ${e.toString()}');
  }
});