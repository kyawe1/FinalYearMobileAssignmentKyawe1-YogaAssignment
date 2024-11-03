import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';

import '../providers/saveBookingNotifier.dart';

Future<void> alertCheckOut(
    BuildContext context, WidgetRef ref, bool saveable) async {
  final shoppingCart = ref.read(ShoppingCartProvider.notifier);
  final email = ref.read(EmailProvider.notifier);
  var controller = "";
  var initial=true;
  return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Order the Yoga Classes"),
            content: StatefulBuilder(
              builder: (context,setState){
                return TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      errorText: (initial != true && (controller == "" ||
                          controller.isEmpty == true ||
                          controller.trim() == ""))
                          ? "Email is Required"
                          : null),
                  onChanged: (value){
                    setState((){
                      initial=false;
                      controller = value;
                    });
                  },
                );
              }
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    if (controller == "" || controller.isEmpty == true || controller.trim() == ""){
                      return;
                    }
                    email.setEmail(controller);
                    if (saveable) {
                      var i =ref.watch(
                        BookingSaveNotifierProvider(
                          email: controller,
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
