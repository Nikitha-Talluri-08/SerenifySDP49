package com.serenify.service;

import java.util.List;

import com.serenify.model.Admin;
import com.serenify.model.Student;

public interface AdminService 
{
	public List<Student> viewAllStudents(); 
	public Admin checkAdminLogin(String email, String password);
}
