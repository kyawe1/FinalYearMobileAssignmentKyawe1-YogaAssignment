package org.backend.kzh.controller;

import java.util.List;

import org.backend.kzh.bl.IBaseBL;
import org.backend.kzh.dao.ResponseModel;
import org.backend.kzh.dao.YogaCourseCreateUpdateDAO;
import org.backend.kzh.dao.YogaCourseListDAO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/yogacourse")
public class YogaCoursesController {
	private IBaseBL<YogaCourseCreateUpdateDAO, YogaCourseListDAO,YogaCourseListDAO> temp;
	public YogaCoursesController(IBaseBL<YogaCourseCreateUpdateDAO, YogaCourseListDAO, YogaCourseListDAO> temp) {
		this.temp = temp;
	}
	@GetMapping("all")
	public ResponseEntity<ResponseModel<List<YogaCourseListDAO>>> index() {
		return ResponseEntity.ok(temp.getAll(null));
	}
	@GetMapping("detail/{id}")
	public ResponseEntity<ResponseModel<YogaCourseListDAO>> index(@PathVariable String id) {
		return ResponseEntity.ok(temp.getById(id,null));
	}
	@PostMapping("")
	public ResponseEntity<ResponseModel<String>> insert(@RequestBody YogaCourseCreateUpdateDAO dao){
		return ResponseEntity.ok(temp.insert(dao));
	}
}
