package org.backend.kzh.dao;

import org.backend.kzh.entities.YogaClasses;

public class YogaClassDetailDto {
	public YogaCourseListDAO yogaCourse;
	public YogaClassesListDAO yogaClass;
	
	public YogaClassDetailDto(YogaClasses classes,String email) {
		yogaCourse = new YogaCourseListDAO(classes.getYoga());
		yogaClass = new YogaClassesListDAO(classes,email);
	}
	
}
