// api response object
class BookingModel {
  String yogaClassId;
  String Date;
  String TeacherName;
  String YogaId;
  String YogaTitle;
  String DayOfWeek;
  String? TimeOfDay;
  String? UserEmail;

  BookingModel(this.yogaClassId, this.Date, this.TeacherName, this.YogaId,
      this.YogaTitle, this.DayOfWeek, this.TimeOfDay, this.UserEmail);

  // mapper to object from json
  static BookingModel toModel(Map<String, dynamic> map) {
    return BookingModel(
        map["Id"],
        map["Date"],
        map["TeacherName"],
        map["YogaId"],
        map["YogaTitle"],
        map["DayOfWeek"],
        map["TimeOfWeek"],
        map["email"]);
  }
}
