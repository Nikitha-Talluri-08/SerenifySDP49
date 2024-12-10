package com.serenify.service;

import com.serenify.dto.PdfFileDTO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.List;
import java.util.ArrayList;

@Service
public class FileService {

    private final String uploadDir = "uploads/";  // Ensure this path is correct and accessible

    // Save the uploaded file
    public String saveFile(MultipartFile file) throws IOException {
        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();  // Unique file name
        Path filePath = Paths.get(uploadDir + fileName);  // File path
        Files.createDirectories(filePath.getParent());  // Create directories if they don't exist
        Files.write(filePath, file.getBytes());  // Save the file
        return fileName;  // Return the saved file's name
    }

    @GetMapping("/files")
    public String getFiles(Model model) {
        try {
            // Get all file names in the 'uploads/' directory
            List<String> fileNames = Files.list(Paths.get(uploadDir))
                    .filter(Files::isRegularFile)
                    .map(Path::getFileName)
                    .map(Path::toString)
                    .collect(Collectors.toList());

            model.addAttribute("files", fileNames);  // Add the file names to the model
        } catch (IOException e) {
            e.printStackTrace();  // Handle error (e.g., log it)
        }
        return "resources"; // Returns the JSP page name
    }

	public List<PdfFileDTO> getAllFiles() {
		// TODO Auto-generated method stub
		return null;
	}
}
