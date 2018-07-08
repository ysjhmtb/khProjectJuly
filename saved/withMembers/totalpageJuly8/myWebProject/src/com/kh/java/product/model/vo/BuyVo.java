package com.kh.java.product.model.vo;

	public class BuyVo {
		private String bno;
		private String bnumber;
		private String m_name;
		private String payday;
		private String p_name;
		private int p_price;
		private int p_count;
		private int pno;
		
		public BuyVo() {
		}

		public BuyVo(String bno, String bnumber, String m_name, String payday, String p_name, int p_price, int p_count) {
			super();
			this.bno = bno;
			this.bnumber = bnumber;
			this.m_name = m_name;
			this.payday = payday;
			this.p_name = p_name;
			this.p_price = p_price;
			this.p_count = p_count;
		}
		
		

		public int getPno() {
			return pno;
		}

		public void setPno(int pno) {
			this.pno = pno;
		}

		public String getBno() {
			return bno;
		}

		public void setBno(String bno) {
			this.bno = bno;
		}

		public String getBnumber() {
			return bnumber;
		}

		public void setBnumber(String bnumber) {
			this.bnumber = bnumber;
		}

		public String getM_name() {
			return m_name;
		}

		public void setM_name(String m_name) {
			this.m_name = m_name;
		}

		public String getPayday() {
			return payday;
		}

		public void setPayday(String payday) {
			this.payday = payday;
		}

		public String getP_name() {
			return p_name;
		}

		public void setP_name(String p_name) {
			this.p_name = p_name;
		}

		public int getP_price() {
			return p_price;
		}

		public void setP_price(int p_price) {
			this.p_price = p_price;
		}

		public int getP_count() {
			return p_count;
		}

		public void setP_count(int p_count) {
			this.p_count = p_count;
		}
		
}
