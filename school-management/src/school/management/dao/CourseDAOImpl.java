package school.management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import school.management.entity.Course;

@Repository
public class CourseDAOImpl implements CourseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Course> getCourses() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Course> query = currentSession.createQuery("from Course", Course.class);
		
		List<Course> courses = query.getResultList();
		
		return courses;
	}

	@Override
	public void saveCourse(Course course) {
		
		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(course);
	}

	@Override
	public Course getCourse(int id) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Course course = currentSession.get(Course.class, id);
		
		return course;
	}

	@Override
	public void deleteCourse(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("delete from Course where id=:instructorId");
		
		query.setParameter("instructorId", id);
		
		query.executeUpdate();
	}

}
