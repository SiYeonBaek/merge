package vo;

public class OrderVO {
//	oidx varchar2(10) primary key,	-- 주문 번호
//	uidx varchar2(10),				-- 유저 고유 번호
//	pidx varchar2(10),			-- 상품 고유 번호
//	oadultcount number(10),		-- 성인 인원수
//	okidscount number(10),		-- 어린이 인원수
//	ototprice INTEGER			-- 총 상품 가격
	private String oidx;
	private String uidx;
	private String pidx;
	private int oadultcount;
	private int okidscount;
	private int ototprice;
	
	public String getOidx() {
		return oidx;
	}
	public void setOidx(String oidx) {
		this.oidx = oidx;
	}
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public String getPidx() {
		return pidx;
	}
	public void setPidx(String pidx) {
		this.pidx = pidx;
	}
	public int getOadultcount() {
		return oadultcount;
	}
	public void setOadultcount(int oadultcount) {
		this.oadultcount = oadultcount;
	}
	public int getOkidscount() {
		return okidscount;
	}
	public void setOkidscount(int okidscount) {
		this.okidscount = okidscount;
	}
	public int getOtotprice() {
		return ototprice;
	}
	public void setOtotprice(int ototprice) {
		this.ototprice = ototprice;
	}
}
