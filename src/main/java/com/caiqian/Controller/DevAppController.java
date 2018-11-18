package com.caiqian.Controller;

import com.caiqian.Bean.AppInfo;
import com.caiqian.service.AppInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class DevAppController {

    @Autowired
    AppInfoService appInfoService;

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") long id){
        System.out.println(id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(1);
        PageInfo<AppInfo> pageInfos = appInfoService.queryByDevUserId(id, pageInfo);
        return "app/index";
    }

}
