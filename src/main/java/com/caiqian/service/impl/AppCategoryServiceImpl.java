package com.caiqian.service.impl;

import com.caiqian.Bean.AppCategory;
import com.caiqian.mapper.AppCategoryMapper;
import com.caiqian.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevelOne() {
        return appCategoryMapper.queryAllLevelOne();
    }


    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Integer id) {
        return appCategoryMapper.queryLevelTwoByLevelOne(id);
    }

    @Override
    public List<AppCategory> queryLevelThreeByLevelTwo(Integer id) {
        return appCategoryMapper.queryLevelThreeByLevelTwo(id);
    }
}
