class YogaClassDetailModel {
  String yogaClassId;
  String Date;
  String TeacherName;
  String YogaId;
  String YogaTitle;
  String DayOfWeek;
  String? TimeOfDay;
  bool? isBooked = false;

  int Capacity;
  String Description;
  String Name;
  double Price;
  String Level;
  String TypeOfClass;
  int Duration;

  YogaClassDetailModel(
      this.yogaClassId,
      this.Date,
      this.TeacherName,
      this.YogaId,
      this.YogaTitle,
      this.DayOfWeek,
      this.TimeOfDay,
      this.isBooked,
      this.Capacity,
      this.Description,
      this.Name,
      this.Price,
      this.Level,
      this.TypeOfClass,
      this.Duration);

  static YogaClassDetailModel toModel(Map<String, dynamic> map) {
    return YogaClassDetailModel(
        map["yogaClass"]["Id"],
        map['yogaClass']["Date"],
        map['yogaClass']["TeacherName"],
        map['yogaClass']["YogaId"],
        map['yogaClass']["YogaTitle"],
        map['yogaClass']["DayOfWeek"],
        map['yogaClass']["TimeOfWeek"],
        map['yogaClass']['is_booked'],
        map['yogaCourse']['Capacity'],
        map['yogaCourse']['Description'],
        map['yogaCourse']['Name'],
        map['yogaCourse']['Price'],
        map['yogaCourse']['Level'],
        map['yogaCourse']['TypeOfClass'],
        map['yogaCourse']['Duration']
    );
  }
}
