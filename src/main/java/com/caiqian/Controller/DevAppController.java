package com.caiqian.Controller;

import com.caiqian.Bean.AppInfo;
import com.caiqian.service.AppInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/app")
public class DevAppController {

    @Autowired
    AppInfoService appInfoService;

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") long id, Model model){
        System.out.println(id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(1);
        pageInfo = appInfoService.queryByDevUserId(id, pageInfo);
        model.addAttribute("page", pageInfo);
        return "app/index";
    }

}
