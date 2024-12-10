package com.serenify.controller;

import com.serenify.model.Workshop;
import com.serenify.model.WorkshopRegistration;
import com.serenify.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/workshops")
public class WorkshopController {

    @Autowired
    private WorkshopService workshopService;

    // Endpoint to fetch all workshops
    @GetMapping
    public List<Workshop> getAllWorkshops() {
        return workshopService.getAllWorkshops();
    }

    // Endpoint to register a student
    @PostMapping("/{workshopId}/register")
    public String registerStudent(
            @PathVariable Long workshopId,
            @RequestParam String studentName,
            @RequestParam String studentEmail) {
        workshopService.registerStudentForWorkshop(workshopId, studentName, studentEmail);
        return "Student registered successfully!";
    }

    // Endpoint to fetch registrations for a workshop
    @GetMapping("/{workshopId}/registrations")
    public List<WorkshopRegistration> getRegistrations(@PathVariable Long workshopId) {
        return workshopService.getRegistrationsForWorkshop(workshopId);
    }
}
