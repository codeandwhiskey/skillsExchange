package com.skillsexchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillsexchange.dao.SearchDAO;
import com.skillsexchange.dao.UserDAO;

@Controller
public class RestController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private SearchDAO searchDao;
	
	@RequestMapping(value = "/")
	public String listUsers(ModelMap model) {
		model.addAttribute("user", userDao.getUser(1));
		return "profile";
	}
	
	@RequestMapping(value = "/search")
	public String loadSearch(ModelMap model) {
		model.addAttribute("subjects", searchDao.getSubjects());
		return "search";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchResults(ModelMap model, @ModelAttribute("teach") String teach, @ModelAttribute("learn") String learn) {
		model.addAttribute("subjects", searchDao.getSubjects());
		model.addAttribute("users", searchDao.getUsers(teach, learn));
		return "search";
	}

}