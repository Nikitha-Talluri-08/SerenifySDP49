package com.serenify.controller;

import com.serenify.model.ContactResponse;
import com.serenify.service.ContactResponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/contact")
public class ContactController {

    @Autowired
    private ContactResponseService service;

    @PostMapping("/submit")
    public ResponseEntity<String> submitContactForm(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String message) {
        ContactResponse response = new ContactResponse();
        response.setName(name);
        response.setEmail(email);
        response.setMessage(message);

        service.saveResponse(response);

        return ResponseEntity.ok("Message sent successfully!");
    }
}

