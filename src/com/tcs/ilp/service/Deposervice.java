package com.tcs.ilp.service;

import com.tcs.ilp.bean.DepWithBean;
import com.tcs.ilp.dao.DepoDAO;

public class Deposervice {

	public boolean doAdd(DepWithBean depo) {
		
		DepoDAO find = new DepoDAO();
		
		boolean status = find.depo(depo);
		
		return status;
	}

	public boolean doWith(DepWithBean depo) {
		
		DepoDAO find = new DepoDAO();
		
		boolean status = find.with(depo);
		
		return status;
	}

	public boolean doTransfer(DepWithBean depo) {
		
		DepoDAO find = new DepoDAO();
		
		boolean status = find.Transfer(depo);
		
		return status;
	}

}
