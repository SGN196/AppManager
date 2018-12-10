package com.caiqian.service.impl;

import com.caiqian.Bean.AppInfo;
import com.caiqian.Bean.DataDictionary;
import com.caiqian.Bean.DevUser;
import com.caiqian.constant.CommonCodeConstant;
import com.caiqian.dto.AppInfoDTO;
import com.caiqian.mapper.AppInfoMapper;
import com.caiqian.mapper.DataDictionaryMapper;
import com.caiqian.service.AppInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.sql.Date;
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

    @Override
    public boolean add(AppInfo appInfo, long userId) {
        appInfo.setDevId(userId);
//        appInfo.setCreationDate(new Date(System.currentTimeMillis())); //事实证明使用java.sql.date向数据库中的datetime类型的字段，进行传值是错误的决定
        appInfo.setCreationDate(new java.util.Date());

        //创建devUser对象
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setDevUser(devUser);

        //创建DataDictionary对象
        DataDictionary status = new DataDictionary();
        status.setTypeCode("APP_STATUS");
        status.setValueId(CommonCodeConstant.APP_STATUS_AUDITED);
        appInfo.setAppStatus(status);
        return appInfoMapper.add(appInfo);
    }


    @Override
    public boolean delete(Long id) {
        if(id != null) {
            int row = appInfoMapper.deleteById(id);
            return row == 1 ? true : false;
        }
        return false;
    }

    @Override
    public boolean update(AppInfo appInfo) {
        appInfo.setModifyDate(new java.util.Date());
        appInfo.setUpdateDate(new java.util.Date());

        if( appInfoMapper.updateById(appInfo)){

            return true;
        }else
            return false;

    }

    @Override
    public AppInfo queryById(Long id) {
        return appInfoMapper.queryById(id);
    }

    @Override
    public AppInfo queryDetailById(Long id) {
        return appInfoMapper.queryDetailById(id);
    }
}
