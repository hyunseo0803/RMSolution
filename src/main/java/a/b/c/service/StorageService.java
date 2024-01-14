package a.b.c.service;

import a.b.c.dao.ServiceDAO;
import a.b.c.dao.StorageDAO;
import a.b.c.vo.FileVO;
import a.b.c.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


@Service
public class StorageService {

    @Autowired
    StorageDAO storageDAO;

    @Autowired
    ServiceDAO serviceDAO;

    @Autowired
    MemberService memberService;


    public void save(FileVO fileVO, MultipartFile file, String mid) throws Exception {
        String userdir = System.getProperty("user.dir");
        String mydir = "\\src\\main\\webapp\\WEB-INF\\views\\files";
        String projectPath = userdir + mydir;
        UUID uuid = UUID.randomUUID();
        String filename = uuid + "_" + file.getOriginalFilename();

        File savedFile = new File(projectPath, filename);
        file.transferTo(savedFile);

        LocalDateTime date = LocalDateTime.now();

        Path path = Paths.get(projectPath + "\\" + filename);

        int filesize = (int) Files.size(path);

        Optional<MemberVO> memberOptional = memberService.findOne(mid);
        memberOptional.ifPresent(member -> {
            fileVO.setMid(member.getMid());
            fileVO.setFilename(file.getOriginalFilename());
            fileVO.setFilepath(mydir + "\\" + filename);
            fileVO.setDatetime(date);
            fileVO.setSize(filesize);
            storageDAO.save(fileVO);
        });
    }

    public List<FileVO> findAllFileById(String mid) {
        return storageDAO.findAllFileById(mid);
    }

    public FileVO selectFileInfo(int num) {
        return storageDAO.selectFileInfo(num);
    }

    public void deleteFile(int num) {
        storageDAO.deleteFile(num);
    }

}
