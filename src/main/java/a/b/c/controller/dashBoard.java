package a.b.c.controller;

import a.b.c.service.ServiceService;
import a.b.c.vo.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;


@Controller
public class dashBoard {

    @Autowired
    ServiceService serviceService;


    //DashBoard
    @GetMapping("/dashBoard")
    public String dashboardPage(@AuthenticationPrincipal User user, Model model) {
        ServiceVO service = serviceService.findServiceByUserId(user.getUsername());

        boolean isService = service != null;
        model.addAttribute("isService", isService);
        model.addAttribute("mid", user.getUsername());

        if (isService) {
            Integer usage = serviceService.sumUsageById(user.getUsername());
            String usageBTtoTB;
            if (usage != null) {
                usageBTtoTB = serviceService.convertBytes(usage);
            } else {
                usageBTtoTB = "0";
            }
            model.addAttribute("sName", service.getKindof());
            model.addAttribute("sUsername", service.getUsername());
            model.addAttribute("sStartdate", service.getStartdate());
            model.addAttribute("sEnddate", service.getEnddate());
            model.addAttribute("sUsage", usageBTtoTB);
            model.addAttribute("sVolume", service.getVolume());
            model.addAttribute("sCompany", service.getCompany());
            model.addAttribute("sPhone", service.getPhone());
            model.addAttribute("sEmail", service.getEmail());
        }
        return "dashBoard";
    }


    @GetMapping("/service_apply")
    public String serviceApplyView() {
        return "serviceApply";
    }

    @GetMapping("/volume_extend")
    public String extendVolumeView() {
        return "extendVolume";
    }

    @ResponseBody
    @GetMapping("/confirmPay/{addvolume}")
    public Map<String, Object> confirmPay(@AuthenticationPrincipal User user, @PathVariable int addvolume) {
        String servicename = serviceService.findServiceByUserId(user.getUsername()).getKindof();
        int totalpay = 0;
        if (servicename.equals("basic")) {
            totalpay = addvolume * 4000;
        } else if (servicename.equals("standard")) {
            totalpay = addvolume * 6000;
        } else if (servicename.equals("premium")) {
            totalpay = addvolume * 8000;
        }
        Map<String, Object> confirmpay = new HashMap<>();
        confirmpay.put("totalpay", totalpay);
        confirmpay.put("servicename", servicename);
        return confirmpay;
    }

    @PostMapping("/service_apply")
    public String serviceApply(ServiceVO service, @AuthenticationPrincipal User user) {
        serviceService.insertService(service, user.getUsername());
        return "redirect:/dashBoard";
    }

    @PostMapping("/extendPeriod")
    @ResponseBody
    public Map<String, Object> extendPeriod(@AuthenticationPrincipal User user, @RequestParam int howMonth) {
        ServiceVO service = serviceService.findServiceByUserId(user.getUsername());
        LocalDate enddate = service.getEnddate();
        LocalDate newEnddate = enddate.plusMonths(howMonth);
        boolean checking;

        try {
            serviceService.saveNewEnddate(newEnddate, user.getUsername());
            checking = true;
        } catch (Exception e) {
            checking = false;
        }

        Map<String, Object> check = new HashMap<>();
        check.put("check", checking);
        return check;


    }

    @PostMapping("/extendVolume")
    @ResponseBody
    public Map<String, Object> extendVolue(@AuthenticationPrincipal User user, @RequestParam int addvolume) {
        int volume = serviceService.findServiceByUserId(user.getUsername()).getVolume();
        int newvolume = volume + addvolume;

        boolean checking;

        try {
            serviceService.saveNewVolume(user.getUsername(), newvolume);
            checking = true;
        } catch (Exception e) {
            checking = false;
        }

        Map<String, Object> check = new HashMap<>();
        check.put("check", checking);
        return check;
    }

}