package com.caiqian.service.impl;

import com.caiqian.Bean.DevUser;
import com.caiqian.mapper.DevUserMapper;
import com.caiqian.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {


    @Autowired
    private DevUserMapper devUserMapper;

    @Override
    public DevUser login(DevUser devUser) {
        List<DevUser> users = devUserMapper.queryByNamePwd(devUser);
        if(users != null && users.size() == 1){
            return users.get(0);
        }
        return null;
    }
}
