import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/components/BookingCardComponent.dart';
import 'package:yoga_assignment1/models/BookingModel.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/YogaBookingListNotifier.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class BookingScreen extends ConsumerWidget {
  BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(EmailProvider);
    final bookingList = ref.watch(yogaBookingClassListProvider);

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Bookings :", style: SecondaryHeaderTextStyles),
        SizedBox.fromSize(
          size: const Size.fromHeight(5),
        ),
        Expanded(
            flex: 100,
            child: bookingList.when(
              loading: () => Text("loading"),
              data: (data) {
                return data.length == 0
                    ? Text("Nothing booked !")
                    : FinalWidget(context, ref, data);
              },
              error: (error, stackTrace) {
                if (email != "") {
                  return Text("Please Check Your Internet",style: SecondaryHeaderTextStyles.copyWith(inherit: true,color: Colors.red));
                } else {
                  return Text("Need to Add Email to view Booking View",style: SecondaryHeaderTextStyles.copyWith(inherit: true,color: Colors.red));
                }
              },
            )),
      ],
    );
  }

  Widget FinalWidget(
      BuildContext context, WidgetRef ref, List<BookingModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return BookingCardComponent(
          viewModel: data[index],
          b: true,
        );
      },
    );
  }
}
