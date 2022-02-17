package school.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.management.dao.InstructorDAO;
import school.management.entity.Course;
import school.management.entity.Instructor;

@Service
public class InstructorServiceImpl implements InstructorService {
	
	
	@Autowired
	private InstructorDAO instructorDAO;

	@Override
	@Transactional
	public List<Instructor> getInstructors() {
		
		return instructorDAO.getInstructors();
	}

	@Override
	@Transactional
	public void saveInstructor(Instructor instructor) {
		
		instructorDAO.saveInstructor(instructor);
		
	}

	@Override
	@Transactional
	public Instructor getInstructor(int id) {
	
		return instructorDAO.getInstructor(id);
	}

	@Override
	@Transactional
	public void deleteInstructor(int id) {
		instructorDAO.deleteInstructor(id);
	}

	@Override
	@Transactional
	public List<Course> getCourses() {
		return instructorDAO.getCourses();
	}

	@Override
	@Transactional
	public Course addCourse(int instructorId, int courseId) {
		return instructorDAO.addCourse(instructorId, courseId);
	}

	@Override
	@Transactional
	public void removeCourse(int instructorId, int courseId) {
		instructorDAO.removeCourse(instructorId, courseId);
	}
}
