package com.skillsexchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillsexchange.dao.UserDAO;

@Controller
public class RestController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		model.addAttribute("user", userDao.getUser(1));
		return "profile";
	}

}