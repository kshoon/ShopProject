package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Alram;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.Shop;
import yjc.wdb.dto.shopSellWishDTO;
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

	@Override
	public void deleteSPP(int prod_no, int shop_no) throws Exception {
		dao.deleteSPP(prod_no, shop_no);
		
	}

	@Override
	public List<Product> getPlist(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPlist(shop_no);
	}

	@Override
	public void InsertSPP(int prod_no, int shop_no) throws Exception {
		dao.insertSPP(prod_no, shop_no);
		
	}

	@Override
	public List<shopSellWishDTO> shopSellWish(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.shopSellWish(shop_no);
	}

	@Override
	public void updateSPU(int prod_no, int shop_no) throws Exception {
		dao.updateSPU(prod_no, shop_no);
		
	}

	@Override
	public List<Product> getSold(int shop_no) throws Exception {
		return dao.getSold(shop_no);
	}

	@Override
	public void updateSPUO(int prod_no, int shop_no) throws Exception {
		dao.updateSPUO(prod_no, shop_no);
		
	}

	@Override
	public List<Alram> getAlram(int mem_no) throws Exception{
		// TODO Auto-generated method stub
		return dao.getAlram(mem_no);
	}

	@Override
	public List<Product> getPWlist(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPWlist(shop_no);
	}

	@Override
	public void remAlr(int alram_no) throws Exception {
		dao.remAlr(alram_no);		
	}

	@Override
	public List<Product> IpSearch(int shop_no, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.IpSearch(shop_no, keyword);
	}

	@Override
	public List<Product> selectNos() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectNos();
	}

	@Override
	public List<shopSellWishDTO> selectSsw(int shop_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSsw(shop_no);
	}

	@Override
	public int getAlramProd(int alr_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAlramProd(alr_no);
	}

	



}
