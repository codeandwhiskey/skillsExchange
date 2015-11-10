package com.skillsexchange.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillsexchange.dao.SearchDAO;
import com.skillsexchange.dao.UserDAO;
import com.skillsexchange.model.Subject;
import com.skillsexchange.model.User;

@Controller
public class RestController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private SearchDAO searchDao;
	
	@Autowired
	private User user;
	
	private String message;
	
	@RequestMapping(value = "/")
	public String start(ModelMap model) {
		model.addAttribute("message", message);
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String getUserByLogin(ModelMap model, @ModelAttribute("uname") String uname, @ModelAttribute("password") String password) {
		user = userDao.getUser(searchDao.getUserID(uname, password));
		if(user == null){
			message = "username or password is incorrect";
			return "redirect:/";
		}
		message = "";
		model.addAttribute("user", user);
		return "profile";
		
	}
	
	@RequestMapping(value = "/profile")
	public String listUsers(ModelMap model) {
		model.addAttribute("user", user);
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
	
	@RequestMapping("/edit/{id}")
	public String editEmployee(@PathVariable("id") int id, Model model) {
		model.addAttribute("user", userDao.getUser(id));
		return "profile_form";
	}
	
	@RequestMapping(value = "/user/fill", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("user") User user) {
		if (user.getId() == 0) {
			userDao.addUser(user);
		} else {
			userDao.updateUser(user);
		}
		return "redirect:/";
	}

}