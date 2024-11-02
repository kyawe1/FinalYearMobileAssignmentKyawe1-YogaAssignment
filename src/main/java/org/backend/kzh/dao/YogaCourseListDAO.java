package org.backend.kzh.dao;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.backend.kzh.entities.YogaCourses;

public class YogaCourseListDAO {
	public YogaCourseListDAO() {

	}

	public YogaCourseListDAO(YogaCourses yogaCourse) {
		id = yogaCourse.getId();
		createdAt = yogaCourse.getCreatedAt();
		updatedAt = yogaCourse.getUpdatedAt();
		Capacity = yogaCourse.getCapacity();
		DayOfWeek = yogaCourse.getDayOfWeek();
		Description = yogaCourse.getDescription();
		Name = yogaCourse.getName();
		Price = yogaCourse.getPrice();
		Level = yogaCourse.getLevel();
		TimeOfClass = yogaCourse.getTimeOfClass();
		TypeOfClass = yogaCourse.getTypeOfClass();
		Duration = yogaCourse.getDuration();
	}

	public String id;
	public LocalDateTime createdAt;
	public LocalDateTime updatedAt;
	public long Capacity;
	public String DayOfWeek;
	public String Description;
	public String Name;
	public BigDecimal Price;
	public String Level;
	public String TimeOfClass;
	public String TypeOfClass;
	public int Duration;
}
