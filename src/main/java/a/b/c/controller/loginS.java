package a.b.c.controller;

import a.b.c.service.MemberService;
import a.b.c.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class loginS {

    @Autowired
    private MemberService memberService;


    //회원 가입- 회원 추가
    @PostMapping("/signup")
    public String signup(MemberVO member){
        memberService.insertMember(member);
        return "home.jsp";
    }

    //회원 가입- 아이디 중복 검사
    @ResponseBody //JSON 변환
    @GetMapping("/checkDuplicate/{mid}")
    public Map<String, Object> checkDuplicate(@PathVariable String mid){
        Boolean check=memberService.IsExistingMember(mid);
        Map<String, Object> checking = new HashMap<>();
        checking.put("checking", check);
        return checking;

    }

    //로그인- 계정 존재 확인 후 , 비밀 번호 확인
    @ResponseBody //JSON 변환
    @PostMapping("/isUser")
    public Map<String, Object> login(@RequestParam String mid,@RequestParam String pw) {
        Map<String, Object> user = new HashMap<>();
        if (memberService.IsExistingMember(mid)){
            String memberpw = memberService.findByIdpw(mid);
            Boolean isuser = memberpw.equals(pw);
            user.put("isUser", isuser);
            return user;
        }
        //존재 하는 계정이 아닐 경우, 바로 false 리턴
        else {
            user.put("isUser",false);
            return user;
        }
    }

}


