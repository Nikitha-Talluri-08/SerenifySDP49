package com.serenify.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "workshop_registrations")
public class WorkshopRegistration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Primary Key for WorkshopRegistration

    @ManyToOne
    @JoinColumn(name = "workshop_id", nullable = false)
    private Workshop workshop; // The associated workshop

    // Optional: Student name (remove if not required)
    @Column(name = "student_name")
    private String studentName;

    // Optional: Student email (remove if not required)
    @Column(name = "student_email")
    private String studentEmail;

    @Column(name = "registered_at", nullable = false, updatable = false)
    private LocalDateTime registeredAt; // Timestamp of registration

    // Default constructor
    public WorkshopRegistration() {
        this.registeredAt = LocalDateTime.now(); // Automatically set registration time
    }

    // Constructor with parameters
    public WorkshopRegistration(Workshop workshop, String studentName, String studentEmail) {
        this.workshop = workshop;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.registeredAt = LocalDateTime.now();
    }

	// Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Workshop getWorkshop() {
        return workshop;
    }

    public void setWorkshop(Workshop workshop) {
        this.workshop = workshop;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public LocalDateTime getRegisteredAt() {
        return registeredAt;
    }

    public void setRegisteredAt(LocalDateTime registeredAt) {
        this.registeredAt = registeredAt;
    }

    // toString for debugging purposes
    @Override
    public String toString() {
        return "WorkshopRegistration{" +
                "id=" + id +
                ", workshop=" + workshop +
                ", studentName='" + studentName + '\'' +
                ", studentEmail='" + studentEmail + '\'' +
                ", registeredAt=" + registeredAt +
                '}';
    }
}
