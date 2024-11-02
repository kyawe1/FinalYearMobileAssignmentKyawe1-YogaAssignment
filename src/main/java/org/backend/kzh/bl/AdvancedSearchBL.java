package org.backend.kzh.bl;

import java.util.List;
import java.util.stream.Collectors;

import org.backend.kzh.dao.BookingListDAO;
import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaClassesListDAO;
import org.backend.kzh.entities.Booking;
import org.backend.kzh.entities.YogaClasses;
import org.backend.kzh.repositories.AdvancedSearchRepository;
import org.backend.kzh.requests.BookingSearchRequest;
import org.backend.kzh.requests.YogaClassFindRequest;

public class AdvancedSearchBL {
	private AdvancedSearchRepository repo;
	
	public AdvancedSearchBL(AdvancedSearchRepository repository) {
		repo= repository;
	}
	
	public ResponseModel<List<YogaClassesListDAO>> getList(YogaClassFindRequest request,String Email){
		List<YogaClasses> classes= repo.searchYogaClasses(request);
		
		ResponseModel<List<YogaClassesListDAO>> list = new ResponseModel<>();
		list.model = classes.stream().map(m->{
			return new YogaClassesListDAO(m,Email);
		}).collect(Collectors.toList());
		list.status = "200";
		list.message = "fetch successfully";
		return list;
	}
	
	public ResponseModel<List<BookingListDAO>> searchBooking(BookingSearchRequest request){
		List<Booking> classes= repo.searchBooking(request);
		
		ResponseModel<List<BookingListDAO>> list = new ResponseModel<>();
		list.model = classes.stream().map(m->{
			return new BookingListDAO(m);
		}).collect(Collectors.toList());
		list.status = "200";
		list.message = "fetch successfully";
		return list;
	}
}
