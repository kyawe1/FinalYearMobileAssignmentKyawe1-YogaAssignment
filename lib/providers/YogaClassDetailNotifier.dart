import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_assignment1/models/YogaClassDetailModel.dart';

class YogaClassDetailNotifier
    extends AutoDisposeAsyncNotifier<YogaClassDetailModel?> {
  YogaClassDetailNotifier();

  @override
  YogaClassDetailModel? build() {
    return null;
  }

  void YogaClassDetailList(
      {required String yogaClassId, required String email}) async {
    await Future.delayed(Duration(seconds:1));
    state = AsyncValue.data(YogaClassDetailModel(
        "yogaClassId",
        "Date",
        "TeacherName",
        "YogaId",
        "YogaTitle",
        "DayOfWeek",
        "TimeOfDay",
        false,
        100,
        "Description",
        "Name",
        100.10,
        "Level",
        "TypeOfClass",
        5));
  }
}

final YogaClassDetailNotifierProvider = AutoDisposeAsyncNotifierProvider<
    YogaClassDetailNotifier, YogaClassDetailModel?>(() {
  return YogaClassDetailNotifier();
});
