package com.tcs.ilp.service;

import com.tcs.ilp.bean.SearchExist;
import com.tcs.ilp.dao.SearchExistDAO;

public class SearchService {

	public boolean findId(SearchExist search) {
		
		SearchExistDAO find = new SearchExistDAO();
		
		boolean status = find.custexist(search);
		
		return status;
	}

}
