import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';

import '../providers/saveBookingNotifier.dart';

Future<void> alertCheckOut(
    BuildContext context, WidgetRef ref, bool saveable) async {
  final shoppingCart = ref.read(ShoppingCartProvider.notifier);
  final email = ref.read(EmailProvider.notifier);
  var controller = TextEditingController();
  return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Order the Yoga Classes"),
            content: TextField(
              controller: controller,
              decoration:
                  const InputDecoration(labelText: "Email", hintText: "Email"),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    email.setEmail(controller.text);
                    if (saveable) {
                      ref.watch(
                        BookingSaveNotifierProvider(
                          email: controller.text,
                          YogaClassIds: shoppingCart.getList(),
                        ),
                      );
                      shoppingCart.reset();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Ok")),
            ]);
      });
}
