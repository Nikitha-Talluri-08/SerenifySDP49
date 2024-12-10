package com.serenify.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.serenify.model.Workshop;
import com.serenify.model.WorkshopRegistration;

@Repository
public interface WorkshopRegistrationRepository extends JpaRepository<WorkshopRegistration, Long> {

    boolean existsByWorkshopIdAndStudentEmail(Long workshopId, String studentEmail);

	List<WorkshopRegistration> findByStudentEmail(String studentEmail);

	List<WorkshopRegistration> findByWorkshop(Workshop workshop);
}
