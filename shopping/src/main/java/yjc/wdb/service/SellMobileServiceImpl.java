package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.MyWishShopDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.persistence.SellMobileDAO;

@Service
public class SellMobileServiceImpl implements SellMobileService {
	@Inject
	private SellMobileDAO dao;

	@Override
	public List<Shop> myshop(int mem_no) throws Exception {
		return dao.myshop(mem_no);
	}

	@Override
	public List<MakDTO> shophaveProduct(int mem_no) throws Exception {
		return dao.shophaveProduct(mem_no);
	}

	@Override
	public List<Product> shophaveProduct2(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.shophaveProduct2(shop_no);
	}

	@Override
	public List<WishDTO> wlistNoProduct(int shop_no) throws Exception {
		return dao.wlistNoProduct(shop_no);
	}


	@Override
	public void shopProductIns(int shop_no, int prod_no) throws Exception{
		dao.shopProductIns(shop_no, prod_no);
		
	}

	@Override
	public void shopProductRem(int shop_no, int prod_no) throws Exception {
		dao.ShopProductRem(shop_no, prod_no);
		
	}

	@Override
	public List<Product> plist(int shop_no) throws Exception {
		return dao.plist(shop_no);
	}

	@Override
	public List<Shop> AllShop() throws Exception {
		
		return dao.AllShop();
		
	}

	@Override
	public List<MyWishShopDTO> MyWishShop(int mem_no) throws Exception {
		return dao.MyWishShop(mem_no);
	}

	@Override
	public List<MyWishShopDTO> BookWishShop(int mem_no) throws Exception {
		return dao.BookWishShop(mem_no);
	}

	@Override
	public int CheckBook(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.CheckBook(mem_no);
	}
}
