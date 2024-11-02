package org.backend.kzh.dao;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

import org.backend.kzh.entities.YogaCourses;

import com.fasterxml.jackson.annotation.JsonFormat;

public class YogaCourseCreateUpdateDAO {
	public YogaCourseCreateUpdateDAO() {

	}

	public YogaCourseCreateUpdateDAO(YogaCourses yogaCourse) {
		id = yogaCourse.getId();
//		createdAt = yogaCourse.getCreatedAt();
//		updatedAt = yogaCourse.getUpdatedAt();
		Capacity = yogaCourse.getCapacity();
		DayOfWeek = yogaCourse.getDayOfWeek();
		Description = yogaCourse.getDescription();
		Name = yogaCourse.getName();
		PricePerClass = yogaCourse.getPrice().toString();
		Level = yogaCourse.getLevel();
		TimeOfCourse = yogaCourse.getTimeOfClass();
		TypeOfClass = yogaCourse.getTypeOfClass();
		Duration = yogaCourse.getDuration();
	}

	public YogaCourses toYogaCourse() {
		YogaCourses yogaCourse = new YogaCourses();
		yogaCourse.setId(id);
//		yogaCourse.setCreatedAt(createdAt);
//		yogaCourse.setUpdatedAt(updatedAt);
		yogaCourse.setCapacity(Capacity);
		yogaCourse.setDayOfWeek(DayOfWeek);
		yogaCourse.setDescription(Description);
		yogaCourse.setName(Name);
		yogaCourse.setPrice(new BigDecimal(PricePerClass));
		yogaCourse.setLevel(Level);
		yogaCourse.setTimeOfClass(TimeOfCourse);
		yogaCourse.setTypeOfClass(TypeOfClass);
		yogaCourse.setDuration(Duration);
		return yogaCourse;
	}

	public String id;

	public long Capacity;
	public String DayOfWeek;
	public String Description;
	public String Name;
	public String PricePerClass;
	public String Level;
	public String TimeOfCourse;
	public String TypeOfClass;
	public int Duration;
	
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]")
//	public LocalDateTime createdAt;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]")
//	public LocalDateTime updatedAt;
}
