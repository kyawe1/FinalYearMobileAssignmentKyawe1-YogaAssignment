import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/models/YogaClassDetailModel.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/providers/YogaClassDetailNotifier.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class DetailScreen extends ConsumerStatefulWidget {
  String YogaClassId;

  DetailScreen({super.key, required String this.YogaClassId});

  @override
  ConsumerState createState() => _DetailState();
}

class _DetailState extends ConsumerState<DetailScreen> {
  bool isShopped = false;

  @override
  void initState() {
    // TODO: implement initState
    final YogaClassDetailNotifier list =
        ref.read(YogaClassDetailNotifierProvider.notifier);
    final email = ref.read(EmailProvider);
    final v = ref.read(ShoppingCartProvider.notifier);
    list.YogaClassDetailList(yogaClassId: widget.YogaClassId, email: email);
    isShopped = v.checkExists(widget.YogaClassId);
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(ShoppingCartProvider.notifier);
    final AsyncValue<YogaClassDetailModel?> list =
        ref.watch(YogaClassDetailNotifierProvider);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Class Detail", style: TitleTextStyle),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: list.when(
            loading: () => Text("Loading"),
            data: (data) => data == null
                ? Text("Loading")
                : FinalWidget(context, ref, data!, value),
            error: (exception, stackTrace) {
              print(Exception);
              return Text("Something Wrong");
            }),
      ),
    );
  }

  Widget FinalWidget(BuildContext context, WidgetRef ref,
      YogaClassDetailModel viewModel, ShoppingCartNotifier notifier) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title of Yoga Class", style: SecondaryHeaderTextStyles),
          SizedBox.fromSize(size: Size.fromHeight(10)),
          Container(
            alignment: Alignment.centerRight,
            child: Visibility(
              visible: viewModel.isBooked == null ? true : !viewModel.isBooked!,
              child: isShopped
                  ? ElevatedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.remove_shopping_cart),
                          Text("Remove From Cart"),
                        ],
                      ),
                      onPressed: () {
                        print("removing cart form detail Screen");
                        notifier.removeShoppingCart(
                          YogaClassCombinedviewModel(
                            widget.YogaClassId,
                            viewModel.Date,
                            viewModel.TeacherName,
                            viewModel.YogaId,
                            viewModel.YogaTitle,
                            viewModel.DayOfWeek,
                            viewModel.TimeOfDay,
                            viewModel.isBooked,
                            viewModel.Price
                          ),
                        );
                        setState(() {
                          isShopped = false;
                        });
                      })
                  : ElevatedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart),
                          Text("Add to Cart"),
                        ],
                      ),
                      onPressed: () {
                        print("adding cart form detail Screen");
                        notifier.addShoppingCart(
                          YogaClassCombinedviewModel(
                              widget.YogaClassId,
                              viewModel.Date,
                              viewModel.TeacherName,
                              viewModel.YogaId,
                              viewModel.YogaTitle,
                              viewModel.DayOfWeek,
                              viewModel.TimeOfDay,
                              viewModel.isBooked,
                              viewModel.Price),
                        );
                        setState(() {
                          isShopped = true;
                        });
                      }),
            ),
          ),
          SizedBox.fromSize(size: Size.fromHeight(10)),
          Table(children: [
            TableRow(children: [
              TableCell(child: Text("Teacher Name")),
              TableCell(child: Text(viewModel.TeacherName))
            ]),
            TableRow(children: [
              TableCell(child: Text("Start Date")),
              TableCell(child: Text(viewModel.Date))
            ]),
            TableRow(children: [
              TableCell(child: Text("Day Of Week")),
              TableCell(child: Text(viewModel.DayOfWeek))
            ]),
            TableRow(children: [
              TableCell(child: Text("Time Of Day")),
              TableCell(
                child: Text(
                  (viewModel.TimeOfDay == null ? "-" : viewModel.TimeOfDay!),
                ),
              )
            ]),
            TableRow(children: [
              TableCell(child: Text("Capacity")),
              TableCell(child: Text(viewModel.Capacity.toString()))
            ]),
            TableRow(children: [
              TableCell(child: Text("Price")),
              TableCell(child: Text(viewModel.Price.toString()))
            ]),
            TableRow(children: [
              TableCell(child: Text("Level")),
              TableCell(child: Text(viewModel.Level.toString()))
            ]),
            TableRow(children: [
              TableCell(child: Text("Type Of Class")),
              TableCell(child: Text(viewModel.TypeOfClass))
            ]),
            TableRow(children: [
              TableCell(child: Text("Duration")),
              TableCell(child: Text(viewModel.Duration.toString()))
            ]),
          ]),
          Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox.fromSize(size: Size.fromHeight(10)),
          Text(viewModel.Description),
        ],
      ),
    );
  }
}
