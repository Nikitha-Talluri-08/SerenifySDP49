package com.serenify.controller;

import com.serenify.model.PdfFile;
import com.serenify.model.Workshop;
import com.serenify.repository.PdfFileRepository;
import com.serenify.service.FileService;
import com.serenify.service.WorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {


	private final WorkshopService workshopService;
	

    @Autowired
    private FileService fileService;

    @Autowired
    private PdfFileRepository pdfFileRepository;

	@Autowired
	public AdminController(WorkshopService workshopService) {
		this.workshopService = workshopService;
	}

	@GetMapping("/dashboard")
	public String showAdminDashboard() {
		return "adminDashboard";
	}

	@GetMapping("/workshops/add")
	public String showAddWorkshopForm(Model model) {
		model.addAttribute("workshop", new Workshop());
		return "addWorkshop";
	}

	@PostMapping("/workshops/add")
	public String addWorkshop(@ModelAttribute Workshop workshop) {
		workshopService.save(workshop);
		return "redirect:/admin/dashboard";
	}

	@GetMapping("/workshops")
	public String viewAllWorkshops(Model model) {
		List<Workshop> workshops = workshopService.getAllWorkshops();
		model.addAttribute("workshops", workshops);
		return "adminWorkshops";
	}

	@GetMapping("/workshops/{workshopId}/registrations")
	public String viewWorkshopRegistrations(@PathVariable Long workshopId, Model model) {
		model.addAttribute("registrations", workshopService.getRegistrationsForWorkshop(workshopId));
		return "workshopRegistrations";
	}
	
	@PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
                                             @RequestParam("description") String description) {
        try {
            String fileName = fileService.saveFile(file);
            PdfFile pdfFile = new PdfFile();
            pdfFile.setName(fileName);
            pdfFile.setUrl("/files/download/" + fileName);
            pdfFile.setDescription(description);
            pdfFile.setUploadDate(LocalDateTime.now());
            pdfFileRepository.save(pdfFile);
            return ResponseEntity.ok("File uploaded successfully");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File upload failed");
        }
    }
}
