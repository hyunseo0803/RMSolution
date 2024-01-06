package a.b.c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class home {
    //로그인 전 홈
    @GetMapping("/")
    public String index() {
        return "home.jsp";
    }
    //로그인 화면
    @GetMapping("/login")
    public String loginView(){
        return "login.jsp";
    }

    //회원 가입 화면
    @GetMapping("/signup")
    public String signupView(){
        return "signup.jsp";
    }
}
