package a.b.c.service;

import a.b.c.dao.MemberDAO;
import a.b.c.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    //memberVo에 mid,pw 담아 회원 추가
    public void insertMember(MemberVO member) {
        member.setPw(member.getPw());
        member.setMid(member.getMid());
        memberDAO.insertMember(member);
    }

    //mid 에 일치 하는 비밀 번호 가져 오기
    public String findByIdpw(String mid) {
        return memberDAO.findByIdpw(mid);

    }

    //계정 존재 여부 확인 하는 공통 함수,(로그인, 회원 가입 아이디 중복 검사)
    public Boolean IsExistingMember(String mid) {
        String existingMember = memberDAO.isIdDuplicate(mid);
        return existingMember.equals("1");
    }
}
