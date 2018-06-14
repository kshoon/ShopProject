package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.domain.Shop;
import yjc.wdb.domain.Wishlist;
import yjc.wdb.dto.InsertDTO;
import yjc.wdb.dto.LoginDTO;
import yjc.wdb.dto.MakDTO;
import yjc.wdb.dto.WishDTO;
import yjc.wdb.dto.alrListDTO;
import yjc.wdb.persistence.ShopDAO;

@Service
public class ShopServiceimpl implements ShopService {
	@Inject
	private ShopDAO dao;

	@Override
	public List<Product> searchPro(SearchKeyword sk) throws Exception {
		return dao.searchPro(sk);
	}

	@Override
	public Member login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public List<WishDTO> getwish(int mem_no) throws Exception {
		return dao.getwish(mem_no);
	}

	@Override
	public void insertWish(WishDTO dto) throws Exception {
		dao.insertWish(dto);
		
	}

	@Override
	public List<MakDTO> makList(int product_no) throws Exception {
		return dao.makList(product_no);
	}

	@Override
	public List<MakDTO> shopList() throws Exception {
		return dao.shopList();
	}

	@Override
	public void insertBtnWish(String keyval) throws Exception {
		dao.insertBtnWish(keyval);
		
	}

	@Override
	public WishDTO selectProductList(String keyval) throws Exception {
		return dao.selectProductList(keyval);
	}

	@Override
	public void deleteW(int wish_no, int mem_no) throws Exception{
		dao.deleteW(wish_no, mem_no);
		
	}

	@Override
	public Member getMem(int mem_no) throws Exception {
		
		return dao.getMem(mem_no);
	}

	@Override
	public List<Shop> getShop() throws Exception {
		
		return dao.getShop();
	}

	@Override
	public Shop getShopOne(int shop_no) throws Exception {
		return dao.getShopOne(shop_no);
	}

	@Override
	public List<Product> getShopProd(int member_no) throws Exception {
		return dao.getShopProd(member_no);
	}

	@Override
	public Wishlist checkWish(int mem_no, int prod_no) throws Exception {
		return dao.checkWish(mem_no, prod_no);
	}

	@Override
	public void updateWish(int wish_no) throws Exception {
		dao.updateWish(wish_no);
		
	}

	@Override
	public int productbool(String searchText) throws Exception {
		// TODO Auto-generated method stub
		return dao.productbool(searchText);
	}

	@Override
	public Product getProdOne(int prod_no) throws Exception {
		return dao.getProdOne(prod_no);
	}

	@Override
	public int whisInProd(String product_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.whisInProd(product_name);
	}

	@Override
	public List<Shop> getShopMem(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getShopMem(mem_no);
	}

	@Override
	public List<alrListDTO> alrList(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.alrList(prod_no);
	}



}
