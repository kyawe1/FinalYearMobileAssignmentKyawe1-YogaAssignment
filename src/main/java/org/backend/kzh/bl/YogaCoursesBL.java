package org.backend.kzh.bl;

import java.util.List;
import java.util.stream.Collectors;

import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaCourseCreateUpdateDAO;
import org.backend.kzh.dao.YogaCourseListDAO;
import org.backend.kzh.repositories.YogaCoursesRepository;
import org.springframework.scheduling.annotation.Async;

import jakarta.transaction.Transactional;

public class YogaCoursesBL implements IBaseBL<YogaCourseCreateUpdateDAO, YogaCourseListDAO, YogaCourseListDAO> {
	private YogaCoursesRepository repository;

	public YogaCoursesBL(YogaCoursesRepository repo) {
		repository = repo;
	}

	@Override
	public ResponseModel<List<YogaCourseListDAO>> getAll(String email) {
		ResponseModel<List<YogaCourseListDAO>> list = new ResponseModel<>();
		list.model = repository.findAll().stream().map(p -> new YogaCourseListDAO(p)).collect(Collectors.toList());
		list.status = "200";
		list.message = "fetch successfully";
		
		return list;
	}
	@Override
	public ResponseModel<YogaCourseListDAO> getById(String id,String email) {
		// TODO Auto-generated method stub
		ResponseModel<YogaCourseListDAO> list = new ResponseModel<>();
		var i = repository.findById(id);
		if(!i.isEmpty()) {
			list.model = new YogaCourseListDAO(i.get());
		}
		list.model = null;
		list.status = "200";
		list.message = "fetch successfully";
		
		return list;
	}

	@Override
	@Transactional
	public ResponseModel<String> insert(YogaCourseCreateUpdateDAO model) {
		// TODO Auto-generated method stub
		ResponseModel<String> result = new ResponseModel<>();
		try {
			var o = model.toYogaCourse();
			repository.save(o);
			result.model = null;
			result.status = "200";
			result.message = "save successfully";
		}catch(Exception e){
			result.model = null;
			result.status = "200";
			result.message = "save not successfully";
		}
		return result;
	}

	@Override
	@Transactional
	public ResponseModel<String> update(YogaCourseCreateUpdateDAO model, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public ResponseModel<String> deleteById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
