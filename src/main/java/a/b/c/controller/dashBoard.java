package a.b.c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class dashBoard {

    //DashBoard
    @PostMapping("/loginSuccess")
    public String Dashboard() {
        //사용자 정보 대시보드로 보냄
        return "dashBoard.jsp";
    }
}
