package com.caiqian.mapper;

import com.caiqian.Bean.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {
    public List<AppInfo> queryByDevUserId(@Param("devUserId")long id);
}