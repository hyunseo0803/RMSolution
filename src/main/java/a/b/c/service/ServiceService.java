package a.b.c.service;

import a.b.c.dao.ServiceDAO;
import a.b.c.vo.MemberVO;
import a.b.c.vo.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Optional;

@Service
public class ServiceService {
    @Autowired
    ServiceDAO serviceDAO;


    @Autowired
    MemberService memberService;

    public ServiceVO findServiceByUserId(String userId) {
        return serviceDAO.findServiceByUserId(userId);
    }

    public Integer sumUsageById(String userId) {
        return serviceDAO.sumUsageById(userId);
    }

    public void saveNewEnddate(LocalDate newenddate, String mid) {
        serviceDAO.saveNewEnddate(newenddate, mid);
    }

    public void saveNewVolume(String userId, int newvolume) {
        serviceDAO.saveNewVolume(userId, newvolume);
    }

    public String convertBytes(long bytes) {
        String[] units = {"B", "KB", "MB", "GB", "TB"};
        int unitIndex = 0;
        double size = bytes;

        while (size >= 1024 && unitIndex < units.length - 1) {
            size /= 1024;
            unitIndex++;
        }

        DecimalFormat df = new DecimalFormat("#.##");
        return df.format(size) + " " + units[unitIndex];
    }

    public void insertService(ServiceVO service, String mid) {
        int volume;
        if (service.getKindof().equals("basic")) {
            volume = 3;
        } else if (service.getKindof().equals("standard")) {
            volume = 6;
        } else {
            volume = 10;
        }

        int month = service.getMonth();
        LocalDate sEnddate = service.getStartdate().plusMonths(month);

        Optional<MemberVO> memberOptional = memberService.findOne(mid);
        memberOptional.ifPresent(member -> {
            service.setMid(member.getMid());
            service.setKindof(service.getKindof());
            service.setUsername(service.getUsername());
            service.setStartdate();
            service.setEnddate(sEnddate);
            service.setCompany(service.getCompany());
            service.setPhone(service.getPhone());
            service.setEmail(service.getEmail());
            service.setVolume(volume);
            serviceDAO.insertService(service);
        });

    }
}
