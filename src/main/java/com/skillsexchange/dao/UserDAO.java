package com.skillsexchange.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skillsexchange.model.UserCard;

@Component
public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Transactional
	public List<UserCard> getUsers() {
		@SuppressWarnings("unchecked")
		List<UserCard> result = (List<UserCard>) getSession().createCriteria(UserCard.class).list();
		
		return result;
	}
}
