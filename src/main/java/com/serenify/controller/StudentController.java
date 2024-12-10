package com.serenify.controller;

import com.serenify.model.Workshop;
import com.serenify.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    private final WorkshopService workshopService;

    @Autowired
    public StudentController(WorkshopService workshopService) {
        this.workshopService = workshopService;
    }

    @GetMapping("/dashboard")
    public String showStudentDashboard() {
        return "studentDashboard";
    }

    @GetMapping("/workshops")
    public String viewAvailableWorkshops(Model model) {
        model.addAttribute("workshops", workshopService.getAllWorkshops());
        return "studentWorkshops";
    }

}
