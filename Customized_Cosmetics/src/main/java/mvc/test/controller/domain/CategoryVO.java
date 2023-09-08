package mvc.test.controller.domain;

public class CategoryVO {
	
	
	/*
	 * cateName varchar2(20) not null,
	 * cateCode varcahr2(30) not null,
	 * cateCodeRef varchar2(30) null,
	 */
	private String cateName;
	private String cateCode;
	private String CateCodeRef;
	private int level;
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return CateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		CateCodeRef = cateCodeRef;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
