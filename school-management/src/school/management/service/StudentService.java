package school.management.service;

import java.util.List;

import school.management.entity.Course;
import school.management.entity.Student;

public interface StudentService {

	public List<Student> getStudents();

	public void saveStudent(Student student);

	public Student getStudent(int id);

	public void deleteStudent(int id);
	
	public List<Course> getCourses();

	public Student addCourse(int studentId, int courseId);

	public void removeCourse(int studentId, int courseId);
}
