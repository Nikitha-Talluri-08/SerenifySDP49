package com.serenify.service;

import com.serenify.model.Student;
import com.serenify.repository.StudentRepository;

public interface StudentService 
{
	
	public String StudentRegistration(Student student);
	public Student checkStudentLogin(String email, String password);
	 public void deleteStudentById(int studentId);
}
