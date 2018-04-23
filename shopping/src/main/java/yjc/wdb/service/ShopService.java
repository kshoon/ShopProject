package yjc.wdb.service;

import java.util.List;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;

public interface ShopService {
	public List<Product> searchPro(SearchKeyword sk);
}
