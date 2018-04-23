package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;

public interface ShopDAO {
	public List<Product> searchPro(SearchKeyword sk);
}
