package org.backend.kzh.controller;

import java.util.List;

import org.backend.kzh.bl.AdvancedSearchBL;
import org.backend.kzh.bl.IBaseBL;
import org.backend.kzh.dao.BookingDAO;
import org.backend.kzh.dao.BookingListDAO;
import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.requests.BookingSearchRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/book")
public class BookingController {
	private IBaseBL<BookingDAO,  BookingListDAO,BookingListDAO> temp;
	private AdvancedSearchBL advancedSearch;
	public BookingController(IBaseBL<BookingDAO,  BookingListDAO,BookingListDAO> temp,AdvancedSearchBL bl) {
		this.temp = temp;
		this.advancedSearch = bl;
	}
	@GetMapping("all/{email}")
	public ResponseEntity<ResponseModel<List<BookingListDAO>>> index(@PathVariable("email") String email) {
		return ResponseEntity.ok(temp.getAll(email));
	}
	
	@PostMapping("find")
	public ResponseEntity<ResponseModel<List<BookingListDAO>>> filterBookList(@RequestBody BookingSearchRequest request){
		return ResponseEntity.ok(advancedSearch.searchBooking(request));
	}
	
	@PostMapping("save")
	public ResponseEntity<ResponseModel<String>> insert(@RequestBody BookingDAO dao){
		return ResponseEntity.ok(temp.insert(dao));
	}
	
	
}
