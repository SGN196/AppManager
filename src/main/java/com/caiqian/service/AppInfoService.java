package com.caiqian.service;

import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.dto.AppInfoDTO;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AppInfoService {

    public PageInfo<AppInfo> queryByDevUserId (long id, PageInfo pageInfo);
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllAppFlatforms();

    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo, long userId);
}
