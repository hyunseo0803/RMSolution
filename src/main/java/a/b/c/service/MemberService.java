package a.b.c.service;

import a.b.c.dao.MemberDAO;
import a.b.c.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //memberVo에 mid,pw 담아 회원 추가
    public void insertMember(MemberVO member) {
        member.setPw(bCryptPasswordEncoder.encode(member.getPw()));
        member.setMid(member.getMid());
        memberDAO.insertMember(member);
    }

    public Optional<MemberVO> findOne(String userId) {
        return memberDAO.findByUserid(userId);
    }


    //계정 존재 여부 확인 하는 공통 함수,(로그인, 회원 가입 아이디 중복 검사)
    public Boolean IsExistingMember(String mid) {
        String existingMember = memberDAO.isIdDuplicate(mid);
        return existingMember.equals("1");
    }
}
