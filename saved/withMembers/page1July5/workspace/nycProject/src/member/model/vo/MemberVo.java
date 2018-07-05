package member.model.vo;

import java.sql.Date;

public class MemberVo {
	private int MNO;
	private String M_ID;
	private String M_PW;
	private String M_NAME;
	private char M_GENDER;
	private String E_MAIL;
	private String M_PHONE;
	private String M_ADDRESS;
	private String M_CATEGORY;
	private Date ENTERDATE;
	private int M_age;
	
	public int getM_age() {
		return M_age;
	}
	public void setM_age(int m_age) {
		M_age = m_age;
	}
	public MemberVo(String m_ID, String m_PW, String m_NAME, char m_GENDER, String e_MAIL, String m_PHONE,
			String m_ADDRESS, String m_CATEGORY,int age) {
		super();
	
		M_ID = m_ID;
		M_PW = m_PW;
		M_NAME = m_NAME;
		M_GENDER = m_GENDER;
		E_MAIL = e_MAIL;
		M_PHONE = m_PHONE;
		M_ADDRESS = m_ADDRESS;
		M_CATEGORY = m_CATEGORY;
		M_age=age;
	
	}
	public MemberVo() {
		super();
	}
	public int getMNO() {
		return MNO;
	}
	public void setMNO(int mNO) {
		MNO = mNO;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public String getM_PW() {
		return M_PW;
	}
	public void setM_PW(String m_PW) {
		M_PW = m_PW;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}
	public char getM_GENDER() {
		return M_GENDER;
	}
	public void setM_GENDER(char m_GENDER) {
		M_GENDER = m_GENDER;
	}
	public String getE_MAIL() {
		return E_MAIL;
	}
	public void setE_MAIL(String e_MAIL) {
		E_MAIL = e_MAIL;
	}
	public String getM_PHONE() {
		return M_PHONE;
	}
	public void setM_PHONE(String m_PHONE) {
		M_PHONE = m_PHONE;
	}
	public String getM_ADDRESS() {
		return M_ADDRESS;
	}
	public void setM_ADDRESS(String m_ADDRESS) {
		M_ADDRESS = m_ADDRESS;
	}
	
	public String getM_CATEGORY() {
		return M_CATEGORY;
	}
	public void setM_CATEGORY(String m_CATEGORY) {
		M_CATEGORY = m_CATEGORY;
	}
	public Date getENTERDATE() {
		return ENTERDATE;
	}
	public void setENTERDATE(Date eNTERDATE) {
		ENTERDATE = eNTERDATE;
	}
	@Override
	public String toString(){
		return M_ID+M_NAME+M_GENDER+E_MAIL+M_PHONE+M_ADDRESS+M_CATEGORY+M_age;
		
	}
	
}
