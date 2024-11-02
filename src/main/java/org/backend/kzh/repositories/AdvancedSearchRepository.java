package org.backend.kzh.repositories;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.backend.kzh.entities.Booking;
import org.backend.kzh.entities.YogaClasses;
import org.backend.kzh.requests.BookingSearchRequest;
import org.backend.kzh.requests.YogaClassFindRequest;
import org.springframework.stereotype.Repository;

import jakarta.persistence.Query;

import jakarta.persistence.EntityManager;

@Repository
public class AdvancedSearchRepository {
	private EntityManager manager;

	public AdvancedSearchRepository(EntityManager manager) {
		this.manager = manager;
	}

	public List<YogaClasses> searchYogaClasses(YogaClassFindRequest request) {
		if (!request.isEmpty()) {
			StringBuilder builder = new StringBuilder();
			builder.append(
					" select yoga_classes.* from yoga_classes join yogas on yogas.id = yoga_classes.yoga_id where 1=1 ");

			if (!request.teacherName.isEmpty() && !request.teacherName.isBlank()) {
				builder.append(" and teacher_name = :teacherName ");
			}

			else if (!request.dayOfWeek.isEmpty() && !request.dayOfWeek.isBlank()) {
				builder.append(" and day_of_week = :dow ");
			}

			else if (!request.timeOfDay.isEmpty() && !request.timeOfDay.isBlank()) {

				builder.append(" and time_of_course = :tod ");
			}

			Query query = manager.createNativeQuery(builder.toString(), YogaClasses.class);

			if (!request.teacherName.isEmpty() && !request.teacherName.isBlank()) {
				query.setParameter("teacherName", request.teacherName);
			}

			else if (!request.dayOfWeek.isEmpty() && !request.dayOfWeek.isBlank()) {
				query.setParameter("dow", request.dayOfWeek);
			}

			else if (!request.timeOfDay.isEmpty() && !request.timeOfDay.isBlank()) {
				var time = LocalDateTime.parse(request.timeOfDay);
				var localDateFormat = DateTimeFormatter.ofPattern("HH:mm");
				var timeString = localDateFormat.format(time);
				query.setParameter("tod", timeString);
			}

			List<YogaClasses> list = (List<YogaClasses>) query.getResultList();

			return list;
		}
		return new ArrayList<YogaClasses>();
	}

	public List<Booking> searchBooking(BookingSearchRequest request) {
		StringBuilder builder = new StringBuilder();
		builder.append(" select yoga_classes.* from booking where email=:email; ");

		Query query = manager.createNativeQuery(builder.toString(), Booking.class);

		query.setParameter("email", request.Email);

		List<Booking> list = (List<Booking>) query.getResultList();

		return list;

	}

}
