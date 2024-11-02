package org.backend.kzh.requests;

import java.time.LocalDateTime;

public class YogaClassFindRequest {
	public String teacherName;
	public String dayOfWeek;
	public String timeOfDay;
	public boolean isEmpty() {
		if(teacherName.isBlank() && teacherName.isEmpty() && dayOfWeek.isBlank() && dayOfWeek.isEmpty() && timeOfDay.isBlank() && timeOfDay.isEmpty()) {
			return true;
		}
		return false;
	}
}
