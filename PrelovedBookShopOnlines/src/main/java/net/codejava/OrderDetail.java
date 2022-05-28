package net.codejava;

public class OrderDetail {

	int orderid;
	private String productName;
	private float subtotal;
	private float shipping;
	private float total;
	
	public OrderDetail() {
		
	}
	public OrderDetail(int orderid, String productName, String subtotal, String shipping, String total) {
		super();
		this.orderid = orderid;
		this.productName = productName;
		this.subtotal = Float.parseFloat(subtotal);
		this.shipping = Float.parseFloat(shipping);
		this.total = Float.parseFloat(total);
	}
	public int getOrderId() {
		return orderid;
	}
	public void setOrderId(int orderid) {
		this.orderid = orderid;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSubtotal() {
		return String.format("%.2f", subtotal);
	}

	public String getShipping() {
		return String.format("%.2f", shipping);
	}

	public void setTotal(float total) {
		this.total=total;
	}
	public String getTotal() {
		return String.format("%.2f", total);
	}

}
