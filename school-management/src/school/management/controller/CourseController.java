package school.management.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.management.entity.Course;
import school.management.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	
	@GetMapping("/list")
	public String studentList(Model model) {
		
		List<Course> courses = courseService.getCourses();
		
		model.addAttribute("courses", courses);
		
		return "course-list";
	}
	
	@GetMapping("/addCourseForm")
	public String addCourseForm(Model model) {
		
		Course course = new Course();
		
		model.addAttribute("course", course);
		
		return "course-form";
	}
	
	@PostMapping("/saveCourse")
	public String saveCourse(
			@Valid @ModelAttribute("course") Course course,
			BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "course-form";
		} else {
			courseService.saveCourse(course);
			
			return "redirect:/course/list";
		}
	}
	
	@GetMapping("/updateCourseForm")
	public String updateCourse(@RequestParam("courseId") int id, Model model) {
		
		Course course = courseService.getCourse(id);
		
		model.addAttribute("course", course);
		
		return "course-form";
		
	}
	
	@GetMapping("/deleteCourse")
	public String deleteCourse(@RequestParam("courseId") int id) {
		
		courseService.deleteCourse(id);
		
		return "redirect:/course/list";
	}

}




















