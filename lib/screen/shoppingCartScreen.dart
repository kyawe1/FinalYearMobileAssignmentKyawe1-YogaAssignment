import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/components/cardComponent.dart';
import 'package:yoga_assignment1/components/checkoutAlertBox.dart';
import 'package:yoga_assignment1/enums.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/providers/saveBookingNotifier.dart';

class Shoppingcartscreen extends ConsumerWidget {
  Shoppingcartscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingItems = ref.watch(ShoppingCartProvider);
    final shoppingNotifier = ref.read(ShoppingCartProvider.notifier);
    final email = ref.watch(EmailProvider.notifier);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: FinalWidget(context, ref, shoppingItems),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(email.checkEmail()){
          ref.watch(BookingSaveNotifierProvider(
              email: email.getEmail(),
              YogaClassIds: shoppingItems));
          shoppingNotifier.reset();
          return;
        }
        alertCheckOut(context,ref,true);
      },child: Icon(Icons.shopping_cart_checkout_rounded)),
    );
  }

  Widget FinalWidget(BuildContext context, WidgetRef ref,
      List<YogaClassCombinedviewModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CardComponent(
          viewModel: data[index],
          b: true,
          i: OrderState.ShoppingCart
        );
      },
    );
  }
}
