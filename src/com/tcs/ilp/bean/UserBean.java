
package bean;

public class UserBean {
	private String l_password,l_role,l_username;
	private int l_id,l_status;

	public UserBean() {
	}

	
	
	public UserBean( String l_username , String l_password) {
		
		this.l_password = l_password;
		this.l_username = l_username;
	}



	public UserBean(String l_username,String l_password, String l_role,  int l_status, int l_id) {
		super();
		this.l_password = l_password;
		this.l_role = l_role;
		this.l_username = l_username;
		this.l_id = l_id;
		this.l_status = l_status;
	}
	
	
	

	
	/**
	 * @return the l_username
	 */
	public String getL_username() {
		return l_username;
	}



	/**
	 * @param l_username the l_username to set
	 */
	public void setL_username(String l_username) {
		this.l_username = l_username;
	}



	/**
	 * @return the l_password
	 */
	public String getL_password() {
		return l_password;
	}

	/**
	 * @param l_password the l_password to set
	 */
	public void setL_password(String l_password) {
		this.l_password = l_password;
	}

	/**
	 * @return the l_role
	 */
	public String getL_role() {
		return l_role;
	}

	/**
	 * @param l_role the l_role to set
	 */
	public void setL_role(String l_role) {
		this.l_role = l_role;
	}

	/**
	 * @return the l_id
	 */
	public int getL_id() {
		return l_id;
	}

	/**
	 * @param l_id the l_id to set
	 */
	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	/**
	 * @return the l_status
	 */
	public int getL_status() {
		return l_status;
	}

	/**
	 * @param l_status the l_status to set
	 */
	public void setL_status(int l_status) {
		this.l_status = l_status;
	}



	@Override
	public String toString() {
		return "UserModel [l_role=" + l_role + ", l_username=" + l_username + ", l_id=" + l_id + ", l_status="
				+ l_status + "]";
	}
	
	

}

