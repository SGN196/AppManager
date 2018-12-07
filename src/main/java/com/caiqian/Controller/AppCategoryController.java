package com.caiqian.Controller;

import com.caiqian.Bean.AppCategory;
import com.caiqian.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class AppCategoryController {



    @Autowired
    private AppCategoryService appCategoryService;

    @ResponseBody
    @RequestMapping("/queryLevelTwoByLevelOne/{levelOneId}")
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOneId") Integer id){
        List<AppCategory> levelTwo =  appCategoryService.queryLevelTwoByLevelOne(id);
        return levelTwo;
    }

    @ResponseBody
    @RequestMapping("/queryLevelThreeByLevelTwo/{levelTwoId}")
    public List<AppCategory> queryLevelThreeByLevelTwo(@PathVariable("levelTwoId") Integer id){
        List<AppCategory> levelThree = appCategoryService.queryLevelTwoByLevelOne(id);
        return levelThree;
    }
    

}
