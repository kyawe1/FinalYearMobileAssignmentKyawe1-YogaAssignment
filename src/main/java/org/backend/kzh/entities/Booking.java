package org.backend.kzh.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Booking {
	@Id
	private String id;
	@ManyToOne(targetEntity = YogaClasses.class,cascade = {CascadeType.ALL , CascadeType.REMOVE})
	@JoinColumn(name="yoga_class_id")
	private YogaClasses yogaClasses;
	private String email;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public YogaClasses getYoga_class_id() {
		return yogaClasses;
	}
	public void setYoga_class_id(YogaClasses yoga_class_id) {
		this.yogaClasses = yoga_class_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
}
