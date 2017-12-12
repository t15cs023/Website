package util;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Bread {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//Breadクラスの主キー
	private Long id;
	
	@Persistent
	private String productname;
	
	@Persistent
	private String description;
	
	@Persistent
	private int category;
	
	@Persistent
	private int value;
	
	public Bread(Long id, String productname, String discription, int category, int value){
		this.id = id;
		this.productname = productname;
		this.description = discription;
		this.category = category;
		this.value = value;
	}
	
	public Long getId(){
		return id;
	}

	public String getProductName(){
		return productname;
	}
	
	public String getDiscription(){
		return description;
	}
	
	public int getCategory(){
		return category;
	}
	
	public int getValue(){
		return value;
	}
	
}