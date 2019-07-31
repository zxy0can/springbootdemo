package com.aaa.service;

import com.aaa.dao.PurchaseDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {
    @Resource
    private PurchaseDao purchaseDao;
    @Override
    public int getCount() {
        return purchaseDao.getCount();
    }
    @Override
    public boolean addApplyOrder(Map map) {
        int num=  purchaseDao.addPurchaseMaster(map);//添加总表
        //添加详情表
        List<Map> list= (List<Map>)map.get("goods");
        int num2=   purchaseDao.addPurchaseDetail(list);
        if(num>0 && num2>0){
            return  true;
        }
        return false;
    }

    @Override
    public List<Map> getPurchase() {
        return purchaseDao.getPurchase();
    }

    @Override
    public List<Map> getPurchaseDetail(String purordernumber) {
        return purchaseDao.getPurchaseDetail(purordernumber);
    }
}
