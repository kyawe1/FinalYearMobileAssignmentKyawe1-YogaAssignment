import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';

class EmailScreen extends ConsumerWidget{
  EmailScreen(){

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final notifier = ref.read(EmailProvider.notifier);
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        const Text("Yoga Class Client Application",style: SecondaryHeaderTextStyles),
        TextField(
          controller : controller,
          decoration: InputDecoration(
            hintText: "sample@gmail.com",
            labelText: "Email",
          ),
        ),
        ElevatedButton(onPressed: ()=> notifier.setEmail(controller.text), child: const Text("Start Now >>>"))
      ],
    );
  }

}