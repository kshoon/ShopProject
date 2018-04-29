package yjc.wdb.persistence;

import java.util.List;

import yjc.wdb.domain.Member;
import yjc.wdb.domain.Product;
import yjc.wdb.domain.SearchKeyword;
import yjc.wdb.dto.LoginDTO;

public interface ShopDAO {
	public List<Product> searchPro(SearchKeyword sk) throws Exception;
	public Member login(LoginDTO dto) throws Exception;
}
