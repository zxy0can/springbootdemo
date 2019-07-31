package com.aaa.service;

import com.aaa.dao.RoleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class RoleServiceImpl implements  RoleService {
    @Resource
    private RoleDao roleDao;
    @Override
    public List<Map> getRoleName() {
        return roleDao.getRoleName();
    }
}
