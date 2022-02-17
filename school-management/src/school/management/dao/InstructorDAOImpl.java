package school.management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import school.management.entity.Course;
import school.management.entity.Instructor;

@Repository
public class InstructorDAOImpl implements InstructorDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Instructor> getInstructors() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Instructor> theQuery = currentSession.createQuery("from Instructor", Instructor.class);
		
		List<Instructor> instructors = theQuery.getResultList();
		
		return instructors;
	}

	@Override
	public void saveInstructor(Instructor instructor) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(instructor);
		
	}

	@Override
	public Instructor getInstructor(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Instructor instructor = currentSession.get(Instructor.class, id);
		
		return instructor;
	}

	@Override
	public void deleteInstructor(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Instructor instructor = currentSession.get(Instructor.class, id);
		
		for (Course courses: instructor.getCourses()) {
			courses.setInstructor(null);
		}
		
		currentSession.delete(instructor);
	}

	@Override
	public List<Course> getCourses() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Course> theQuery = currentSession.createQuery("from Course", Course.class);
		
		List<Course> courses = theQuery.getResultList();
		
		return courses;
	}

	@Override
	public Course addCourse(int instructorId, int courseId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Course course = currentSession.get(Course.class, courseId);
		
		Instructor instructor = currentSession.get(Instructor.class, instructorId);
		
		course.setInstructor(instructor);
		
		return course;
	}
	

	@Override
	public void removeCourse(int instructorId, int courseId) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Instructor instructor = currentSession.get(Instructor.class, instructorId);
		
		for (Course courses: instructor.getCourses()) {
			if (courses.getId() == courseId) {
				courses.setInstructor(null);
			}
		}
		
		currentSession.update(instructor);

	}

}
