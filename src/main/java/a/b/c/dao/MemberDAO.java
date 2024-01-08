package a.b.c.dao;

import a.b.c.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;


@Mapper
public interface MemberDAO {

    //회원 추가
    void insertMember(MemberVO member);

    //존재 하는 계정 인지
    String isIdDuplicate(String mid);

    //비밀 번호 일치 하는지
    Optional<MemberVO> findByUserid(String mid);

}
