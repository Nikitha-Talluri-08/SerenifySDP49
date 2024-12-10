package com.serenify.controller;

import com.serenify.service.CounsellingSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentPortalController {

    @Autowired
    private CounsellingSessionService counsellingSessionService;

    @GetMapping("/viewCounsellingSessions")
    public String viewCounsellingSessions(Model model) {
        model.addAttribute("sessions", counsellingSessionService.getAllSessions());
        return "viewCounsellingSessions";
    }
}
