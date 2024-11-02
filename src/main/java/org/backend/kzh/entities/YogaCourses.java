package org.backend.kzh.entities;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "yogas")
public class YogaCourses {
	@Id
	private String id;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private long capacity;
	private String dayOfWeek;
	private String description;
	private String name;
	@Column(name="price_per_class",columnDefinition = "TEXT")
	private BigDecimal price;
	private String level;
	@Column(name="time_of_course",columnDefinition = "TEXT")
	private String timeOfClass;
	private String typeOfClass;
	private int duration;

	@OneToMany(mappedBy = "yogaCourse", cascade = CascadeType.ALL)
	private List<YogaClasses> YogaClasses;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public long getCapacity() {
		return capacity;
	}

	public void setCapacity(long capacity) {
		this.capacity = capacity;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTimeOfClass() {
		return timeOfClass;
	}

	public void setTimeOfClass(String timeOfClass) {
		this.timeOfClass = timeOfClass;
	}

	public String getTypeOfClass() {
		return typeOfClass;
	}

	public void setTypeOfClass(String typeOfClass) {
		this.typeOfClass = typeOfClass;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public List<YogaClasses> getYogaClasses() {
		return YogaClasses;
	}

	public void setYogaClasses(List<YogaClasses> yogaClasses) {
		YogaClasses = yogaClasses;
	}
}
