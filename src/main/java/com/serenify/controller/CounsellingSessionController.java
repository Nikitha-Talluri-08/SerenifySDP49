package com.serenify.controller;

import com.serenify.model.CounsellingSession;
import com.serenify.service.CounsellingSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/admin")
public class CounsellingSessionController {

    @Autowired
    private CounsellingSessionService counsellingSessionService;

    @GetMapping("/addCounsellingSession")
    public String showAddCounsellingSessionForm() {
        return "addCounsellingSession";
    }

    @PostMapping("/addCounsellingSession")
    public String addCounsellingSession(@RequestParam String counselorName,
                                        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate sessionDate,
                                        @RequestParam String venue) {
        CounsellingSession session = new CounsellingSession();
        session.setCounselorName(counselorName);
        session.setSessionDate(sessionDate);
        session.setVenue(venue);
        counsellingSessionService.saveCounsellingSession(session);
        return "redirect:/admin/dashboard";
    }
}
