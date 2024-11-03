import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/components/cardComponent.dart';
import 'package:yoga_assignment1/enums.dart';
import 'package:yoga_assignment1/models/yogaClassModel.dart';
import 'package:yoga_assignment1/providers/EmailNotifier.dart';
import 'package:yoga_assignment1/providers/ShoppingCartNotifier.dart';
import 'package:yoga_assignment1/providers/YogaClassesSearchNotifier.dart';
import 'package:yoga_assignment1/styles/TextStyle.dart';
// Search Screen Stateful widget.
class SearchScreen extends ConsumerStatefulWidget {
  SearchScreen({super.key});

  final list = <String>[
    "",
    "Monday",
    "Tuesday",
    "Friday",
    "Wednesday",
    "Thrusday",
    "saturaday",
    "sunday",
  ];

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchState();
  }
}
// search State for Search Screen
class _SearchState extends ConsumerState<SearchScreen> {
  String teacherName = "";
  String DayOfWeek = "";
  DateTime timeOfDay = DateTime.now();
  bool visible = false;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final AsyncValue<List<YogaClassCombinedviewModel>> list =
        ref.watch(YogaclassessearchnotifierProvider);
    final something = ref.watch(ShoppingCartProvider);
    final email = ref.watch(EmailProvider);

    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: "Type Teacher Name to Search",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => {
            setState(() {
              print(teacherName);
              teacherName = value;
            })
          },
        ),
        SizedBox.fromSize(size: const Size.fromHeight(5)),
        Container(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                child: visible ? Text("Hide") : Text("Show"),
                onPressed: () => setState(() {
                      visible = !visible;
                    }))),
        Visibility(
          visible: visible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Advanced Search",style: SecondaryHeaderTextStyles),
              SizedBox.fromSize(size: const Size.fromHeight(5)),
              Container(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: DayOfWeek,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      DayOfWeek = value!;
                    });
                  },
                  items:
                      widget.list.map<DropdownMenuItem<String>>((String value) {
                    print(value);
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () async {
                    TimeOfDay? times = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: child!,
                        );
                      },
                    );
                    setState(() {
                      var now = DateTime.now();
                      var time= DateTime(now.year,now.month,now.day,times!.hour,times.minute);
                      timeOfDay = time;
                      textController.text = times.format(context);
                    });
                  },
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: "Pick Time"),
                    enabled: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox.fromSize(size: const Size.fromHeight(5)),
        ElevatedButton(
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                Text("Search"),
              ],
            ),
            onPressed: () => {
                  ref
                      .read(YogaclassessearchnotifierProvider.notifier)
                      .YogaClassSearchList(
                          teacherName: teacherName,
                          DayOfWeek: DayOfWeek,
                          TimeOfDay: timeOfDay,
                          email : email)
                }),
        Expanded(
          child: list.when(
            loading: () => Text("loading"),
            data: (data) => FinalWidget(context, ref, data),
            error: (error, stackTrace) {
              return Text("Please Check Your Internet");
            },
          ),
        )
      ],
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
            i: data[index].isBooked == true
                ? OrderState.Order
                : OrderState.None);
      },
    );
  }
}
