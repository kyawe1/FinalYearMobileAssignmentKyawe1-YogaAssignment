package org.backend.kzh.repositories;

import org.backend.kzh.entities.YogaCourses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface YogaCoursesRepository extends JpaRepository<YogaCourses, String> {

}