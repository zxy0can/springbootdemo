package com.aaa.service;

import com.aaa.dao.ProviderDao;
import com.aaa.entity.Provider;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class ProviderServiceImpl implements  ProviderService {
    @Resource
    public ProviderDao providerDao;
    @Override
    public List<Map> getProvider() {
        return providerDao.getProvider();
    }

    @Override
    public void addProvider(Provider provider) {
        providerDao.addProvider(provider);
    }

    @Override
    public void updateProvider(Provider provider) {
        providerDao.updateProvider(provider);
    }

    @Override
    public void deleteProvider(int providerid) {
        providerDao.deleteProvider(providerid);
    }
}
