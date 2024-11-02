import 'package:flutter/material.dart';
import 'package:yoga_assignment1/models/BookingModel.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/screen/detailScreen.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class BookingCardComponent extends StatelessWidget {
  late BookingModel viewModel;
  late bool b;

  BookingCardComponent({super.key, required viewModel, b = true}) {
    this.viewModel = viewModel;
    this.b = b;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context ,MaterialPageRoute(builder: (context) => DetailScreen(YogaClassId: viewModel.yogaClassId,)))
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  viewModel.YogaTitle,
                  style: SecondaryHeaderTextStyles
              ),
              SizedBox.fromSize(size: Size.fromHeight(10)),
              Table(children: [
                TableRow(children: [
                  TableCell(child: Text("Teacher Name")),
                  TableCell(
                      child: Text(viewModel.TeacherName))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Start Date")),
                  TableCell(child: Text(viewModel.Date))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Day Of Week")),
                  TableCell(
                      child: Text(viewModel.DayOfWeek))
                ]),
                TableRow(children: [
                  TableCell(child: Text("Time Of Day")),
                  TableCell(
                    child: Text((viewModel.TimeOfDay == null?  "-":  viewModel.TimeOfDay!),),)
                ]),
                TableRow(children: [
                  TableCell(child: Text("Time Of Day")),
                  TableCell(
                    child: Text((viewModel.TimeOfDay == null?  "-":  viewModel.TimeOfDay!),),)
                ]),
              ]),
              SizedBox.fromSize(size: Size.fromHeight(10)),

            ],
          ),
        ),
      ),
    );
  }
}
