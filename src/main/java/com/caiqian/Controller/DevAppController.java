package com.caiqian.Controller;

import com.caiqian.Bean.AppCategory;
import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.dto.AppInfoDTO;
import com.caiqian.service.AppCategoryService;
import com.caiqian.service.AppInfoService;
import com.caiqian.service.DataDictionaryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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

    /**
     *
     * 前端传过来的levelOne的值，被springMvc转换成了String，原始的long类型无法获取。
     * 现将AppInfoDto类中的字段，修改为string类型12/7
     * @param appInfoDTO
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/query")
    public String query(AppInfoDTO appInfoDTO, Model model, HttpSession session){
        System.out.println(appInfoDTO.getLevelOne() + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        Object  obj = session.getAttribute("USER_ID");
        if(obj != null){
//            long level1 = Long.parseLong(levelOne);

            long userId = (long) obj;
            appInfoDTO.setDevUserId(userId);
//            appInfoDTO.setLevelOne(level1);
            PageInfo<AppInfo> pageInfo = appInfoService.query(appInfoDTO);

            List<DataDictionary> appStatus =  appInfoService.queryAllAppStatus();
            List<DataDictionary> appFlatforms =  appInfoService.queryAllAppFlatforms();
            List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();


            model.addAttribute("appStatus", appStatus);
            model.addAttribute("appFlatforms", appFlatforms);
            model.addAttribute("page", pageInfo);
            model.addAttribute("levelOnex", levelOne);

            return "app/index";
        }else{
            return "redirect:/";
        }

    }

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") long id, Model model, HttpSession session){      //APP维护页面
        System.out.println(id);
        session.setAttribute("USER_ID", id);
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
        model.addAttribute("levelOnex", levelOne);
        return "app/index";
    }

}
