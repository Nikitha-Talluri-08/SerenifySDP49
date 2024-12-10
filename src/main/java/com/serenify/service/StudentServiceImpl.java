package com.serenify.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.serenify.model.Student;
import com.serenify.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    // Student registration logic
    @Override
    public String StudentRegistration(Student student) {
        studentRepository.save(student);
        return "Student registered successfully";
    }

    // Check student login with email and password
    @Override
    public Student checkStudentLogin(String email, String password) {
        return studentRepository.findByEmailAndPassword(email, password);
    }
    
    @Override
    public void deleteStudentById(int studentId) {
        studentRepository.deleteById(studentId);
    }
}
