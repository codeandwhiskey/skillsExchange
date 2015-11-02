package com.skillsexchange.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SUBJECT")
public class Subject {
	@Id
	@GeneratedValue
	private int id;
	private String title;
	private int category_id;

	@ManyToMany
	@JoinTable(name = "TEACHER", joinColumns = { @JoinColumn(name = "SUBJECT_ID") }, inverseJoinColumns = { @JoinColumn(name = "USER_ID") })
	private Set<User> teacher = new HashSet<User>();

	@ManyToMany
	@JoinTable(name = "STUDENT", joinColumns = { @JoinColumn(name = "SUBJECT_ID") }, inverseJoinColumns = { @JoinColumn(name = "USER_ID") })
	private Set<User> student = new HashSet<User>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public Set<User> getTeacher() {
		return teacher;
	}

	public void setTeacher(Set<User> teacher) {
		this.teacher = teacher;
	}

	public Set<User> getStudent() {
		return student;
	}

	public void setStudent(Set<User> student) {
		this.student = student;
	}
}
