package com.skillsexchange.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skillsexchange.model.Subject;

@Component
public class SearchDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public List<Subject> getSubjects() {
		@SuppressWarnings("unchecked")
		List<Subject> result = (List<Subject>) getSession().createCriteria(
				Subject.class).list();

		return result;
	}

	@Transactional
	public List<Object> getUsers(String teach, String learn) {
		String hql = "select u.first_name, u.last_name, s1.title, s2.title "
				+ "from User u " + "join Teacher t on t.user_id = u.id "
				+ "join Subject s1 on t.subject_id = s1.id "
				+ "join Student stud on stud.user_id = u.id "
				+ "join Subject s2 on stud.subject_id = s2.id "
				+ "where s1.id=(select id from Subject s where s.title = '"
				+ teach
				+ "') and s2.id=(select id from Subject s where s.title = '"
				+ learn + "')";
		
		@SuppressWarnings("unchecked")
		List<Object> result = getSession().createQuery(hql).list();
		return result;
	}

}
