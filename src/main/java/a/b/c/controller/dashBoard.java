package a.b.c.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class dashBoard {

    //DashBoard
    @GetMapping("/dashBoard")
    public String dashboardPage(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("mid", user.getUsername());
        return "dashBoard";
    }
}
