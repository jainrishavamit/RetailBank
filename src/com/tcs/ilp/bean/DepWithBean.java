package com.tcs.ilp.bean;

public class DepWithBean {
	public DepWithBean() {
		super();
		this.source = null;
		DesAccId = 0L;
		this.custId = 0L;
		this.accId = 0L;
		this.status = null;
		this.Amount = 0L;
		this.type = null;
	}
	private String  source;
	private Long DesAccId;
	
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Long getDesAccId() {
		return DesAccId;
	}
	public void setDesAccId(Long desAccId) {
		DesAccId = desAccId;
	}
	private Long custId;
	public Long getCustId() {
		return custId;
	}
	public void setCustId(Long custId) {
		this.custId = custId;
	}
	private Long accId;
	private String status;
	private Long Amount;
	private String type;
	public Long getAccId() {
		return accId;
	}
	public void setAccId(Long accId) {
		this.accId = accId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Long getAmount() {
		return Amount;
	}
	public void setAmount(Long amount) {
		Amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}