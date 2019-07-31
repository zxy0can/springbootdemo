package com.aaa.service;

import java.util.List;
import java.util.Map;

public interface PurchaseService {
    public int getCount();
    public boolean addApplyOrder(Map map);
    public List<Map> getPurchase();
    public List<Map> getPurchaseDetail(String purordernumber);
}
