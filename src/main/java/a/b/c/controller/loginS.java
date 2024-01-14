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
    @ResponseBody //JSON 변환
    @GetMapping("/checkDuplicate/{mid}")
    public Map<String, Object> checkDuplicate(@PathVariable String mid) {
        Boolean check = memberService.IsExistingMember(mid);
        Map<String, Object> checking = new HashMap<>();
        checking.put("checking", check);
        return checking;

    }

}


