package com.caiqian.service;

import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AppInfoService {

    public PageInfo<AppInfo> queryByDevUserId (long id, PageInfo pageInfo);
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllAppFlatforms();
}
