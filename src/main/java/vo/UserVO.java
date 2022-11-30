package vo;

public class UserVO {
	
//	-- table
//	create table "user"(
//		uidx varchar2(10) primary key,	-- 유저 고유번호
//		uname varchar2(20) not null,		-- 유저 이름
//		"uid" varchar2(20) not null,		-- 유저 아이디
//		upwd varchar2(20)  not null,		-- 유저 비밀번호
//		upostcode varchar2(50),		-- 유저 주소(우편번호)
//		uroadAddress varchar2(100),		-- 유저 주소(도로명 주소)
//		ujibunAddress varchar2(100),		-- 유저 주소(지번 주소)
//		udetailAddress varchar2(100),		-- 유저 주소(상세 주소)
//		uextraAddress varchar2(100),		-- 유저 주소(참고 항목)
//		uphone varchar2(12) not null,		-- 유저 핸드폰 번호
//		uemail varchar2(200),		-- 유저 이메일
//		ubirth varchar2(8) not null		-- 유저 생일
//	);
	
	// Field
	private String uidx;
	private String uname;
	private String uid;
	private String upwd;
	private String upostcode;
	private String uroadAddress;
	private String ujibunAddress;
	private String udetailAddress;
	private String uextraAddress;
	private String uphone;
	private String uemail;
	private String ubirth;
	
	// Getter/Setter
	public String getUpostcode() {
		return upostcode;
	}
	public void setUpostcode(String upostcode) {
		this.upostcode = upostcode;
	}
	public String getUroadAddress() {
		return uroadAddress;
	}
	public void setUroadAddress(String uroadAddress) {
		this.uroadAddress = uroadAddress;
	}
	public String getUjibunAddress() {
		return ujibunAddress;
	}
	public void setUjibunAddress(String ujibunAddress) {
		this.ujibunAddress = ujibunAddress;
	}
	public String getUdetailAddress() {
		return udetailAddress;
	}
	public void setUdetailAddress(String udetailAddress) {
		this.udetailAddress = udetailAddress;
	}
	public String getUextraAddress() {
		return uextraAddress;
	}
	public void setUextraAddress(String uextraAddress) {
		this.uextraAddress = uextraAddress;
	}
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	
	
}
