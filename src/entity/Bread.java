package entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import imageutil.ImageEntity;

/**
 * Breadクラス
 * @author t15cs028
 *
 */

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Bread {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//Breadクラスの主キー
	private Long id;
	
	//商品名
	@Persistent
	private String productname;
	
	//説明
	@Persistent
	private String description;
	
	//カテゴリー
	@Persistent
	private int category;
	
	//単価
	@Persistent
	private int value;
	
	@Persistent
	private ImageEntity image;
	
	/**
	 * Breadクラスのコンストラクタ
	 * @param productname
	 * @param description
	 * @param category
	 * @param value
	 */
	public Bread(String productname, String description, int category, int value){
		this.productname = productname;
		this.description = description;
		this.category = category;
		this.value = value;
	}
	
	/**
	 * 主キーのgetter
	 * @return
	 */
	public Long getId(){
		return id;
	}

	/**
	 * 商品名のgetter
	 * @return
	 */
	public String getProductName(){
		return productname;
	}
	
	/**
	 * 説明文のgetter
	 * @return
	 */
	public String getDescription(){
		return description;
	}
	
	/**
	 * カテゴリーのgetter
	 * @return
	 */
	public int getCategory(){
		return category;
	}
	
	/**
	 * 単価のgetter
	 * @return
	 */
	public int getValue(){
		return value;
	}
	
	public ImageEntity getImage() {
		return image;
	}
	
	public void setImage(ImageEntity image) {
		this.image = image;
	}
	/** 商品を編集するときに、setterを追加する必要があるかもしれない */
}
