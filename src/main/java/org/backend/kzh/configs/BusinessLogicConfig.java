package org.backend.kzh.configs;

import org.backend.kzh.bl.AdvancedSearchBL;
import org.backend.kzh.bl.BookingBL;
import org.backend.kzh.bl.IBaseBL;
import org.backend.kzh.bl.YogaClassesBL;
import org.backend.kzh.bl.YogaCoursesBL;
import org.backend.kzh.dao.BookingDAO;
import org.backend.kzh.dao.BookingListDAO;
import org.backend.kzh.dao.YogaClassDetailDto;
import org.backend.kzh.dao.YogaClassesCreateDAO;
import org.backend.kzh.dao.YogaClassesListDAO;
import org.backend.kzh.dao.YogaCourseCreateUpdateDAO;
import org.backend.kzh.dao.YogaCourseListDAO;
import org.backend.kzh.repositories.AdvancedSearchRepository;
import org.backend.kzh.repositories.BookingRepository;
import org.backend.kzh.repositories.YogaClassesRepository;
import org.backend.kzh.repositories.YogaCoursesRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BusinessLogicConfig {
	@Bean
	public IBaseBL<YogaClassesCreateDAO, YogaClassesListDAO , YogaClassDetailDto> getYogaClasses(YogaClassesRepository repository) {
		return new YogaClassesBL(repository);
	}

	@Bean
	public IBaseBL<YogaCourseCreateUpdateDAO, YogaCourseListDAO, YogaCourseListDAO> getYogaCourses(YogaCoursesRepository repository) {
		return new YogaCoursesBL(repository);
	}
	
	@Bean
	public IBaseBL<BookingDAO,  BookingListDAO,BookingListDAO> getBooking(BookingRepository repo,YogaClassesRepository repository) {
		return new BookingBL(repo,repository);
	}
	
	@Bean
	public AdvancedSearchBL getAdvancedSearchRepo(AdvancedSearchRepository repository) {
		return new AdvancedSearchBL(repository);
	}
}
