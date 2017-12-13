package entity;

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
	
	public Bread(String productname, String description, int category, int value){
		this.productname = productname;
		this.description = description;
		this.category = category;
		this.value = value;
	}
	
	public Long getId(){
		return id;
	}

	public String getProductName(){
		return productname;
	}
	
	public String getDescription(){
		return description;
	}
	
	public int getCategory(){
		return category;
	}
	
	public int getValue(){
		return value;
	}
	
}
