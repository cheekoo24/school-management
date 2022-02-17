package school.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.management.dao.CourseDAO;
import school.management.entity.Course;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDAO courseDAO;

	@Override
	@Transactional
	public List<Course> getCourses() {
		return courseDAO.getCourses();
	}

	@Override
	@Transactional
	public void saveCourse(Course course) {
		courseDAO.saveCourse(course);
	}

	@Override
	@Transactional
	public Course getCourse(int id) {
		return courseDAO.getCourse(id);
	}

	@Override
	@Transactional
	public void deleteCourse(int id) {
		
		courseDAO.deleteCourse(id);
	}

}
