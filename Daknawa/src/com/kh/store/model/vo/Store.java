package com.kh.store.model.vo;

public class Store {
	
	private int storeNo;		    //	STORE_NO NUMBER
	private String storeName;		//	STORE_NAME VARCHAR2(90)
	private String storeAddress;	//	STORE_ADDRESS VARCHAR2(300)
	private String storePhone;		//	STORE_PHONE CHAR(15)
	private String storeTime; 		//	STORE_TIME VARCHAR2(1000)
	private String mapLat;  		//	MAP_LAT VARCHAR2(15)
	private String mapLng;  		//	MAP_LNG VARCHAR2(15)
	private String brandNo;     	//	BRAND_NO VARCHAR(15) 
	private String brandName;
	private int startRow;
	private int endRow;
	
	public Store( ) { }

	public Store(int storeNo, String storeName, String storeAddress, String storePhone, String storeTime, String mapLat,
			String mapLng, String brandNo) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storeAddress = storeAddress;
		this.storePhone = storePhone;
		this.storeTime = storeTime;
		this.mapLat = mapLat;
		this.mapLng = mapLng;
		this.brandNo = brandNo;
	}
	
	
	public Store(String brandName) {
		super();
		this.brandName = brandName;
	}

	public Store(String storeName, String brandName, int startRow, int endRow) {
		super();
		this.storeName = storeName;
		this.brandName = brandName;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getStoreTime() {
		return storeTime;
	}

	public void setStoreTime(String storeTime) {
		this.storeTime = storeTime;
	}

	public String getMapLat() {
		return mapLat;
	}

	public void setMapLat(String mapLat) {
		this.mapLat = mapLat;
	}

	public String getMapLng() {
		return mapLng;
	}

	public void setMapLng(String mapLng) {
		this.mapLng = mapLng;
	}

	public String getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(String brandNo) {
		this.brandNo = brandNo;
	}
	
	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeName=" + storeName + ", storeAddress=" + storeAddress
				+ ", storePhone=" + storePhone + ", storeTime=" + storeTime + ", mapLat=" + mapLat + ", mapLng="
				+ mapLng + ", brandNo=" + brandNo + ", brandName=" + brandName + ", startRow=" + startRow + ", endRow="
				+ endRow + "]";
	}
	
	
	
	
	
	

}
