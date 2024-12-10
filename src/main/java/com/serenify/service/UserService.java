package com.serenify.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.serenify.model.Admin;
import com.serenify.model.Student;
import com.serenify.repository.AdminRepository;
import com.serenify.repository.StudentRepository;

@Service
public class UserService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private StudentRepository studentRepository;
    

    public boolean isAdmin(String email, String password) {
        Admin admin = adminRepository.findByEmail(email);
        return admin != null && admin.getPassword().equals(password); // Ideally, use hashed password comparison
    }

    public boolean isStudent(String email, String password) {
        Student student = studentRepository.findByEmail(email);
        return student != null && student.getPassword().equals(password); // Ideally, use hashed password comparison
    }
}
