package com.caiqian.mapper;

import com.caiqian.Bean.DevUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DevUserMapper {

    public List<DevUser> queryByNamePwd(DevUser devUser);
}