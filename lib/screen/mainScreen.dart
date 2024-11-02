import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/components/checkoutAlertBox.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/providers/bottomNavigator.dart';
import 'package:yoga_assignment1/screen/bookingScreen.dart';
import 'package:yoga_assignment1/screen/homeScreen.dart';
import 'package:yoga_assignment1/screen/searchScreen.dart';
import 'package:yoga_assignment1/screen/shoppingCartScreen.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // TODO: implement build
    return MaterialApp(
      title: "Yoga Assignment App",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _MainHomeScreen(),
    );
  }
}

final bodies = [
  HomeScreen(),
  SearchScreen(),
  BookingScreen(),
];

class _MainHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int navbottomIndex = ref.watch(bottomNavigationProvider);
    final shoppingItems = ref.watch(ShoppingCartProvider.notifier);
    final email = ref.watch(EmailProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Yoga Application", style: TitleTextStyle),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Shoppingcartscreen(),
                    ),
                  ),
                },
              ),
              IconButton(
                icon: email == "" || email.trim() == "" ? Icon(Icons.verified_outlined) : Icon(Icons.verified),
                onPressed: ()  {
                  if(email == "" || email.trim() == ""){
                    alertCheckOut(context, ref,false);
                    return;
                  }
                  return;
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_available), label: "Booked"),
            ],
            currentIndex: navbottomIndex,
            onTap: (value) => {
              ref.watch(bottomNavigationProvider.notifier).changeState(value)
            },
          ),
          body: Padding(
              padding: const EdgeInsets.all(8), child: bodies[navbottomIndex])),
    );
  }
}
