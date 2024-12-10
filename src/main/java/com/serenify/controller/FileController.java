package com.serenify.controller;

import com.serenify.service.FileService;
import com.serenify.dto.PdfFileDTO;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

    private final FileService fileService;

    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    // Endpoint to display the uploaded files
    @GetMapping("/files")
    public String getFiles(Model model) {
        List<PdfFileDTO> pdfFiles = fileService.getAllFiles();
        model.addAttribute("files", pdfFiles);
        return "resources"; // Returns the JSP page name (no need to add .jsp)
    }

    // Endpoint to handle file uploads
    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("description") String description) {
        try {
            String fileName = fileService.saveFile(file);
            PdfFileDTO fileDTO = new PdfFileDTO();
            fileDTO.setName(fileName);
            fileDTO.setDescription(description);
            // Here you can save the fileDTO to a database if needed
            return "redirect:/files"; // Redirect back to the list of files after uploading
        } catch (IOException e) {
            e.printStackTrace();
            return "error"; // Handle error
        }
    }

    // Endpoint to handle file download
    @RequestMapping("/uploads/{filename}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String filename) throws IOException {
        // Load file as Resource
        Path filePath = Paths.get("uploads").resolve(filename);
        Resource resource = new UrlResource(filePath.toUri());

        // Check if the file exists and is readable
        if (resource.exists() && resource.isReadable()) {
            return ResponseEntity.ok()
                    .header("Content-Disposition", "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);
        } else {
            throw new IOException("Could not read the file: " + filename);
        }
    }
}
