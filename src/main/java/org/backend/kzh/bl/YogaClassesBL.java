package org.backend.kzh.bl;

import java.util.List;
import java.util.stream.Collectors;

import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaClassDetailDto;
import org.backend.kzh.dao.YogaClassesCreateDAO;
import org.backend.kzh.dao.YogaClassesListDAO;
import org.backend.kzh.repositories.YogaClassesRepository;
import org.springframework.scheduling.annotation.Async;

import jakarta.transaction.Transactional;

public class YogaClassesBL implements IBaseBL<YogaClassesCreateDAO,  YogaClassesListDAO,YogaClassDetailDto> {
	private YogaClassesRepository repository;

	public YogaClassesBL(YogaClassesRepository repo) {
		repository = repo;
	}
	@Override
	public ResponseModel<List<YogaClassesListDAO>> getAll(String email) {
		// TODO Auto-generated method stub
		
		ResponseModel<List<YogaClassesListDAO>> list = new ResponseModel<>();
		list.model = repository.findAll().stream().map(p -> new YogaClassesListDAO(p,email)).collect(Collectors.toList());
		list.status = "200";
		list.message = "fetch successfully";
		
		return list;
	}
	@Override
	public ResponseModel<YogaClassDetailDto> getById(String id,String email) {
		// TODO Auto-generated method stub
		
		ResponseModel<YogaClassDetailDto> list = new ResponseModel<>();
		var i = repository.findById(id);
		if(!i.isEmpty()) {
			list.model = new YogaClassDetailDto(i.get(),email);
		}else {
			list.model = null;
		}
		list.status = "200";
		list.message = "fetch successfully";
		
		return list;
	}
	@Override
	@Transactional
	public ResponseModel<String> insert(YogaClassesCreateDAO model) {
		// TODO Auto-generated method stub
		ResponseModel<String> result = new ResponseModel<>();
		try {
			var o = model.toYogaClasses();
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
	public ResponseModel<String> update(YogaClassesCreateDAO model, String id) {
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
