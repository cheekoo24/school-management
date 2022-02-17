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
import school.management.entity.Instructor;
import school.management.service.InstructorService;

@Controller
@RequestMapping("/instructor")
public class InstructorController {
	
	@Autowired
	private InstructorService instructorService;
	
	// get instructor list
	@GetMapping("/list")
	public String instructorList(Model model) {
		
		List<Instructor> theInstructors = instructorService.getInstructors();
		
		
		model.addAttribute("instructors", theInstructors);
		
		
		return "instructor-list";
	}
	
	// adding course to instructor
	@GetMapping("/courseList")
	public String courseAdd(@RequestParam("instructorId") int id, Model model) {
		
		Instructor instructor = instructorService.getInstructor(id);
		List<Course> course = instructorService.getCourses();
		
		model.addAttribute("instructor", instructor);
		// dispaly courses from instructor view
		model.addAttribute("course", course);
		
		return "instructor-course-add";
	}
	
	// instructor info
	@GetMapping("/view")
	public String instructorView(@RequestParam("instructorId") int id, Model model) {
		
		Instructor instructor = instructorService.getInstructor(id);
		
		model.addAttribute("instructor", instructor);
		
		return "instructor-view";
	}
	
	// adding course to instructor
	@GetMapping("/addCourse")
	public String addCourse(@RequestParam("instructorId") int instructorId, @RequestParam("courseId") int courseId,
			Model model) {
		
		instructorService.addCourse(instructorId, courseId);
		
		Instructor instructor = instructorService.getInstructor(instructorId);
		model.addAttribute("instructor", instructor);
		
		return "instructor-view";
	}
	
	@GetMapping("/removeCourse")
	public String removeCourse(@RequestParam("instructorId") int instructorId, @RequestParam("courseId") int courseId, Model model) {
		
		instructorService.removeCourse(instructorId, courseId);
		
		Instructor instructor = instructorService.getInstructor(instructorId);
		
		model.addAttribute("instructor", instructor);
		
		return "instructor-view";
	}
	
	// adding new instructor
	@GetMapping("/addInstructorForm")
	public String addInstructorForm(Model model) {
		
		Instructor instructor = new Instructor();
		
		model.addAttribute("instructor", instructor);
		
		
		return "instructor-form";
	}
	
	// save instructor to the database
	@PostMapping("/saveInstructor")
	public String saveInstructor(
			@Valid @ModelAttribute("instructor") Instructor instructor,
			BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "instructor-form";
		} {
			instructorService.saveInstructor(instructor);
			
			return "redirect:/instructor/list";
		}
	}
	
	// update instructor
	@GetMapping("/updateInsctructorForm")
	public String updateInstructor(@RequestParam("instructorId") int id, Model model) {
		
		Instructor instructor = instructorService.getInstructor(id);
		
		model.addAttribute("instructor", instructor);
		
		return "instructor-form";
	}
	
	// delete instructor
	@GetMapping("/deleteInstructor")
	public String deleteInstructor(@RequestParam("instructorId") int id) {
		
		instructorService.deleteInstructor(id);
		
		return "redirect:/instructor/list";
	}

}




















