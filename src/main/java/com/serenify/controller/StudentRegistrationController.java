package com.serenify.controller;

import com.serenify.model.Student;
import com.serenify.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentRegistrationController {

    @Autowired
    private StudentService studentService;

    @PostMapping("/registerStudent")  // Spring MVC mapping to the registerStudent URL
    public ModelAndView registerStudent(@RequestParam String name, 
                                        @RequestParam String gender, 
                                        @RequestParam String dateofbirth,
                                        @RequestParam String email,
                                        @RequestParam String password,
                                        @RequestParam String contact,
                                        @RequestParam String location) {
        // Create Student object
        Student student = new Student();
        student.setName(name);
        student.setGender(gender);
        student.setDateofbirth(dateofbirth);
        student.setEmail(email);
        student.setPassword(password);
        student.setContact(contact);
        student.setLocation(location);

        // Register student
        String result = studentService.StudentRegistration(student);
        ModelAndView modelAndView = new ModelAndView();

        if ("Student registered successfully".equals(result)) {
            modelAndView.setViewName("redirect:/login");  // Redirect to login page
        } else {
            modelAndView.setViewName("student_registration");  // Show registration page again
            modelAndView.addObject("message", "Registration failed. Try again.");
        }

        return modelAndView;
    }
}
