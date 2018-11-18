package com.caiqian.service;

import com.caiqian.Bean.DevUser;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


import javax.servlet.annotation.WebServlet;

@Service
public interface DevUserService {
    DevUser login(DevUser devUser);
}
