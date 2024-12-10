package com.serenify.controller;

import com.serenify.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    public LoginController() {
        // constructor
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";  // This will return the login.jsp page
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String email, @RequestParam String password, Model model) {
        // Authenticate the user and check the role
        if (userService.isAdmin(email, password)) {
            return "redirect:/admin/dashboard";  // Redirect to the admin dashboard
        } else if (userService.isStudent(email, password)) {
            return "redirect:/student/dashboard";  // Redirect to the student dashboard
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "login";  // If login fails, return to login page with error
        }
    }
}
