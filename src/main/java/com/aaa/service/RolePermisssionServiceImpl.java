package com.aaa.service;

import com.aaa.dao.RolePermisssionDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class RolePermisssionServiceImpl implements RolePermisssionService {
     @Resource
    private RolePermisssionDao rolePermisssionDao;
    @Override
    public List<Map> query(Integer employeeid) {
        return rolePermisssionDao.query(employeeid);
    }
}
