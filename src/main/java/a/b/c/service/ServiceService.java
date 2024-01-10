package a.b.c.service;

import a.b.c.dao.ServiceDAO;
import a.b.c.vo.MemberVO;
import a.b.c.vo.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void insertService(ServiceVO service, String mid) {
        Optional<MemberVO> memberOptional = memberService.findOne(mid);
        memberOptional.ifPresent(member -> {
            service.setMid(member.getMid());
            service.setKindof(service.getKindof());
            service.setUsercnt(service.getUsercnt());
            service.setDate();
            service.setMonth(service.getMonth());
            service.setCompany(service.getCompany());
            service.setPhone(service.getPhone());
            service.setEmail(service.getEmail());

            serviceDAO.insertService(service);
        });

    }
}
