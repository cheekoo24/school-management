package school.management.service;

import java.util.List;

import school.management.entity.Course;

public interface CourseService {
	
	public List<Course> getCourses();

	public void saveCourse(Course course);

	public Course getCourse(int id);

	public void deleteCourse(int id);

}
