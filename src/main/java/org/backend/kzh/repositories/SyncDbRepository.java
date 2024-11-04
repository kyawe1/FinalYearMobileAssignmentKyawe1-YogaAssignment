package org.backend.kzh.repositories;

import java.util.List;
import java.util.stream.Collectors;

import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.SyncDbDto;
import org.backend.kzh.entities.Booking;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Repository
public class SyncDbRepository {

	private EntityManager manager;
	private YogaClassesRepository repo1;
	private YogaCoursesRepository repo2;
	private BookingRepository repo3;

	public SyncDbRepository(EntityManager manager, YogaClassesRepository repo1, YogaCoursesRepository repo2,
			BookingRepository repo3) {
		this.manager = manager;
		this.repo1 = repo1;
		this.repo2 = repo2;
		this.repo3 = repo3;
	}

	@Transactional
	public ResponseModel<String> SyncDb(SyncDbDto dto) {
		ResponseModel<String> s = new ResponseModel<String>();
		try {

			Query query1 = manager.createNativeQuery("truncate table yogas;");
			Query query2 = manager.createNativeQuery("truncate table yoga_classes;");
			Query query3 = manager.createNativeQuery("truncate table booking;");
			List<Booking> booking = repo3.findAll();

			var result3 = query3.executeUpdate();

			var result1 = query2.executeUpdate();

			var result2 = query1.executeUpdate();

			if (result1 >= 0 && result2 >= 0 && result3 >= 0) {
				var courses = dto.yogaCourseCreateUpdateDAOs.stream()
					.map(p -> p.toYogaCourse())
					.collect(Collectors.toList());
				var classes = dto.yogaClassesCreateUpdateDAOs.stream()
					.map(p -> {
						var tmp = p.toYogaClasses();
						var tmp1 = courses.stream()
							.filter(q -> q.getId()
								.equals(p.YogaId))
							.findFirst();
						tmp.setYoga(tmp1.isEmpty() ? null : tmp1.get());
						return tmp1.isEmpty() ? null : tmp;
					})
					.filter(p-> p != null)
					.collect(Collectors.toList());
				
				var bookings = booking.stream()
					.filter(m -> {
						boolean exists = classes.stream()
							.anyMatch(p -> p.getId()
								.equals(m.getYoga_class_id()));
						return exists;
					})
					.collect(Collectors.toList());

				repo2.saveAllAndFlush(courses);
				repo1.saveAllAndFlush(classes);
				repo3.saveAllAndFlush(bookings);

			}
			s.model = "Synced with db successfully";
			s.message = "Sync with db successfully";
		} catch (Exception e) {
			e.printStackTrace();
			s.model = "Something wrong with something";
			s.message = e.getMessage();
			throw e;
		}
		return s;
	}

}
