package org.backend.kzh.controller;

import java.util.List;

import org.backend.kzh.bl.AdvancedSearchBL;
import org.backend.kzh.bl.IBaseBL;
import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaClassDetailDto;
import org.backend.kzh.dao.YogaClassesCreateDAO;
import org.backend.kzh.dao.YogaClassesListDAO;
import org.backend.kzh.requests.YogaClassFindRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/yoga")
public class YogaClassesController {
	private IBaseBL<YogaClassesCreateDAO, YogaClassesListDAO,YogaClassDetailDto> temp;
	private AdvancedSearchBL abl;
	public YogaClassesController(IBaseBL<YogaClassesCreateDAO, YogaClassesListDAO, YogaClassDetailDto> temp, AdvancedSearchBL bl) {
		this.temp = temp;
		abl = bl;
	}
	@GetMapping("all/{email}")
	public ResponseEntity<ResponseModel<List<YogaClassesListDAO>>> index(@PathVariable("email") String email) {
		return ResponseEntity.ok(temp.getAll(email));
	}
	
	@GetMapping("all")
	public ResponseEntity<ResponseModel<List<YogaClassesListDAO>>> index() {
		return ResponseEntity.ok(temp.getAll(null));
	}
	
	@GetMapping("detail/{id}/{email}")
	public ResponseEntity<ResponseModel<YogaClassDetailDto>> detail(@PathVariable("id") String id,@PathVariable("email") String email) {
		return ResponseEntity.ok(temp.getById(id,email));
	}
	
	@GetMapping("detail/{id}")
	public ResponseEntity<ResponseModel<YogaClassDetailDto>> detail(@PathVariable("id") String id) {
		return ResponseEntity.ok(temp.getById(id,null));
	}
	
	@PostMapping("find/{email}")
	public ResponseEntity<ResponseModel<List<YogaClassesListDAO>>> index(@PathVariable("email") String email,@RequestBody YogaClassFindRequest request) {
		return ResponseEntity.ok(abl.getList(request,email));
	}
	
	@PostMapping("")
	public ResponseEntity<ResponseModel<String>> insert(@RequestBody YogaClassesCreateDAO dao){
		return ResponseEntity.ok(temp.insert(dao));
	}
}
