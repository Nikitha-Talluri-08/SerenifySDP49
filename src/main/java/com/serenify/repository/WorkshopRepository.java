package com.serenify.repository;

import com.serenify.model.Workshop;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkshopRepository extends JpaRepository<Workshop, Long> {

	Workshop save(Workshop workshop);

	List<Workshop> findAll();
}
