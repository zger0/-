package com.kh.menu.model.vo;

public class Menu {
//	
//	MENU_NO	NUMBER
//	MENU_NAME	VARCHAR2(90 BYTE)
//	MENU_PRICE	NUMBER
//	MENU_CATEGORY	VARCHAR2(90 BYTE)
//	STORE_NO	NUMBER

    private int menuNo;
    private String menuName;
    private int menuPrice;
    private String menuCategory;
    private int storeNo;
    private String menuDesc;
    private String img;
    private int view;

    public Menu() {}

	public Menu(int menuNo, String menuName, int menuPrice, String menuCategory, int storeNo, String menuDesc) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuCategory = menuCategory;
		this.storeNo = storeNo;
		this.menuDesc = menuDesc;
	}

	public Menu(int menuNo, String menuName, int menuPrice, String menuCategory, int storeNo, String menuDesc,
			String img) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuCategory = menuCategory;
		this.storeNo = storeNo;
		this.menuDesc = menuDesc;
		this.img = img;
	}
	
	public Menu(int menuNo, String menuName, int menuPrice, String menuCategory, int storeNo, String menuDesc,
			int view) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuCategory = menuCategory;
		this.storeNo = storeNo;
		this.menuDesc = menuDesc;
		this.view = view;
	}

	public Menu(int menuNo, String menuName, int menuPrice, String menuCategory, int storeNo, String menuDesc,
			String img, int view) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuCategory = menuCategory;
		this.storeNo = storeNo;
		this.menuDesc = menuDesc;
		this.img = img;
		this.view = view;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuCategory() {
		return menuCategory;
	}

	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getMenuDesc() {
		return menuDesc;
	}

	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuCategory="
				+ menuCategory + ", storeNo=" + storeNo + ", menuDesc=" + menuDesc + ", img=" + img + ", view=" + view
				+ "]";
	}

	
}
    
	