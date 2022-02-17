package school.management.dao;

import java.util.List;

import school.management.entity.Course;
import school.management.entity.Instructor;

public interface InstructorDAO {
	
	public List<Instructor> getInstructors();

	public void saveInstructor(Instructor instructor);

	public Instructor getInstructor(int id);

	public void deleteInstructor(int id);
	
	public List<Course> getCourses();

	public Course addCourse(int instructorId, int courseId);
	
	public void removeCourse(int instructorId, int courseId);

}
