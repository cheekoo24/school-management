package school.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.management.dao.StudentDAO;
import school.management.entity.Course;
import school.management.entity.Student;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO studentDAO;

	@Override
	@Transactional
	public List<Student> getStudents() {
		return studentDAO.getStudents();
	}

	@Override
	@Transactional
	public void saveStudent(Student student) {
		studentDAO.saveStudent(student);
	}

	@Override
	@Transactional
	public Student getStudent(int id) {
		return studentDAO.getStudent(id);
	}

	@Override
	@Transactional
	public void deleteStudent(int id) {
		studentDAO.deleteStudent(id);
		
	}

	@Override
	@Transactional
	public List<Course> getCourses() {
		return studentDAO.getCourses();
	}

	@Override
	@Transactional
	public Student addCourse(int studentId, int courseId) {
		return studentDAO.addCourse(studentId, courseId);
	}

	@Override
	@Transactional
	public void removeCourse(int studentId, int courseId) {
		studentDAO.removeCourse(studentId, courseId);
	}

}
