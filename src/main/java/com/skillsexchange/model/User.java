package com.skillsexchange.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "USERS")
public class User {

	@Id
	@GeneratedValue
	private int id;

	private String first_name;
	private String last_name;
	private char sex;
	private Date birth;
	private String country;
	private String city;
	private String summary;

//	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST,
//			CascadeType.REMOVE })
//	@org.hibernate.annotations.Cascade({ org.hibernate.annotations.CascadeType.SAVE_UPDATE })
//	@JoinColumn(name = "ID")
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy="teacher")
	private Set<Subject> teach = new HashSet<Subject>();

//	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST,
//			CascadeType.REMOVE })
//	@org.hibernate.annotations.Cascade({ org.hibernate.annotations.CascadeType.SAVE_UPDATE })
//	@JoinColumn(name = "ID")
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy="student")
	private Set<Subject> learn = new HashSet<Subject>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Set<Subject> getTeach() {
		return teach;
	}

	public void setTeach(Set<Subject> teach) {
		this.teach = teach;
	}

	public Set<Subject> getLearn() {
		return learn;
	}

	public void setLearn(Set<Subject> learn) {
		this.learn = learn;
	}

}
