package a.b.c.controller;

import a.b.c.service.ServiceService;
import a.b.c.service.StorageService;
import a.b.c.vo.FileVO;
import a.b.c.vo.ServiceVO;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class storageFile {
    @Autowired
    StorageService storageService;

    @Autowired
    ServiceService serviceService;

    @GetMapping("/storageUpload")
    public String storageUpload(@AuthenticationPrincipal User user, Model model) {
        ServiceVO service = serviceService.findServiceByUserId(user.getUsername());
        boolean isService = service != null;
        model.addAttribute("isService", isService);
        model.addAttribute("mid", user.getUsername());

        List<FileVO> filelist = storageService.findAllFileById(user.getUsername());
        for (FileVO file : filelist) {
            file.setConvertsize(serviceService.convertBytes(file.getSize()));
        }
        model.addAttribute("filelist", filelist);
        return "storageUpload";
    }

    @ResponseBody
    @GetMapping("/uploadCheck")
    public Map<String, Object> uploadCheck(@AuthenticationPrincipal User user, @RequestParam long fileinputsize) {
        ServiceVO service = serviceService.findServiceByUserId(user.getUsername());
        long usage = serviceService.sumUsageById(user.getUsername());

        long volume = service.getVolume() * 1099511627776L;

        LocalDate enddate = serviceService.findServiceByUserId(user.getUsername()).getEnddate();
        LocalDate today = LocalDate.now();

        boolean checking;
        if (usage + fileinputsize <= volume && !today.isAfter(enddate)) {
            checking = true;
        } else {
            checking = false;
        }
        Map<String, Object> check = new HashMap<>();
        check.put("check", checking);
        return check;
    }

    @PostMapping("/storageUpload")
    public String handleFileUpload(FileVO fileVO, MultipartFile file, @AuthenticationPrincipal User user) throws Exception {
        storageService.save(fileVO, file, user.getUsername());
        return "redirect:/storageUpload";
    }

    @DeleteMapping("/deleteFile/{num}")
    public ResponseEntity<String> fileDelete(@PathVariable int num) {
        storageService.deleteFile(num);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/storageDownload")
    public void handleFileDownload(@RequestParam("num") int num,
                                   HttpServletResponse response) throws Exception {
        try {
            FileVO file = storageService.selectFileInfo(num);

            if (!ObjectUtils.isEmpty(file)) {
                String fileName = file.getFilename();
                String storedFilePath = file.getFilepath();

                Path filePath = Paths.get(System.getProperty("user.dir") + storedFilePath);

                if (Files.exists(filePath)) {
                    // 응답 헤더 설정
                    response.setContentType("application/octet-stream");
                    response.setContentLength((int) Files.size(filePath));
                    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, StandardCharsets.UTF_8) + "\";");
                    response.setHeader("Content-Transfer-Encoding", "binary");

                    Files.copy(filePath, response.getOutputStream());
                    response.getOutputStream().flush();
                } else {
                    // 파일이 존재하지 않을 경우
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } else {
                // 해당 파일 정보가 없을 경우
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IOException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
