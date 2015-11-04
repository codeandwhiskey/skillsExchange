package com.skillsexchange.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillsexchange.dao.SearchDAO;
import com.skillsexchange.dao.UserDAO;
import com.skillsexchange.model.Subject;

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
		List <Subject> subjects = searchDao.getSubjects();
		model.addAttribute("subjects", subjects);
		model.addAttribute("users", searchDao.getUsers(subjects, teach, learn));
		return "search";
	}

}