package com.serenify.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.serenify.service.WorkshopService;

@Controller
public class WorkshopRegistrationController {

    @Autowired
    private WorkshopService workshopService;

    @PostMapping("/registerWorkshop")
    public String registerWorkshop(@RequestParam(value = "workshopId", required = true) Long workshopId) {

        // Default values
        String defaultName = "Default Name"; // Replace with your desired default name
        String defaultEmail = "default@example.com"; // Replace with your desired default email

        // Register the student with default values
        boolean isRegistered = workshopService.registerStudentForWorkshop(workshopId, defaultName, defaultEmail);

        // Redirect based on registration status
        if (isRegistered) {
            return "redirect:/workshops.jsp?message=Registration successful!";
        } else {
            return "redirect:/workshops.jsp?message=You are already registered for this workshop.";
        }
    }
}
