package com.serenify.repository;

import com.serenify.model.ContactResponse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactResponseRepository extends JpaRepository<ContactResponse, Long> {
}

