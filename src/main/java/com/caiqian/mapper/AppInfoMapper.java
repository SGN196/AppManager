package com.caiqian.mapper;

import com.caiqian.Bean.AppInfo;
import com.caiqian.dto.AppInfoDTO;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

//    public List<AppInfo> queryByDevUserId(@Param("devUserId")long id);

    List<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo);
}