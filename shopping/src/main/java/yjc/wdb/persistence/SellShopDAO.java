package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.shopSellWishDTO;

public interface SellShopDAO {
	public List<Shop> myshop(int mem_no) throws Exception;
	public void updateShop(Shop shop) throws Exception;
	public List<Product> getProd(int shop_no) throws Exception;
	public void deleteSPP(int prod_no, int shop_no) throws Exception;
	public List<Product> getPlist(int shop_no) throws Exception;
	public void insertSPP(int prod_no, int shop_no) throws Exception;
	public List<shopSellWishDTO> shopSellWish(int shop_no) throws Exception;
	public void updateSPU(int prod_no, int shop_no) throws Exception;
	public List<Product> getSold(int shop_no) throws Exception;
	public void updateSPUO(int prod_no, int shop_no) throws Exception;
	public List<Alram> getAlram(int mem_no) throws Exception;
}
