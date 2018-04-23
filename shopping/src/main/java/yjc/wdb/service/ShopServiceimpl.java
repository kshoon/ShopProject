package yjc.wdb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.persistence.ShopDAO;

@Service
public class ShopServiceimpl implements ShopService {
	@Inject
	private ShopDAO dao;

	@Override
	public List<Product> searchPro(SearchKeyword sk) {
		return dao.searchPro(sk);
	}

}
