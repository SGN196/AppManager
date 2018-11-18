package com.caiqian.Controller;

import com.caiqian.Bean.DevUser;
import com.caiqian.service.AppInfoService;
import com.caiqian.service.DevUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@RequestMapping("/dev")
@Controller
public class DevUserController {

    @Autowired
    private DevUserService devUserService;

    @Autowired
    private AppInfoService appInfoService;

    @RequestMapping("/logout")
    public String logout( HttpSession httpSession){
        httpSession.removeAttribute("devUser");
        httpSession.invalidate();
        System.out.println("用户退出");
        return "redirect:/";
    }

    @RequestMapping("/toLogin")
    public String index(){
        return "dev/login";
    }

    @RequestMapping("/login")       //跳转至@Service层判断，用户名密码是否正确
    public String login(DevUser devUser, Model model, HttpSession httpSession) {
        devUser = devUserService.login(devUser);

        if(devUser == null) {
            model.addAttribute("errMsg","登录失败");
            return "dev/login";
        }
        httpSession.setAttribute("devUser", devUser);
        return "dev/index";
    }
}
