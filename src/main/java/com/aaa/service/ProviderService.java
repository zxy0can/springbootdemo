package com.aaa.service;

import com.aaa.entity.Provider;

import java.util.List;
import java.util.Map;

public interface ProviderService {
    public List<Map> getProvider();
    public void addProvider(Provider provider);
    public void updateProvider(Provider provider);
    public void deleteProvider(int providerid);

}
