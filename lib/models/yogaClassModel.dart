class YogaClassCombinedviewModel {
  String yogaClassId;
  String Date;
  String TeacherName;
  String YogaId;
  String YogaTitle;
  String DayOfWeek;
  String? TimeOfDay;
  bool? isBooked = false;

  YogaClassCombinedviewModel(this.yogaClassId, this.Date, this.TeacherName,
      this.YogaId, this.YogaTitle, this.DayOfWeek, this.TimeOfDay,this.isBooked);

  static YogaClassCombinedviewModel toModel(Map<String, dynamic> map) {
    return YogaClassCombinedviewModel(map["Id"], map["Date"], map["TeacherName"], map["YogaId"], map["YogaTitle"], map["DayOfWeek"], map["TimeOfWeek"],map['is_booked']);
  }

}