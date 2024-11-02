package org.backend.kzh.repositories;

import java.util.Optional;

import org.backend.kzh.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, String> {
	public Optional<Booking> findByEmail(String email);
}
