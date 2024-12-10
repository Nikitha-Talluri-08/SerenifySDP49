package com.serenify.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Workshop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private String venue;
    private String date;

    @OneToMany(mappedBy = "workshop", cascade = CascadeType.ALL)
    private List<WorkshopRegistration> registrations;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    @OneToMany(mappedBy = "workshop")
    public List<WorkshopRegistration> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(List<WorkshopRegistration> registrations) {
        this.registrations = registrations;
    }
}
