package com.serenify.service;

import com.serenify.model.Workshop;
import com.serenify.model.WorkshopRegistration;
import com.serenify.repository.WorkshopRepository;
import com.serenify.repository.WorkshopRegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkshopService {

	@Autowired
	private WorkshopRepository workshopRepository; // Repository for saving workshops

	@Autowired
	private WorkshopRegistrationRepository registrationRepository; // Repository for saving registrations

	// Save a new workshop to the database
	public void save(Workshop workshop) {
		workshopRepository.save(workshop);
	}

	// Fetch all workshops
	public List<Workshop> getAllWorkshops() {
		return workshopRepository.findAll();
	}

	// Fetch all registrations for a specific workshop using the workshop object
	public List<WorkshopRegistration> getRegistrationsForWorkshop(Long workshopId) {
		// Fetch the Workshop object by ID
		Workshop workshop = workshopRepository.findById(workshopId).orElse(null);
		if (workshop != null) {
			return registrationRepository.findByWorkshop(workshop); // Fetch registrations by Workshop object
		}
		return null; // Return null if workshop not found
	}

	public boolean registerStudentForWorkshop(Long workshopId, String studentName, String studentEmail) {
		// Check if the user is already registered
		List<WorkshopRegistration> existingRegistrations = registrationRepository.findByStudentEmail(studentEmail);

		for (WorkshopRegistration registration : existingRegistrations) {
			if (registration.getWorkshop().getId().equals(workshopId)) {
				// User already registered for this workshop
				return false; // Already registered
			}
		}

		// Otherwise, proceed with registration
		Workshop workshop = workshopRepository.findById(workshopId).orElse(null);
		if (workshop != null) {
			WorkshopRegistration registration = new WorkshopRegistration(workshop, studentName, studentEmail);
			registrationRepository.save(registration);
			return true; // Registration successful
		}

		return false; // Workshop not found
	}

	public List<WorkshopRegistration> getAllRegistrations() {
		// TODO Auto-generated method stub
		return null;
	}
}
