package com.skillsexchange.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skillsexchange.model.Subject;
import com.skillsexchange.model.User;

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
	public Subject getSubject(String title) {
		Query query = getSession().createQuery(
				"from Subject where title=:title");
		query.setParameter("title", title);
		return (Subject) query.uniqueResult();
	}

	@Transactional
	public List<User> getUsers(List<Subject> subjects, String teach,
			String learn) {
		List<User> result = new ArrayList<User>();
		Subject subject = getSubject(teach);
		for (User u : subject.getStudent()) {
			for (Subject s : u.getTeach()) {
				if (s.getTitle().equals(learn)) {
					result.add(u);
				}
			}
		}
		return result;
	}

}
