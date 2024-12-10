package com.serenify.service;

import com.serenify.model.ContactResponse;
import com.serenify.repository.ContactResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactResponseService {

    @Autowired
    private ContactResponseRepository repository;

    public void saveResponse(ContactResponse response) {
        repository.save(response);
    }
}

