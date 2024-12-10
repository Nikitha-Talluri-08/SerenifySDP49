package com.serenify.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class PdfFile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name; // File name
    private String url;  // File URL
    private String description;
    private LocalDateTime uploadDate;

    public PdfFile() {}

    public PdfFile(String name, String url, String description, LocalDateTime uploadDate) {
        this.name = name;
        this.url = url;
        this.description = description;
        this.uploadDate = uploadDate;
    }

    // Getters and setters
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(LocalDateTime uploadDate) {
        this.uploadDate = uploadDate;
    }
}
