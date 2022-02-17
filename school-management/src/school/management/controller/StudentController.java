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
import school.management.entity.Student;
import school.management.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	@GetMapping("/list")
	public String studentList(Model model) {
		
		List<Student> students = studentService.getStudents();
		
		model.addAttribute("student", students);
		
		return "student-list";
	}
	
	@GetMapping("/courseList")
	public String courseAdd(@RequestParam("studentId") int id, Model model) {
		
		Student student = studentService.getStudent(id);
		List<Course> course = studentService.getCourses();
		
		model.addAttribute("student", student);
		
		// display courses from instructor view
		model.addAttribute("course", course);
		
		return "student-course-add";
	}
	
	//adding course to student
	@GetMapping("/addCourse")
	public String addCourse(@RequestParam("studentId") int studentId, @RequestParam("courseId") int courseId,
			Model model) {
		
		Student student = studentService.addCourse(studentId, courseId);
		
		Student studentView = studentService.getStudent(studentId);
		model.addAttribute("student", studentView);
		
		return "student-view";
	}
	
	@GetMapping("/removeCourse")
	public String removeCourse(@RequestParam("studentId") int studentId, @RequestParam("courseId") int courseId,
			Model model) {
		
		studentService.removeCourse(studentId, courseId);
		
		Student studentView = studentService.getStudent(studentId);
		model.addAttribute("student", studentView);
		
		return "student-view";
	}
	
	@GetMapping("/addStudentForm")
	public String addStudentForm(Model model) {
		
		Student student = new Student();
		
		model.addAttribute("student", student);
		
		return "student-form";
	}
	
	@GetMapping("/view")
	public String studentView(@RequestParam("studentId") int id, Model model) {
		
		Student student = studentService.getStudent(id);
		
		model.addAttribute("student", student);
		
		return "student-view";
	}
	
	@PostMapping("/saveStudent")
	public String saveStudent(
			@Valid @ModelAttribute("student") Student student,
			BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "student-form";
		} else {
			studentService.saveStudent(student);
			
			return "redirect:/student/list";
		}
		
	}
	
	@GetMapping("/updateStudentForm")
	public String updateStudent(@RequestParam("studentId") int id, Model model) {
		
		Student student = studentService.getStudent(id);
		
		model.addAttribute("student", student);
		
		return "student-form";
	}
	
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("studentId") int id) {
		
		studentService.deleteStudent(id);
		
		return "redirect:/student/list"; 
	}

}










