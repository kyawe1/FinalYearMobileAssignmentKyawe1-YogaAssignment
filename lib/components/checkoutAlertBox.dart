import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';

import '../providers/saveBookingNotifier.dart';

Future<void> alertCheckOut(
    BuildContext context, WidgetRef ref, bool saveable) async {
  final shoppingCart = ref.read(ShoppingCartProvider.notifier);
  final email = ref.read(EmailProvider.notifier);
  final controller = TextEditingController();
  return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Order the Yoga Classes"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  errorText: (controller.text == "" ||
                          controller.text.isEmpty == true ||
                          controller.text.trim() == "")
                      ? "Email is Required"
                      : ""),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    if (controller.text == "" || controller.text.isEmpty == true || controller.text.trim() == ""){
                      return;
                    }
                    email.setEmail(controller.text);
                    if (saveable) {
                      var i =ref.watch(
                        BookingSaveNotifierProvider(
                          email: controller.text,
                          YogaClassIds: shoppingCart.getList(),
                        ),
                      );
                      if(i.value == true && i.value !=null){
                        shoppingCart.reset();
                      }
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Ok")),
            ]);
      });
}

bool checkRequired(String Email) {
  if (Email == "" || Email.isEmpty == true || Email.trim() == "") {
    return true;
  } else {
    return false;
  }
}
