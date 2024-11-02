package org.backend.kzh.dao;

import org.backend.kzh.entities.YogaClasses;

public class YogaClassesListDAO {
	public YogaClassesListDAO() {

	}

	public YogaClassesListDAO(YogaClasses parent,String email) {
		Id = parent.getId();
		AdditionalComments = parent.getAdditionalComments();
		Date = parent.getDate();
		TeacherName = parent.getTeacherName();
		YogaId = parent.getYogaId();
		YogaTitle = parent.getYoga().getName();
		DayOfWeek = parent.getYoga().getDayOfWeek();
		TimeOfDay = parent.getYoga().getTimeOfClass();
		Price = parent.getYoga().getPrice().doubleValue();
		var i = parent.getBook().stream().filter((m)-> m.getEmail().equals(email)).findFirst();
		IsBooked = i.isPresent();
	}

	public String Id;
	public String AdditionalComments;
	public String Date;
	public String TeacherName;
	public String YogaId;
	public String YogaTitle;
	public String DayOfWeek;
	public String TimeOfDay;
	public double Price;
	public boolean IsBooked;
}
