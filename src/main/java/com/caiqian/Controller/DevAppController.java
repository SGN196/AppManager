package com.caiqian.Controller;

import com.caiqian.Bean.AppCategory;
import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.DevUser;
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
        Object  obj = session.getAttribute("USER_ID");
        if(obj != null){
            long userId = (long) obj;
            appInfoDTO.setDevUserId(userId);
            PageInfo<AppInfo> pageInfo = appInfoService.query(appInfoDTO);

            List<DataDictionary> appStatus =  appInfoService.queryAllAppStatus();
            List<DataDictionary> appFlatforms =  appInfoService.queryAllAppFlatforms();
            List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();


            model.addAttribute("appStatus", appStatus);
            model.addAttribute("appFlatforms", appFlatforms);
            model.addAttribute("page", pageInfo);
            model.addAttribute("levelOnex", levelOne);
            model.addAttribute("appInfoDTO", appInfoDTO);

            return "app/index";
        }else{
            return "redirect:/";
        }

    }

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") long id, Model model, HttpSession session){      //进入APP维护页面添加session
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

    @RequestMapping("/toAdd")
    public String toAdd(Model model){

        List<DataDictionary> appStatus =  appInfoService.queryAllAppStatus();
        List<DataDictionary> appFlatforms =  appInfoService.queryAllAppFlatforms();
        List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();

        model.addAttribute("appStatus", appStatus);
        model.addAttribute("appFlatforms", appFlatforms);
        model.addAttribute("levelOnex", levelOne);

        return "app/add";
    }

    @RequestMapping("/add")
    public String add(AppInfo appInfo, HttpSession httpSession){
        long userId = Long.parseLong(httpSession.getAttribute("USER_ID").toString());
        System.out.println(appInfoService.add(appInfo, userId));
        return "redirect:/app/index/devId/" + userId;

    }

    @RequestMapping("/toEdit/{id}")
    public String toEdit(@PathVariable("id")Long id, HttpSession session, Model model){
        long userId = (Long)session.getAttribute("USER_ID");

        AppInfo appInfo = appInfoService.queryById(id);
        List<DataDictionary> appStatus =  appInfoService.queryAllAppStatus();
        List<DataDictionary> appFlatforms =  appInfoService.queryAllAppFlatforms();
        List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();


        model.addAttribute("appStatus", appStatus);
        model.addAttribute("appFlatforms", appFlatforms);
        model.addAttribute("levelOnex", levelOne);

        model.addAttribute("app", appInfo);


        return "app/edit";
    }

    /**
     *
     * 明天需写历史版本的逻辑
     */
    @RequestMapping("/edit")
    public String edit(AppInfo appInfo, Model model, HttpSession session){

        Object uid = session.getAttribute("USER_ID");
        Long userId = Long.parseLong(uid.toString());
        if(appInfo.getId() == null){
            return "redirect:/app/index/devId/" + userId;
        }
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setCreateUser(devUser);
        appInfo.setModifyUser(devUser);
        appInfo.setDevUser(devUser);

        boolean flag = appInfoService.update(appInfo);

        return "redirect:/app/index/devId/" + userId;
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id")Long id, HttpSession session){
        long userId = (Long)session.getAttribute("USER_ID");
        boolean flag = appInfoService.delete(id);



        return "redirect:/app/index/devId/" + userId;
    }


    /**
     *
     * 根据appId查询历史的版本号
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/queryById/{id}")
    public String queryById(@PathVariable("id")Long id, Model model, HttpSession session){
        long userId = (Long)session.getAttribute("USER_ID");
        AppInfo app = appInfoService.queryDetailById(id);
        model.addAttribute("app", app);


        return "app/appDetail";
    }

}
