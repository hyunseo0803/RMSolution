package a.b.c;

import jakarta.annotation.PostConstruct;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class RmSolutionApplication {

    public static void main(String[] args) {
        SpringApplication.run(RmSolutionApplication.class, args);
    }

    @PostConstruct
    private void postConstruct() {
        String userdir = System.getProperty("user.dir");
        String mydir = "\\src\\main\\webapp\\WEB-INF\\views\\files";
        String folderPath = userdir + mydir;

        createFolder(folderPath);
    }

    private void createFolder(String folderPath) {
        File folder = new File(folderPath);

        if (!folder.exists()) {
            boolean result = folder.mkdirs();
            if (result) {
                System.out.println("폴더가 생성되었습니다: " + folder.getAbsolutePath());
            } else {
                System.err.println("폴더 생성에 실패했습니다.");
            }
        } else {
            System.out.println("폴더가 이미 존재합니다: " + folder.getAbsolutePath());
        }
    }
}
