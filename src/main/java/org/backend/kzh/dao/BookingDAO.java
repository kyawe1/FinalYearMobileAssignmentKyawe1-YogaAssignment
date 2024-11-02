package org.backend.kzh.dao;

import java.util.List;
import java.util.UUID;

import org.backend.kzh.entities.Booking;

public class BookingDAO {
	public List<String> YogaClassIds;
	public String email;
	public String uuid;
	
	public BookingDAO() {
		// TODO Auto-generated constructor stub
	}
	public Booking toEntity() {
		Booking booking = new Booking();
		booking.setEmail(this.email);
		booking.setId("bok_"+ UUID.randomUUID().toString());
		return booking;
	}
}
