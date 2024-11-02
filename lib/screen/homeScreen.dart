import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/components/cardComponent.dart';
import 'package:yoga_assignment1/enums.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/providers/YogaClassesListNotifier.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<YogaClassCombinedviewModel>> list = ref.watch(yogaClassListProvider);

    // TODO: implement build
    return list.when(
        loading: () => Text("loading"),
        data: (data) => FinalWidget(context, ref, data),
        error: (error,stackTrace)  { print(stackTrace);  print("error"); print(error); return Text("Hello World"); });
  }

  Widget FinalWidget(BuildContext context, WidgetRef ref,
      List<YogaClassCombinedviewModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CardComponent(
          viewModel: data[index],
          b: true,
          i : data[index].isBooked == true ? OrderState.Order : OrderState.None
        );
      },
    );
  }
}
