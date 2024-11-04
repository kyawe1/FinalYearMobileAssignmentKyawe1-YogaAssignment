package org.backend.kzh.bl;

import java.util.List;
import java.util.UUID;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.backend.kzh.dao.BookingDAO;
import org.backend.kzh.dao.BookingListDAO;
import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaClassDetailDto;
import org.backend.kzh.dao.YogaClassesCreateDAO;
import org.backend.kzh.dao.YogaClassesListDAO;
import org.backend.kzh.dao.YogaCourseListDAO;
import org.backend.kzh.entities.Booking;
import org.backend.kzh.entities.YogaClasses;
import org.backend.kzh.repositories.BookingRepository;
import org.backend.kzh.repositories.YogaClassesRepository;

public class BookingBL implements IBaseBL<BookingDAO,  BookingListDAO,BookingListDAO>{
	
	private BookingRepository repository;
	private YogaClassesRepository repository1;

	public BookingBL(BookingRepository repo,YogaClassesRepository repository2) {
		this.repository = repo;
		repository1 = repository2;
	}

	@Override
	public ResponseModel<List<BookingListDAO>> getAll(String email) {
		// TODO Auto-generated method stub
		ResponseModel<List<BookingListDAO>> list = new ResponseModel<>();
		list.model = repository.findAll().stream().map(p -> new BookingListDAO(p)).collect(Collectors.toList());
		list.status = "200";
		list.message = "fetch successfully";
		
		return list;
	}

	@Override
	public ResponseModel<BookingListDAO> getById(String id,String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseModel<String> insert(BookingDAO model) {
		// TODO Auto-generated method stub
		ResponseModel<String> result = new ResponseModel<>();
		try {
			var i = repository1.findAll();
			var booking= repository.getByEmail(model.email);
			var email = model.email;
			List<Booking> models= model.YogaClassIds.stream().map((k)->{
				var yogaClass= i.stream().filter((m) -> m.getId().equals(k)).findFirst().get();
				var ab = booking.stream().filter((m) -> m.getYoga_class_id().getId().equals(k)).findFirst();
				if(ab.isEmpty()) {
					Booking bok = new Booking();
					bok.setEmail(email);
					bok.setId("bok_"+UUID.randomUUID().toString());
					bok.setYoga_class_id(yogaClass);
					return bok;
				}
				return null;
			}).filter(p -> p != null).collect(Collectors.toList());
			repository.saveAll(models);
			result.model = null;
			result.status = "200";
			result.message = "save successfully";
		}catch(Exception e){
			result.model = null;
			result.status = "200";
			result.message = "save not successfully";
		}
		return result;
	}

	@Override
	public ResponseModel<String> update(BookingDAO model, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseModel<String> deleteById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
