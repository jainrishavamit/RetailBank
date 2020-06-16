package com.tcs.ilp.bean;

public class SearchExist {
	
	private long CustId;
	private long AccId;

	private long balanceS;
	private long balanceC;
	private String dateCreationS;
	private String dateCreationC;
	private String statusS;
	private String statusC;
	private String dateUpdateS;
	private String dateUpdateC;
	private long AccIdC;
	private long AccIdS;
	
	private int cust=0;
	
	
	public int getCust() {
		return cust;
	}
	public void setCust(int cust) {
		this.cust = cust;
	}
	public long getAccIdC() {
		return AccIdC;
	}
	public void setAccIdC(long accIdC) {
		AccIdC = accIdC;
	}
	public long getAccIdS() {
		return AccIdS;
	}
	public void setAccIdS(long accIdS) {
		AccIdS = accIdS;
	}
	public String getDateUpdateS() {
		return dateUpdateS;
	}
	public void setDateUpdateS(String dateUpdateS) {
		this.dateUpdateS = dateUpdateS;
	}
	public String getDateUpdateC() {
		return dateUpdateC;
	}
	public void setDateUpdateC(String dateUpdateC) {
		this.dateUpdateC = dateUpdateC;
	}
	
	public long getBalanceS() {
		return balanceS;
	}
	public void setBalanceS(long balanceS) {
		this.balanceS = balanceS;
	}
	public long getBalanceC() {
		return balanceC;
	}
	public void setBalanceC(long balanceC) {
		this.balanceC = balanceC;
	}
	public String getDateCreationS() {
		return dateCreationS;
	}
	public void setDateCreationS(String dateCreationS) {
		this.dateCreationS = dateCreationS;
	}
	public String getDateCreationC() {
		return dateCreationC;
	}
	public void setDateCreationC(String dateCreationC) {
		this.dateCreationC = dateCreationC;
	}
	public String getStatusS() {
		return statusS;
	}
	public void setStatusS(String statusS) {
		this.statusS = statusS;
	}
	public String getStatusC() {
		return statusC;
	}
	public void setStatusC(String statusC) {
		this.statusC = statusC;
	}
	public long getCustId() {
		return CustId;
	}
	public void setCustId(long custId) {
		CustId = custId;
	}
	public long getAccId() {
		return AccId;
	}
	public void setAccId(long accId) {
		AccId = accId;
	}
	
}
