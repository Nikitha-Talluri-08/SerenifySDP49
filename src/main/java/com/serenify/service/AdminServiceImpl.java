package com.serenify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.serenify.model.Admin;
import com.serenify.model.Student;
import com.serenify.repository.AdminRepository;
import com.serenify.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private AdminRepository adminRepository;
	@Override
	public List<Student> viewAllStudents() {
		return studentRepository.findAll();
	}
	@Override
	public Admin checkAdminLogin(String username, String password) {
		return adminRepository.checkAdminLogin(username, password);
	}

}
