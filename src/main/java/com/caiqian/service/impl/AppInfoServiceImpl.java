package com.caiqian.service.impl;

import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.dto.AppInfoDTO;
import com.caiqian.mapper.AppInfoMapper;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.service.AppInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppInfoServiceImpl implements AppInfoService {

    @Autowired
    AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;


    @Override
    public PageInfo<AppInfo> queryByDevUserId(long id,PageInfo pageInfo) {     //调用mapper的query方法
        //去第几页，页码的大小
        PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
        AppInfoDTO appInfoDTO = new AppInfoDTO();
        appInfoDTO.setDevUserId(id);
        System.out.println("00000000000000" + appInfoDTO.toString() + "0000000000000000000000000000");
        List<AppInfo> list = appInfoMapper.query(appInfoDTO);           //在这里

        PageInfo<AppInfo> page = new PageInfo<AppInfo>(list);
        return page;
    }

    @Override
    public List<DataDictionary> queryAllAppStatus() {
        return dataDictionaryMapper.queryAllAppStatus();
    }


    @Override
    public List<DataDictionary> queryAllAppFlatforms() {
        return dataDictionaryMapper.queryAllAppFlatforms();
    }

    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {

        PageHelper.startPage(appInfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List <AppInfo> list =  appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(list);

        return page;
    }
}
