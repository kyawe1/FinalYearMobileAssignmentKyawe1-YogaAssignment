package org.backend.kzh.entities;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "yoga_classes")
public class YogaClasses {
	@Id
	private String id;
	private String additionalComments;
	private String date;
	private String teacherName;
	@ManyToOne(targetEntity = YogaCourses.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "yoga_id")
	private YogaCourses yogaCourse;
	
	@OneToMany(mappedBy = "yogaClasses")
	private List<Booking> book;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAdditionalComments() {
		return additionalComments;
	}

	public void setAdditionalComments(String additionalComments) {
		this.additionalComments = additionalComments;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getYogaId() {
		return yogaCourse.getId();
	}

	public YogaCourses getYoga() {
		return yogaCourse;
	}

	public void setYoga(YogaCourses yoga) {
		this.yogaCourse = yoga;
	}

	public YogaCourses getYogaCourse() {
		return yogaCourse;
	}

	public void setYogaCourse(YogaCourses yogaCourse) {
		this.yogaCourse = yogaCourse;
	}

	public List<Booking> getBook() {
		return book;
	}

	public void setBook(List<Booking> book) {
		this.book = book;
	}

}
