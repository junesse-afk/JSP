package JSP10_jdbc2;

public class ProductDTO {

	private int product_id;
	private String product_name;
	private int product_price;
	private int product_qty;
	private String product_img;
	
	public ProductDTO() {
		
	}
	
	public ProductDTO(int idx, String name, int price, int qty, String img) {
		this.product_id = idx;
		this.product_name = name;
		this.product_price = price;
		this.product_qty = qty;
		this.product_img = img;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_qty=" + product_qty + ", product_img=" + product_img + "]";
	}
	
	
}
