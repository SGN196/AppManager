package com.caiqian.service;

import com.caiqian.Bean.AppCategory;

import java.util.List;

public interface AppCategoryService {

    List<AppCategory> queryAllLevelOne();

    List<AppCategory> queryLevelTwoByLevelOne(Integer id);

    List<AppCategory> queryLevelThreeByLevelTwo(Integer id);
}
