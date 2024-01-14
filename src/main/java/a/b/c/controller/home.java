package a.b.c.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class home {
    //로그인 전 홈
    @GetMapping("/")
    public String index(@AuthenticationPrincipal User user, Model model) {
        boolean isLogin = user != null;
        model.addAttribute("isLogin", isLogin);

        if (isLogin) {
            model.addAttribute("mid", user.getUsername());
        }

        return "home";
    }

    //로그인 화면
    @GetMapping("/login")
    public String loginView() {
        return "login";
    }

    //회원 가입 화면
    @GetMapping("/signup")
    public String signupView() {
        return "signup";
    }
}
