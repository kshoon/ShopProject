package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.MyWishShopDTO;
import yjc.wdb.dto.WishDTO;

public interface SellMobileDAO {
	List<Shop> myshop(int mem_no) throws Exception;
	List<MakDTO> shophaveProduct(int mem_no) throws Exception;
	List<Product> shophaveProduct2(int shop_no) throws Exception;
	List<Product> plist(int shop_no) throws Exception;
	List<WishDTO> wlistNoProduct(int shop_no) throws Exception;
	void shopProductIns(int shop_no, int prod_no) throws Exception;
	void ShopProductRem(int shop_no, int prod_no) throws Exception;
	public List<Shop> AllShop() throws Exception;
	List<MyWishShopDTO> MyWishShop(int mem_no) throws Exception;
	List<MyWishShopDTO> BookWishShop(int mem_no) throws Exception;
	int CheckBook(int mem_no) throws Exception;
}
