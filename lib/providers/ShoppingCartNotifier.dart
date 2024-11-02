import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/YogaClassesListNotifier.dart';


class ShoppingCartNotifier extends  StateNotifier<List<YogaClassCombinedviewModel>>{
  ShoppingCartNotifier() : super([]);

  @override
  build() {
    // TODO: implement build
    return [];
  }

  String addShoppingCart(YogaClassCombinedviewModel model){
    state.add(model);
    return " Added ";
  }

  List<YogaClassCombinedviewModel> getList(){
    return state;
  }

  String removeShoppingCart(YogaClassCombinedviewModel model){
    var list= state.where((e) => e.yogaClassId != model.yogaClassId).toList();
    print("LIst length is :" + list.length.toString());
    state = list;
    return " Removed ";
  }

  bool checkExists(String YogaClassId){
    return state.any((e) => e.yogaClassId == YogaClassId);
  }
  bool reset(){
    state =[];
    return true;
  }
}

final ShoppingCartProvider = StateNotifierProvider<ShoppingCartNotifier, List<YogaClassCombinedviewModel>>((ref) {
  return ShoppingCartNotifier();
});