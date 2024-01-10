package a.b.c.controller;

import a.b.c.service.ServiceService;
import a.b.c.vo.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class dashBoard {

    @Autowired
    ServiceService serviceService;

    //DashBoard
    @GetMapping("/dashBoard")
    public String dashboardPage(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("mid", user.getUsername());
        ServiceVO service= serviceService.findServiceByUserId(user.getUsername());
        boolean isService=service!=null;
        model.addAttribute("isService", isService);

        if(isService){
            model.addAttribute("sName",service.getKindof());
            model.addAttribute("sUsercnt",service.getKindof());
            model.addAttribute("sStartdate",service.getKindof());
            model.addAttribute("sEnddate",service.getKindof());
            model.addAttribute("sUsage",service.getUsage());

            boolean isScompany = service.getCompany() != null;
            boolean isSphone = service.getPhone() != null;
            boolean isSemail = service.getEmail() != null;
            model.addAttribute("isScompany", isScompany);
            model.addAttribute("isSphone", isSphone);
            model.addAttribute("isSemail", isSemail);

            if(isScompany){
                model.addAttribute("sCompany",service.getCompany());
            }
            if(isSphone){
                model.addAttribute("sPhone",service.getPhone());
            }
            if(isSemail){
                model.addAttribute("sEmail",service.getEmail());
            }
        }
        return "dashBoard";
    }

    @GetMapping("/service_apply")
    public String serviceApplyView(){
        return "serviceApply";
    }

    @PostMapping("/service_apply")
    public String serviceApply(ServiceVO service,@AuthenticationPrincipal User user){
        serviceService.insertService(service,user.getUsername());
        return "redirect:/dashBoard";
    }


}
