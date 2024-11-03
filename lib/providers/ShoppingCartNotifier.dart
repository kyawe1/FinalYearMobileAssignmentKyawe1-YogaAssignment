import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/YogaClassesListNotifier.dart';

// shopping global state handler.
class ShoppingCartNotifier extends  StateNotifier<List<YogaClassCombinedviewModel>>{
  ShoppingCartNotifier() : super([]);

  @override
  build() {
    // TODO: implement build
    return [];
  }
  // add to the state
  String addShoppingCart(YogaClassCombinedviewModel model){
    state.add(model);
    return " Added ";
  }
  // get the state
  List<YogaClassCombinedviewModel> getList(){
    return state;
  }
  // remove the object from the state
  String removeShoppingCart(YogaClassCombinedviewModel model){
    var list= state.where((e) => e.yogaClassId != model.yogaClassId).toList();
    print("LIst length is :" + list.length.toString());
    state = list;
    return " Removed ";
  }
  // check exists with primary key
  bool checkExists(String YogaClassId){
    return state.any((e) => e.yogaClassId == YogaClassId);
  }
  // clear all the shopping carted items
  bool reset(){
    state =[];
    return true;
  }
}

final ShoppingCartProvider = StateNotifierProvider<ShoppingCartNotifier, List<YogaClassCombinedviewModel>>((ref) {
  return ShoppingCartNotifier();
});