package com.caiqian.Controller;

import com.caiqian.Bean.AppCategory;
import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.service.AppCategoryService;
import com.caiqian.service.AppInfoService;
import com.caiqian.service.DataDictionaryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/app")
public class DevAppController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") long id, Model model){      //APP维护页面
        System.out.println(id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(1);
        pageInfo = appInfoService.queryByDevUserId(id, pageInfo);

        List<DataDictionary> appStatus =  appInfoService.queryAllAppStatus();
        List<DataDictionary> appFlatforms =  appInfoService.queryAllAppFlatforms();
        List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();


        model.addAttribute("appStatus", appStatus);
        model.addAttribute("appFlatforms", appFlatforms);
        model.addAttribute("page", pageInfo);
        model.addAttribute("levelOne", levelOne);
        return "app/index";
    }

}
