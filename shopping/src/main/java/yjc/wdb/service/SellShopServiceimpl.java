package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.persistence.SellShopDAO;

@Service
public class SellShopServiceimpl implements SellShopService {
	@Inject
	private SellShopDAO dao;

	@Override
	public List<Shop> myshop(int mem_no) throws Exception {
		return dao.myshop(mem_no);
	}

	@Override
	public void updateShop(Shop shop) throws Exception {
		dao.updateShop(shop);
		
	}

	@Override
	public List<Product> getProd(int shop_no) throws Exception {
		return dao.getProd(shop_no);
		
	}

	



}
