package org.backend.kzh.repositories;

import org.backend.kzh.entities.YogaClasses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface YogaClassesRepository extends JpaRepository<YogaClasses, String> {

}
