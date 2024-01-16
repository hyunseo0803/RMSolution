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
    public String signup(MemberVO member) {
        memberService.insertMember(member);
        return "home";
    }

    //회원 가입- 아이디 중복 검사
    @GetMapping("/checkDuplicate")
    @ResponseBody
    public Map<String, Object> checkDuplicate(@RequestParam String memberId) {
        boolean check = memberService.isIdDuplicate(memberId);
        Map<String, Object> result = new HashMap<>();
        result.put("idcheck", check);
        return result;
    }



}


