import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/enums.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/screen/detailScreen.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class CardComponent extends ConsumerStatefulWidget {
  late YogaClassCombinedviewModel viewModel;
  late bool b;

  CardComponent(
      {super.key, required viewModel, required OrderState i, b = true}) {
    this.viewModel = viewModel;
    this.b = b;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _CardState();
  }
}

class _CardState extends ConsumerState<CardComponent> {
  OrderState added = OrderState.None;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(ShoppingCartProvider.notifier);
    final shoppingCart = ref.watch(ShoppingCartProvider);
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderScope(
              child: DetailScreen(YogaClassId : this.widget.viewModel.yogaClassId),
            ),
          ),
        )
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(this.widget.viewModel.YogaTitle,
                  style: SecondaryHeaderTextStyles),
              SizedBox.fromSize(size: Size.fromHeight(10)),
              Table(children: [
                TableRow(children: [
                  TableCell(child: Text("Teacher Name")),
                  TableCell(child: Text(this.widget.viewModel.TeacherName))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Start Date")),
                  TableCell(child: Text(this.widget.viewModel.Date))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Day Of Week")),
                  TableCell(child: Text(this.widget.viewModel.DayOfWeek))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Time Of Day")),
                  TableCell(
                    child: Text(
                      (this.widget.viewModel.TimeOfDay == null
                          ? "-"
                          : this.widget.viewModel.TimeOfDay!),
                    ),
                  )
                ]),
              ]),
              SizedBox.fromSize(size: Size.fromHeight(10)),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Consumer(builder: (context, ref, _) {
                  if (widget.viewModel.isBooked == true) {
                    return IconButton(
                        onPressed: null, icon: Icon(Icons.disabled_by_default));
                  }
                  else if (shoppingCart.any((p)=>  p.yogaClassId == this.widget.viewModel.yogaClassId)) {
                    return IconButton(
                        onPressed: () => {
                              notifier
                                  .removeShoppingCart(this.widget.viewModel),
                              setState(() {
                                added = OrderState.None;
                              }),
                            },
                        icon: Icon(Icons.remove_shopping_cart));
                  }
                  return IconButton(
                      onPressed: () => {
                            notifier.addShoppingCart(this.widget.viewModel),
                            setState(() {
                              added = OrderState.ShoppingCart;
                            }),
                          },
                      icon: Icon(Icons.add_shopping_cart));
                })
              ])
            ],
          ),
        ),
      ),
    );
  }
}
