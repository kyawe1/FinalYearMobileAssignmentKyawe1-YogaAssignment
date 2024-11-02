package org.backend.kzh.dao;

import org.backend.kzh.entities.Booking;
import org.backend.kzh.entities.YogaClasses;

public class BookingListDAO {
		public BookingListDAO() {

		}

		public BookingListDAO(Booking parent) {
			Id = parent.getYoga_class_id().getId();
			AdditionalComments = parent.getYoga_class_id().getAdditionalComments();
			Date = parent.getYoga_class_id().getDate();
			TeacherName = parent.getYoga_class_id().getTeacherName();
			YogaId = parent.getYoga_class_id().getYogaId();
			YogaClasses parent2 = parent.getYoga_class_id();
			YogaTitle = parent2.getYoga().getName();
			DayOfWeek = parent2.getYoga().getDayOfWeek();
			BookingId = parent.getId();
		}

		public String Id;
		public String AdditionalComments;
		public String Date;
		public String TeacherName;
		public String YogaId;
		public String YogaTitle;
		public String DayOfWeek;
		public String BookingId;
		public String Email;
}
