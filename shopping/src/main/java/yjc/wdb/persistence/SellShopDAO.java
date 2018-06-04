package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;

public interface SellShopDAO {
	public List<Shop> myshop(int mem_no) throws Exception;
	public void updateShop(Shop shop) throws Exception;
	public List<Product> getProd(int shop_no) throws Exception;
}