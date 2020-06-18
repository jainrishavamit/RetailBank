package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.tcs.ilp.bean.TransactionBean;
import com.tcs.ilp.util.DBConnection;

public class AccStatementdao_014 {
 
		public boolean Account(int AccountId) {
			boolean result = false;
			
			
			try { 
				
				Connection con=DBConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM account_info WHERE AI_Acc_ID LIKE ?");
				ps.setInt(1,AccountId);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {			
					
					result = true;
			}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result; 
		} 
		
		public ArrayList<TransactionBean> getTransaction(int AccountId,int noOfTransaction) {
			boolean result = false;
			ArrayList<TransactionBean> transArray=new ArrayList<TransactionBean>();
			
			try { 
				int no = noOfTransaction;
				Connection con=DBConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM transactions WHERE T_Acc_ID LIKE ? ORDER BY T_ID DESC limit " +no);
				
				ps.setInt(1,AccountId); 
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) 
				{
					TransactionBean trans=new TransactionBean();
					trans.setT_id(rs.getInt("T_ID"));
					trans.setT_acc_id(rs.getInt("T_Acc_ID"));
					trans.setT_transaction_date(rs.getDate("T_Transaction_Date"));
					trans.setT_source_acc(rs.getString("T_Source_Acc_Type"));
					trans.setT_target_account(rs.getString("T_Target_Acc_Type"));
					trans.setT_amount(rs.getInt("T_Amount"));
					trans.setT_description(rs.getString("T_Description"));
					transArray.add(trans);
				}
				return transArray;

				
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null; 
		} 
		
		public ArrayList<TransactionBean> getTransactionBetweenDates(int AccountId,String StartDate , String EndDate) {
			boolean result = false;
			ArrayList<TransactionBean> transArray=new ArrayList<TransactionBean>();
			try { 
				
				Connection con=DBConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM transactions WHERE T_Acc_ID LIKE ? and T_Transaction_Date between ? and ? ORDER BY T_ID ");
								
				ps.setInt(1,AccountId);
				
				
				java.sql.Date dt=new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(StartDate).getTime());
				ps.setDate(2,dt);
				 dt=new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(EndDate).getTime());
				 ps.setDate(3, dt);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) 
				{
					TransactionBean trans=new TransactionBean();
					trans.setT_id(rs.getInt("T_ID"));
					trans.setT_acc_id(rs.getInt("T_Acc_ID"));
					trans.setT_transaction_date(rs.getDate("T_Transaction_Date"));
					trans.setT_source_acc(rs.getString("T_Source_Acc_Type"));
					trans.setT_target_account(rs.getString("T_Target_Acc_Type"));
					trans.setT_amount(rs.getInt("T_Amount"));
					trans.setT_description(rs.getString("T_Description"));
					transArray.add(trans);
				}
				return transArray;
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
