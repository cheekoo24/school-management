package school.management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import school.management.entity.Course;
import school.management.entity.Student;

@Repository
public class StudentDAOImpl implements StudentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Student> query = currentSession.createQuery("from Student", Student.class);
		
		List<Student> students = query.getResultList();
		
		return students;
	}

	@Override
	public void saveStudent(Student student) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(student);
	}

	@Override
	public Student getStudent(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Student student = currentSession.get(Student.class, id);
		
		return student;
	}

	@Override
	public void deleteStudent(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Student student = currentSession.get(Student.class, id);
		
		if (student != null) {
			currentSession.delete(student);
		}
		
	}

	@Override
	public List<Course> getCourses() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Course> query = currentSession.createQuery("from Course", Course.class);
		
		List<Course> students = query.getResultList();
		
		return students;
	}

	@Override
	public Student addCourse(int studentId, int courseId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Course course = currentSession.get(Course.class, courseId);
		
		Student student = currentSession.get(Student.class, studentId);
		
		student.addCourse(course);
		
		return student;
	}

	@Override
	public void removeCourse(int studentId, int courseId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Student student = currentSession.get(Student.class, studentId);
		
		for (Course courses: student.getCourses()) {
			if (courses.getId() == courseId) {
				courses.setStudents(null);
			}
		}
	}

}
