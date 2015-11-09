package com.skillsexchange.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skillsexchange.model.User;

@Component
public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Transactional
	public User getUser(int id){
		User user = (User) getSession().get(User.class, id);
		return user;
	}
	
	@Transactional
	public void updateUser(User user) {
		getSession().update(user);
	}

	public void addUser(User user) {
		getSession().save(user);		
	}
}
