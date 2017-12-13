package entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * Cartクラス
 * @author t15cs023
 *
 */
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Cart {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//Cartクラスの主キー
	private Long id;
	
	@Persistent
	//CartのユーザーのID
	private Long uid;
	
	@Persistent
	//Cartが確認されたかのflag
	private boolean checkedOut;
	
	/**
	 * Cartのコンストラクタ
	 * @param uid カートをもつユーザーのID
	 */
	public Cart(Long uid){
		this.uid = uid;
		this.checkedOut = false;
	}
	
	/**
	 * IDのgetter
	 * @return
	 */
	public Long getID(){
		return id;
	}
	
	/**
	 * CartのユーザーのIDのgetter
	 * @return
	 */
	public Long getUID(){
		return uid;
	}
	
	/**
	 * Cartが確認されたかのflagのgetter
	 * @return
	 */
	public boolean getCheckedOut() {
		return checkedOut;
	}
	
	/**
	 * Cartが確認されたら、状態を変更するためのsetter
	 * @param input
	 */
	public void setCheckedOut(boolean input) {
		this.checkedOut = input;
	}
}
