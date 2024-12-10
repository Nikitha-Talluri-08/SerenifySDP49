package com.serenify.controller;

import com.serenify.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/students")
public class UserController {

    @Autowired
    private StudentService studentService;

    // Endpoint to handle student deletion
    @DeleteMapping("/{studentId}")
    public String deleteUser(@PathVariable("studentId") int studentId) {
        try {
            studentService.deleteStudentById(studentId);
            return "Student deleted successfully.";
        } catch (Exception e) {
            return "Error deleting student: " + e.getMessage();
        }
    }
}
